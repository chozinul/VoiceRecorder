//
//  Recorder.m
//  VoiceRecorder
//
//  Created by Muchamad Chozinul Amri on 5/5/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(Recorder, RCTEventEmitter)

RCT_EXTERN_METHOD(isRecorderAllowed:(RCTResponseSenderBlock) callback)

RCT_EXTERN_METHOD(activateMicrophone)

RCT_EXTERN_METHOD(deactivateMicrophone)

@end

