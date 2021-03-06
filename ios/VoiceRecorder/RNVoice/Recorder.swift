//
//  Recorder.swift
//  VoiceRecorder
//
//  Created by Muchamad Chozinul Amri on 5/5/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

@objc(Recorder)
class Recorder: RCTEventEmitter {
  
  var audioEngine : AVAudioEngine!
  var audioFile : AVAudioFile!
  var audioPlayer : AVAudioPlayerNode!
  var outputFormat: AVAudioFormat!
  let bus = 0
  var shouldSentData = false
  
  override init() {
    self.audioEngine = AVAudioEngine()
    self.outputFormat = Configuration.outputFormat
  }
  
  @objc
  override static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  override func supportedEvents() -> [String]! {
    return [kEventReceiveMicrophoneData]
  }
  
  override func startObserving(){
    shouldSentData = true
  }
  
  override func stopObserving(){
    shouldSentData = false
  }
  
  @objc
  func isRecorderAllowed(_ callback: @escaping RCTResponseSenderBlock){
    if AVCaptureDevice.authorizationStatus(for: AVMediaType.audio) != .authorized {
      AVCaptureDevice
        .requestAccess(for: AVMediaType.audio,
                       completionHandler: {
                        (granted: Bool) in
                        callback([granted])
        })
    }else {
      callback([true])
    }
  }
  
  @objc
  func activateMicrophone() {
    startRecord()
  }
  
  func startRecord() {
    
    prepareSession()
    
    let format = deviceFormat()
    self.audioEngine.inputNode.installTap(onBus: bus, bufferSize: AVAudioFrameCount(1024), format: format, block: {
      [weak self] (buffer: AVAudioPCMBuffer!, time: AVAudioTime!) -> Void in
      if let arr = self?.convertBuffer(format: format, buffer: buffer) {
        self?.sendData(arr: arr as NSArray)
      }
    })
    
    executeStart()
  }
  
  func prepareSession() {
    try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
    try! AVAudioSession.sharedInstance().setActive(true)
  }
  
  func deviceFormat() -> AVAudioFormat {
    let format = self.audioEngine.inputNode.inputFormat(forBus: bus)
    return format
  }
  
  func convertBuffer(format:AVAudioFormat, buffer:AVAudioPCMBuffer) -> Array<UInt8>{
    let converter = AVAudioConverter(from: format, to: outputFormat)!
    let ratio: Double = format.sampleRate/outputFormat.sampleRate
    let capacity = UInt32(Double(buffer.frameCapacity)/ratio)
    let convertedBuffer = AVAudioPCMBuffer(pcmFormat: outputFormat, frameCapacity: capacity)!
    let inputBlock: AVAudioConverterInputBlock = { inNumPackets, outStatus in
      outStatus.pointee = AVAudioConverterInputStatus.haveData
      return buffer
    }
    var error: NSError? = nil
    _ = converter.convert(to: convertedBuffer, error: &error, withInputFrom: inputBlock)
    
    let data = self.toNSData(buffer: convertedBuffer)
    let byteCount = data.length
    let bytes = data.bytes
    var arr = Array<UInt8>()
    let bufferPointer = UnsafeRawBufferPointer(start: bytes, count: byteCount)
    for (_, byte) in bufferPointer.enumerated() {
      arr.append(byte)
    }
    return arr
  }
  
  func executeStart() {
    self.audioEngine.prepare()
    try! self.audioEngine.start()
  }
  
  func toNSData(buffer: AVAudioPCMBuffer) -> NSData {
    let audioBuffer = buffer.audioBufferList.pointee.mBuffers
    let ch0Data = NSData(bytes: audioBuffer.mData!, length:Int(audioBuffer.mDataByteSize))
    return ch0Data
  }
  
  func sendData(arr: NSArray) {
    if shouldSentData {
      sendEvent(withName: kEventReceiveMicrophoneData, body: arr)
    }
  }
  
  @objc
  func deactivateMicrophone() {
    self.stopRecord()
  }
  
  func stopRecord() {
    self.audioEngine.stop()
    self.audioEngine.reset()
    self.audioEngine.inputNode.reset()
    self.audioEngine.inputNode.removeTap(onBus: bus)
    try! AVAudioSession.sharedInstance().setActive(false)
  }
  
}
