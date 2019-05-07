//
//  ConfigurationTests.swift
//  VoiceRecorderTests
//
//  Created by Muchamad Chozinul Amri on 7/5/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import XCTest
@testable import VoiceRecorder

class FileText: XCTestCase {
  
  
  
  override func setUp() {
    
  }
  
  func testOpenFile(){
    let file = File()
    XCTAssertNil(file.outref)
    file.openFile()
    XCTAssertNotNil(file.outref)
    file.closeFile()
  }
  
  func testWriteFile() {
    let file = File()
    XCTAssertNil(file.outref)
    file.openFile()
    XCTAssertNotNil(file.outref)
    file.writeToFile(getArray())
    file.closeFile()
    
    let filePath: String = Configuration.filePath
    let fileSize : UInt64
    do {
      let attr = try FileManager.default.attributesOfItem(atPath: filePath)
      fileSize = attr[FileAttributeKey.size] as! UInt64
      XCTAssertGreaterThan(fileSize, 5000, "can write to file")
    } catch {
      XCTAssertFalse(true)
    }
  }
  
  func testCloseFile() {
    let file = File()
    XCTAssertNil(file.outref)
    file.openFile()
    XCTAssertNotNil(file.outref)
    file.closeFile()
    file.writeToFile(getArray())
    let filePath: String = Configuration.filePath
    let fileSize : UInt64
    do {
      let attr = try FileManager.default.attributesOfItem(atPath: filePath)
      fileSize = attr[FileAttributeKey.size] as! UInt64
      XCTAssertLessThan(fileSize, 5000, "can write to file")
    } catch {
      XCTAssertFalse(true)
    }
  }
  
  func getArray() -> Array<UInt8> {
    return [136, 251, 231, 255, 189, 17, 222, 255, 40, 62, 246, 255, 173, 79, 252, 255, 195, 112, 237, 255, 45, 111, 220, 255, 197, 180, 231, 255, 234, 115, 0, 0, 55, 205, 251, 255, 1, 161, 232, 255, 15, 77, 223, 255, 30, 239, 220, 255, 195, 197, 225, 255, 203, 148, 234, 255, 225, 245, 226, 255, 19, 9, 224, 255, 161, 183, 251, 255, 160, 53, 251, 255, 164, 141, 232, 255, 20, 113, 231, 255, 93, 155, 239, 255, 142, 253, 253, 255, 183, 217, 0, 0, 150, 138, 242, 255, 216, 231, 245, 255, 223, 81, 242, 255, 72, 134, 248, 255, 106, 240, 4, 0, 30, 53, 0, 0, 102, 123, 251, 255, 156, 86, 1, 0, 30, 209, 10, 0, 215, 135, 0, 0, 183, 205, 255, 255, 74, 85, 254, 255, 86, 130, 254, 255, 42, 191, 5, 0, 189, 79, 11, 0, 133, 127, 24, 0, 59, 43, 40, 0, 183, 202, 41, 0, 75, 200, 11, 0, 38, 221, 248, 255, 93, 142, 18, 0, 215, 137, 35, 0, 248, 227, 19, 0, 38, 42, 10, 0, 168, 252, 17, 0, 26, 249, 30, 0, 2, 169, 23, 0, 84, 145, 5, 0, 235, 34, 9, 0, 118, 52, 15, 0, 80, 123, 21, 0, 155, 239, 27, 0, 127, 180, 9, 0, 123, 84, 251, 255, 41, 255, 0, 0, 253, 83, 250, 255, 251, 243, 254, 255, 173, 63, 9, 0, 130, 217, 253, 255, 45, 245, 249, 255, 70, 54, 8, 0, 86, 188, 15, 0, 115, 194, 8, 0, 45, 29, 245, 255, 149, 42, 237, 255, 152, 152, 233, 255, 23, 13, 232, 255, 129, 215, 235, 255, 250, 251, 219, 255, 62, 216, 227, 255, 199, 209, 8, 0, 72, 8, 16, 0, 143, 97, 247, 255, 194, 86, 239, 255, 218, 130, 242, 255, 88, 206, 1, 0, 221, 114, 10, 0, 62, 180, 1, 0, 213, 192, 241, 255, 89, 119, 232, 255, 96, 255, 246, 255, 35, 212, 0, 0, 238, 117, 245, 255, 142, 57, 218, 255, 156, 248, 225, 255, 56, 188, 255, 255, 131, 151, 0, 0, 220, 92, 4, 0, 20, 242, 249, 255, 81, 12, 220, 255, 107, 242, 241, 255, 163, 79, 9, 0, 180, 130, 247, 255, 157, 193, 242, 255, 201, 237, 252, 255, 126, 73, 251, 255, 132, 64, 247, 255, 176, 216, 253, 255, 188, 197, 4, 0, 96, 171, 22, 0, 211, 146, 42, 0, 204, 128, 40, 0, 106, 212, 25, 0, 19, 221, 18, 0, 63, 225, 32, 0, 150, 173, 45, 0, 59, 155, 38, 0, 65, 147, 23, 0, 87, 160, 250, 255, 114, 53, 252, 255, 237, 156, 24, 0, 228, 8, 30, 0, 143, 82, 16, 0, 127, 186, 253, 255, 157, 239, 249, 255, 10, 108, 5, 0, 210, 146, 12, 0, 214, 206, 3, 0, 220, 22, 255, 255, 3, 113, 3, 0, 36, 58, 0, 0, 92, 152, 243, 255, 107, 221, 218, 255, 9, 248, 216, 255, 172, 133, 248, 255, 175, 35, 252, 255, 135, 90, 233, 255, 52, 69, 222, 255, 42, 6, 231, 255, 36, 198, 4, 0, 206, 39, 14, 0, 177, 8, 0, 0, 31, 200, 245, 255, 120, 181, 247, 255, 14, 220, 254, 255, 201, 34, 255, 255, 208, 104, 249, 255, 252, 223, 237, 255, 206, 216, 248, 255, 150, 123, 1, 0, 36, 172, 248, 255, 236, 79, 254, 255, 115, 104, 248, 255, 129, 239, 246, 255, 156, 78, 8, 0, 18, 209, 7, 0, 188, 44, 14, 0, 17, 183, 7, 0, 125, 138, 243, 255, 139, 38, 1, 0, 41, 186, 15, 0, 121, 98, 22, 0, 89, 129, 21, 0, 118, 135, 5, 0, 175, 62, 7, 0, 208, 15, 12, 0, 243, 213, 22, 0, 140, 44, 28, 0, 86, 236, 14, 0, 166, 43, 11, 0, 177, 29, 17, 0, 107, 41, 15, 0, 24, 232, 33, 0, 45, 239, 47, 0, 148, 59, 28, 0, 4, 252, 11, 0, 179, 85, 9, 0, 193, 57, 4, 0, 60, 55, 1, 0, 166, 151, 4, 0, 253, 88, 10, 0, 159, 90, 14, 0, 247, 245, 13, 0, 82, 8, 7, 0, 0, 136, 250, 255, 213, 180, 253, 255, 0, 87, 14, 0, 14, 90, 15, 0, 153, 252, 5, 0, 141, 125, 251, 255, 180, 68, 242, 255, 33, 158, 241, 255, 72, 129, 232, 255, 218, 105, 213, 255, 119, 220, 205, 255, 14, 51, 210, 255, 253, 47, 239, 255, 112, 14, 11, 0, 42, 57, 254, 255, 3, 179, 228, 255, 196, 156, 241, 255, 90, 81, 16, 0, 40, 38, 26, 0, 235, 107, 249, 255, 225, 200, 213, 255, 133, 136, 221, 255, 233, 139, 233, 255, 18, 34, 230, 255, 45, 174, 223, 255, 168, 246, 216, 255, 157, 212, 219, 255, 97, 113, 248, 255, 26, 45, 0, 0, 4, 49, 246, 255, 142, 68, 244, 255, 169, 172, 2, 0, 205, 220, 25, 0, 81, 174, 17, 0, 149, 198, 236, 255, 35, 168, 209, 255, 17, 20, 202, 255, 53, 89, 209, 255, 223, 74, 217, 255, 115, 230, 229, 255, 202, 15, 237, 255, 135, 59, 243, 255, 179, 246, 15, 0, 222, 73, 33, 0, 205, 210, 32, 0, 90, 18, 43, 0, 3, 26, 55, 0, 227, 235, 45, 0, 245, 227, 32, 0, 104, 88, 27, 0, 49, 78, 17, 0, 99, 8, 12, 0, 233, 165, 2, 0, 80, 78, 237, 255, 150, 113, 235, 255, 194, 114, 249, 255, 46, 234, 2, 0, 35, 72, 15, 0, 83, 214, 17, 0, 66, 115, 22, 0, 87, 172, 23, 0, 25, 5, 252, 255, 16, 90, 239, 255, 179, 28, 240, 255, 2, 248, 233, 255, 109, 255, 236, 255, 88, 95, 243, 255, 1, 145, 238, 255, 63, 211, 231, 255, 79, 14, 235, 255, 241, 65, 224, 255, 169, 201, 232, 255, 222, 45, 14, 0, 107, 52, 25, 0, 62, 26, 22, 0, 33, 54, 16, 0, 124, 202, 4, 0, 48, 68, 13, 0, 51, 219, 22, 0, 242, 228, 6, 0, 26, 161, 232, 255, 115, 7, 223, 255, 235, 121, 233, 255, 117, 42, 242, 255, 178, 107, 244, 255, 221, 183, 238, 255, 28, 207, 2, 0, 105, 236, 26, 0, 79, 63, 20, 0, 155, 125, 9, 0, 163, 88, 12, 0, 227, 74, 13, 0, 32, 76, 8, 0, 60, 159, 14, 0, 237, 209, 9, 0, 69, 223, 250, 255, 196, 47, 255, 255, 166, 115, 5, 0, 161, 14, 15, 0, 174, 79, 8, 0, 175, 87, 3, 0, 108, 246, 22, 0, 12, 24, 48, 0, 24, 216, 58, 0, 60, 132, 41, 0, 240, 241, 18, 0, 36, 55, 18, 0, 250, 213, 16, 0, 80, 2, 15, 0, 168, 175, 19, 0, 210, 110, 13, 0, 36, 201, 6, 0, 246, 242, 7, 0, 202, 180, 10, 0, 187, 241, 5, 0, 131, 160, 3, 0, 130, 203, 15, 0, 127, 103, 29, 0, 85, 249, 21, 0, 119, 74, 0, 0, 125, 136, 248, 255, 0, 254, 255, 255, 117, 137, 249, 255, 175, 221, 242, 255, 83, 200, 234, 255, 179, 38, 233, 255, 182, 128, 230, 255, 252, 103, 227, 255, 114, 198, 234, 255, 148, 137, 229, 255, 114, 189, 238, 255, 51, 59, 252, 255, 194, 28, 248, 255, 180, 230, 242, 255, 248, 171, 241, 255, 74, 218, 243, 255, 33, 114, 234, 255, 189, 78, 229, 255, 116, 151, 230, 255, 169, 231, 222, 255, 25, 173, 221, 255, 73, 85, 219, 255, 30, 142, 230, 255, 4, 123, 251, 255, 110, 22, 239, 255, 165, 213, 241, 255, 190, 86, 253, 255, 3, 164, 243, 255, 25, 16, 9, 0, 95, 57, 9, 0, 157, 207, 239, 255, 193, 10, 245, 255, 181, 127, 235, 255, 254, 114, 234, 255, 247, 212, 252, 255, 38, 182, 253, 255, 193, 84, 249, 255, 148, 64, 249, 255, 165, 157, 9, 0, 187, 82, 20, 0, 134, 0, 32, 0, 70, 207, 29, 0, 211, 8, 29, 0, 197, 233, 33, 0, 8, 202, 25, 0, 12, 246, 22, 0, 108, 231, 18, 0, 88, 123, 7, 0, 18, 170, 11, 0, 67, 2, 2, 0, 84, 68, 239, 255, 101, 248, 244, 255, 218, 192, 14, 0, 185, 60, 29, 0, 39, 35, 23, 0, 124, 138, 8, 0, 4, 8, 250, 255, 113, 59, 248, 255, 43, 217, 0, 0, 253, 254, 0, 0, 253, 131, 254, 255, 212, 81, 239, 255, 100, 10, 232, 255, 65, 63, 237, 255, 33, 20, 234, 255, 47, 60, 233, 255, 191, 124, 230, 255, 102, 188, 240, 255, 68, 119, 11, 0, 176, 26, 19, 0, 111, 103, 23, 0, 4, 88, 17, 0, 175, 166, 254, 255, 242, 165, 239, 255, 192, 138, 248, 255, 185, 29, 8, 0, 115, 62, 248, 255, 156, 215, 231, 255, 91, 7, 232, 255, 204, 22, 235, 255, 129, 220, 239, 255, 148, 190, 242, 255, 92, 178, 243, 255, 217, 4, 242, 255, 66, 240, 249, 255, 53, 34, 6, 0, 184, 39, 0, 0, 87, 171, 252, 255, 161, 46, 248, 255, 168, 253, 252, 255, 183, 169, 12, 0, 223, 63, 4, 0, 202, 255, 246, 255, 41, 94, 251, 255, 204, 100, 7, 0, 90, 71, 25, 0, 117, 55, 39, 0, 89, 126, 30, 0, 0, 0, 11, 0, 170, 206, 23, 0, 227, 7, 45, 0, 11, 45, 34, 0, 64, 206, 28, 0, 183, 239, 12, 0, 31, 187, 20, 0, 55, 110, 42, 0, 4, 36, 28, 0, 183, 63, 21, 0, 0, 26, 28, 0, 14, 195, 36, 0, 68, 124, 32, 0, 208, 71, 9, 0, 53, 224, 8, 0, 107, 237, 8, 0, 97, 71, 10, 0, 71, 130, 18, 0, 35, 213, 12, 0, 245, 174, 13, 0, 70, 218, 3, 0, 226, 77, 254, 255, 174, 183, 13, 0, 175, 251, 4, 0, 44, 100, 254, 255, 115, 94, 248, 255, 116, 222, 239, 255, 185, 131, 254, 255, 16, 219, 244, 255, 229, 50, 225, 255, 42, 81, 224, 255, 0, 156, 237, 255, 37, 75, 255, 255, 230, 158, 0, 0, 124, 20, 224, 255, 252, 125, 196, 255, 109, 7, 212, 255, 29, 65, 229, 255, 19, 222, 226, 255, 191, 126, 221, 255, 36, 49, 219, 255, 106, 143, 229, 255, 193, 219, 235, 255, 123, 178, 227, 255, 32, 234, 220, 255, 4, 62, 228, 255, 137, 15, 240, 255, 196, 24, 241, 255, 44, 206, 248, 255, 32, 253, 244, 255, 203, 119, 240, 255, 188, 185, 243, 255, 0, 41, 237, 255, 123, 233, 242, 255, 89, 67, 235, 255, 231, 91, 232, 255, 229, 33, 253, 255, 94, 0, 15, 0, 248, 87, 21, 0, 98, 67, 13, 0, 97, 146, 7, 0, 138, 240, 23, 0, 153, 10, 33, 0, 163, 185, 22, 0, 34, 68, 7, 0, 176, 164, 1, 0, 234, 80, 10, 0, 140, 15, 27, 0, 87, 238, 21, 0, 122, 172, 2, 0, 79, 94, 0, 0, 177, 89, 15, 0, 148, 22, 12, 0, 210, 221, 247, 255, 20, 38, 248, 255, 222, 115, 2, 0, 246, 72, 10, 0, 203, 214, 21, 0, 57, 153, 19, 0, 47, 102, 255, 255, 209, 6, 252, 255, 41, 56, 3, 0, 118, 20, 8, 0, 64, 37, 245, 255, 130, 210, 232, 255, 46, 186, 233, 255, 164, 47, 242, 255, 7, 202, 13, 0, 90, 243, 4, 0, 149, 103, 235, 255, 9, 151, 239, 255, 139, 204, 251, 255, 73, 175, 11, 0, 186, 183, 17, 0, 188, 223, 16, 0, 12, 188, 8, 0, 152, 83, 4, 0, 134, 105, 253, 255, 185, 56, 231, 255, 67, 199, 216, 255, 34, 74, 218, 255, 125, 231, 238, 255, 107, 58, 253, 255, 128, 177, 251, 255, 243, 64, 2, 0, 249, 197, 6, 0, 136, 110, 13, 0, 93, 220, 18, 0, 49, 241, 20, 0, 59, 155, 16, 0, 78, 41, 11, 0, 134, 236, 2, 0, 161, 154, 243, 255, 43, 241, 244, 255, 235, 61, 254, 255, 167, 6, 16, 0, 46, 20, 37, 0, 53, 175, 41, 0, 72, 33, 34, 0, 75, 193, 28, 0, 10, 138, 25, 0, 138, 202, 32, 0, 40, 120, 44, 0, 46, 11, 34, 0, 35, 187, 253, 255, 145, 182, 247, 255, 65, 59, 2, 0, 156, 71, 5, 0, 33, 139, 14, 0, 234, 86, 15, 0, 164, 117, 9, 0, 247, 173, 13, 0, 221, 192, 15, 0, 13, 7, 5, 0, 68, 6, 9, 0, 217, 127, 24, 0, 149, 33, 7, 0, 65, 0, 249, 255, 91, 4, 3, 0, 221, 66, 252, 255, 6, 135, 250, 255, 106, 162, 246, 255, 247, 255, 221, 255, 48, 115, 218, 255, 95, 97, 226, 255, 211, 167, 219, 255, 7, 140, 214, 255, 150, 229, 228, 255, 39, 204, 253, 255, 98, 46, 20, 0, 180, 228, 29, 0, 62, 183, 5, 0, 178, 247, 246, 255, 158, 72, 3, 0, 96, 102, 249, 255, 180, 22, 226, 255, 3, 142, 212, 255, 155, 226, 205, 255, 13, 202, 225, 255, 102, 129, 0, 0, 118, 182, 7, 0, 216, 234, 6, 0, 193, 97, 15, 0, 224, 155, 5, 0, 80, 158, 0, 0, 43, 25, 3, 0, 11, 46, 238, 255, 29, 76, 213, 255, 237, 78, 210, 255, 5, 194, 198, 255, 129, 129, 191, 255, 160, 220, 210, 255, 45, 197, 232, 255, 63, 218, 10, 0, 239, 48, 43, 0, 119, 123, 33, 0, 218, 165, 36, 0, 124, 194, 51, 0, 85, 212, 38, 0, 42, 215, 25, 0, 205, 1, 2, 0, 52, 217, 225, 255, 13, 119, 241, 255, 184, 76, 17, 0, 14, 175, 17, 0, 15, 192, 10, 0, 204, 204, 11, 0, 202, 58, 24, 0, 163, 104, 44, 0, 160, 201, 65, 0, 138, 34, 57, 0, 27, 190, 30, 0, 66, 143, 7, 0, 251, 242, 236, 255, 179, 14, 206, 255, 143, 253, 205, 255, 207, 9, 218, 255, 232, 176, 217, 255, 85, 235, 223, 255, 90, 82, 226, 255, 249, 24, 242, 255, 200, 180, 18, 0, 211, 157, 16, 0, 142, 59, 8, 0, 143, 145, 17, 0, 23, 95, 9, 0, 236, 129, 247, 255, 20, 21, 239, 255, 85, 61, 222, 255, 25, 0, 211, 255, 22, 138, 220, 255, 110, 20, 230, 255, 123, 97, 247, 255, 9, 125, 8, 0, 108, 61, 24, 0, 137, 213, 23, 0, 33, 234, 246, 255, 174, 115, 236, 255, 255, 238, 241, 255, 144, 198, 249, 255, 235, 70, 239, 255, 151, 190, 218, 255, 89, 33, 234, 255, 119, 2, 243, 255, 83, 199, 248, 255, 55, 153, 13, 0, 72, 103, 20, 0, 96, 79, 33, 0, 176, 201, 34, 0, 201, 106, 19, 0, 77, 186, 5, 0, 78, 194, 5, 0, 92, 37, 22, 0, 22, 185, 11, 0, 202, 175, 17, 0, 149, 102, 27, 0, 30, 168, 15, 0, 44, 222, 41, 0, 153, 166, 53, 0, 102, 233, 55, 0, 80, 248, 52, 0, 69, 130, 34, 0, 78, 81, 30, 0, 46, 127, 3, 0, 94, 87, 252, 255, 86, 176, 11, 0, 170, 91, 251, 255, 10, 217, 245, 255, 136, 66, 250, 255, 210, 20, 4, 0, 172, 127, 18, 0, 232, 155, 21, 0, 254, 238, 23, 0, 228, 127, 23, 0, 86, 149, 29, 0, 209, 93, 28, 0, 251, 22, 21, 0, 236, 158, 7, 0, 86, 141, 255, 255, 17, 47, 240, 255, 31, 49, 216, 255, 235, 79, 197, 255, 94, 46, 187, 255, 38, 102, 193, 255, 198, 158, 200, 255, 102, 59, 226, 255, 233, 112, 6, 0, 168, 81, 43, 0, 165, 5, 68, 0, 74, 69, 66, 0, 96, 132, 42, 0, 90, 74, 250, 255, 25, 154, 203, 255, 159, 246, 168, 255, 245, 1, 153, 255, 116, 191, 157, 255, 198, 13, 179, 255, 246, 52, 222, 255, 151, 251, 14, 0, 102, 75, 48, 0, 8, 237, 81, 0, 136, 160, 95, 0, 232, 126, 58, 0, 135, 79, 5, 0, 31, 77, 223, 255, 205, 246, 174, 255, 200, 250, 129, 255, 136, 119, 131, 255, 44, 225, 151, 255, 57, 141, 210, 255, 143, 254, 29, 0, 45, 184, 54, 0, 32, 116, 67, 0, 173, 14, 96, 0, 220, 111, 89, 0, 87, 180, 56, 0, 255, 62, 36, 0, 152, 223, 241, 255, 172, 31, 190, 255, 216, 119, 197, 255, 49, 240, 220, 255, 2, 13, 235, 255, 215, 18, 19, 0, 224, 229, 48, 0, 93, 125, 62, 0, 65, 88, 63, 0, 118, 248, 35, 0, 89, 25, 11, 0, 91, 179, 244, 255, 221, 246, 225, 255, 31, 65, 200, 255, 98, 97, 193, 255, 240, 240, 187, 255, 142, 18, 191, 255, 94, 229, 232, 255, 65, 93, 7, 0, 23, 128, 10, 0, 80, 38, 254, 255, 250, 142, 246, 255, 147, 107, 18, 0, 51, 55, 43, 0, 167, 123, 20, 0, 81, 248, 239, 255, 107, 229, 234, 255, 74, 149, 255, 255, 36, 13, 17, 0, 89, 93, 5, 0, 36, 113, 232, 255, 205, 74, 242, 255, 249, 151, 24, 0, 198, 254, 45, 0, 186, 167, 35, 0, 208, 232, 11, 0, 179, 118, 240, 255, 229, 202, 222, 255, 81, 247, 223, 255, 82, 103, 220, 255, 185, 245, 216, 255, 150, 3, 233, 255, 131, 240, 247, 255, 144, 58, 5, 0, 239, 44, 16, 0, 3, 37, 1, 0, 144, 61, 249, 255, 94, 243, 14, 0, 226, 79, 28, 0, 63, 53, 34, 0, 18, 223, 50, 0, 184, 187, 36, 0, 185, 155, 15, 0, 142, 86, 19, 0, 177, 113, 26, 0, 223, 197, 30, 0, 11, 107, 34, 0, 9, 166, 16, 0, 34, 52, 252, 255, 168, 3, 1, 0, 103, 207, 26, 0, 193, 208, 54, 0, 44, 241, 62, 0, 214, 164, 48, 0, 213, 144, 23, 0, 203, 86, 1, 0, 39, 109, 233, 255, 53, 222, 211, 255, 250, 242, 212, 255, 223, 171, 223, 255, 152, 226, 232, 255, 216, 208, 240, 255, 115, 222, 240, 255, 175, 17, 2, 0, 119, 52, 44, 0, 144, 17, 60, 0, 48, 87, 55, 0, 110, 247, 47, 0, 115, 62, 17, 0, 81, 208, 254, 255, 247, 113, 247, 255, 219, 200, 234, 255, 0, 10, 213, 255, 118, 213, 183, 255, 72, 34, 170, 255, 213, 126, 177, 255, 37, 208, 209, 255, 104, 252, 5, 0, 195, 214, 61, 0, 204, 28, 92, 0, 177, 169, 73, 0, 203, 11, 57, 0, 93, 241, 38, 0, 192, 130, 237, 255, 118, 124, 189, 255, 68, 244, 157, 255, 167, 191, 135, 255, 102, 56, 145, 255, 122, 117, 197, 255, 228, 41, 254, 255, 44, 199, 36, 0, 202, 26, 63, 0, 156, 245, 67, 0, 105, 212, 82, 0, 79, 103, 67, 0, 216, 71, 9, 0, 70, 160, 220, 255, 254, 205, 173, 255, 236, 90, 148, 255, 2, 207, 150, 255, 94, 99, 174, 255, 223, 238, 223, 255, 130, 90, 23, 0, 146, 6, 67, 0, 56, 62, 87, 0, 254, 255, 107, 0, 37, 207, 123, 0, 129, 44, 79, 0, 250, 171, 25, 0, 235, 158, 240, 255, 94, 31, 210, 255, 21, 141, 219, 255, 228, 112, 220, 255, 79, 232, 210, 255, 240, 244, 222, 255, 228, 183, 14, 0, 196, 226, 50, 0, 213, 90, 37, 0, 207, 140, 8, 0, 57, 246, 236, 255, 201, 107, 240, 255, 115, 242, 254, 255, 27, 242, 235, 255, 34, 240, 204, 255, 98, 47, 180, 255, 212, 58, 180, 255, 44, 199, 213, 255, 52, 164, 229, 255, 106, 167, 215, 255, 107, 11, 235, 255, 3, 193, 31, 0, 186, 179, 49, 0, 40, 211, 46, 0, 66, 13, 33, 0, 17, 251, 18, 0, 73, 124, 12, 0, 133, 165, 247, 255, 26, 185, 218, 255, 36, 181, 216, 255, 1, 1, 235, 255, 242, 94, 1, 0, 156, 109, 0, 0, 205, 200, 255, 255, 2, 16, 6, 0, 104, 171, 16, 0, 2, 210, 17, 0, 241, 243, 4, 0, 206, 30, 247, 255, 67, 87, 225, 255, 215, 185, 213, 255, 182, 68, 219, 255, 250, 143, 221, 255, 175, 39, 230, 255, 227, 73, 248, 255, 198, 57, 9, 0, 181, 0, 36, 0, 150, 197, 49, 0, 120, 228, 49, 0, 11, 205, 44, 0, 123, 179, 42, 0, 211, 16, 41, 0, 180, 51, 11, 0, 246, 27, 248, 255, 138, 180, 250, 255, 99, 73, 244, 255, 0, 71, 0, 0, 14, 176, 22, 0, 250, 23, 29, 0, 60, 63, 50, 0, 155, 108, 59, 0, 117, 225, 57, 0, 22, 209, 54, 0, 65, 99, 35, 0, 134, 199, 22, 0, 68, 2, 246, 255, 110, 126, 221, 255, 139, 97, 239, 255, 215, 208, 243, 255, 120, 219, 241, 255, 3, 247, 240, 255, 131, 120, 238, 255, 74, 65, 1, 0, 233, 170, 43, 0, 78, 139, 70, 0, 19, 187, 60, 0, 45, 85, 40, 0, 220, 112, 26, 0, 42, 66, 12, 0, 51, 91, 248, 255, 253, 5, 236, 255, 90, 39, 233, 255, 222, 22, 233, 255, 186, 244, 232, 255, 88, 229, 218, 255, 42, 158, 199, 255, 64, 61, 202, 255, 41, 19, 226, 255, 190, 122, 243, 255, 217, 226, 7, 0, 109, 238, 20, 0, 141, 170, 7, 0, 246, 30, 15, 0, 74, 55, 24, 0, 156, 163, 6, 0, 165, 116, 235, 255, 47, 103, 199, 255, 239, 180, 186, 255, 219, 151, 189, 255, 8, 109, 210, 255, 100, 238, 242, 255, 255, 17, 4, 0, 223, 76, 17, 0, 100, 64, 30, 0, 79, 181, 48, 0, 48, 205, 52, 0, 52, 101, 27, 0, 29, 248, 245, 255, 113, 185, 220, 255, 62, 56, 207, 255, 38, 107, 198, 255, 141, 9, 214, 255, 44, 16, 223, 255, 191, 107, 231, 255, 17, 166, 7, 0, 164, 0, 27, 0, 240, 71, 36, 0, 220, 209, 48, 0, 40, 99, 37, 0, 255, 196, 36, 0, 118, 73, 40, 0, 45, 223, 22, 0, 146, 78, 254, 255, 159, 166, 223, 255, 172, 148, 209, 255, 205, 217, 203, 255, 236, 97, 199, 255, 220, 45, 212, 255, 20, 207, 230, 255, 106, 127, 244, 255, 11, 218, 244, 255, 81, 172, 5, 0, 24, 159, 37, 0, 111, 43, 32, 0, 120, 28, 16, 0, 193, 74, 250, 255, 189, 154, 227, 255, 47, 12, 237, 255, 226, 10, 238, 255, 201, 3, 231, 255, 185, 74, 227, 255, 43, 238, 239, 255, 149, 90, 16, 0, 177, 169, 26, 0, 6, 91, 21, 0, 184, 224, 29, 0, 139, 98, 41, 0, 31, 121, 32, 0, 192, 126, 255, 255, 135, 11, 241, 255, 157, 42, 230, 255, 233, 235, 215, 255, 50, 203, 216, 255, 192, 152, 215, 255, 89, 229, 223, 255, 71, 252, 255, 255, 255, 179, 19, 0, 102, 104, 15, 0, 181, 153, 250, 255, 115, 82, 3, 0, 231, 175, 22, 0, 184, 157, 21, 0, 187, 236, 1, 0, 67, 124, 242, 255, 72, 138, 250, 255, 30, 172, 4, 0, 50, 172, 254, 255, 80, 226, 255, 255, 109, 117, 14, 0, 115, 239, 31, 0, 33, 222, 36, 0, 224, 105, 36, 0, 183, 91, 42, 0, 135, 253, 39, 0, 6, 135, 25, 0, 53, 18, 11, 0, 229, 162, 13, 0, 5, 148, 4, 0, 218, 40, 235, 255, 23, 11, 226, 255, 156, 249, 232, 255, 100, 215, 254, 255, 42, 43, 18, 0, 105, 249, 26, 0, 68, 88, 23, 0, 10, 164, 16, 0, 16, 180, 14, 0, 160, 71, 21, 0, 6, 41, 9, 0, 189, 85, 248, 255, 172, 103, 2, 0, 136, 192, 29, 0, 251, 47, 37, 0, 240, 110, 9, 0, 60, 131, 8, 0, 161, 209, 18, 0, 20, 21, 15, 0, 180, 212, 1, 0, 111, 86, 249, 255, 159, 178, 2, 0, 154, 201, 10, 0, 254, 5, 16, 0, 196, 35, 18, 0, 87, 1, 7, 0, 167, 114, 238, 255, 45, 184, 218, 255, 243, 149, 210, 255, 255, 33, 207, 255, 189, 165, 212, 255, 78, 218, 232, 255, 237, 189, 234, 255, 156, 140, 243, 255, 233, 59, 10, 0, 251, 114, 3, 0, 234, 82, 5, 0, 59, 38, 9, 0, 201, 75, 249, 255, 136, 42, 247, 255, 93, 229, 238, 255, 122, 201, 235, 255, 113, 244, 238, 255, 66, 107, 237, 255, 101, 253, 239, 255, 137, 101, 240, 255, 216, 107, 1, 0, 50, 139, 20, 0, 255, 247, 6, 0, 161, 154, 250, 255, 207, 202, 249, 255, 76, 64, 255, 255, 47, 129, 1, 0, 196, 222, 244, 255, 205, 130, 228, 255, 87, 168, 240, 255, 143, 112, 13, 0, 181, 239, 0, 0, 67, 223, 255, 255, 91, 214, 13, 0, 145, 24, 12, 0, 10, 47, 33, 0, 252, 184, 54, 0, 25, 109, 37, 0, 242, 125, 12, 0, 245, 94, 0, 0, 191, 50, 248, 255, 165, 28, 233, 255, 109, 57, 223, 255, 246, 193, 210, 255, 105, 170, 219, 255, 143, 163, 236, 255, 59, 125, 231, 255, 213, 124, 248, 255, 57, 212, 11, 0, 229, 233, 13, 0, 55, 244, 14, 0, 72, 131, 248, 255, 201, 182, 229, 255, 59, 105, 248, 255, 60, 174, 253, 255, 120, 127, 0, 0, 21, 180, 254, 255, 128, 83, 233, 255, 252, 98, 242, 255, 86, 221, 26, 0, 62, 43, 46, 0, 19, 163, 22, 0, 200, 205, 7, 0, 53, 209, 12, 0, 214, 86, 29, 0, 81, 9, 27, 0, 194, 60, 6, 0, 186, 226, 236, 255, 132, 75, 210, 255, 196, 186, 214, 255, 49, 49, 228, 255, 151, 244, 222, 255, 91, 187, 215, 255, 99, 173, 223, 255, 243, 170, 230, 255, 118, 199, 233, 255, 199, 36, 249, 255, 76, 129, 8, 0, 63, 219, 28, 0, 165, 68, 38, 0, 91, 111, 28, 0, 123, 45, 19, 0, 26, 48, 11, 0, 83, 32, 21, 0, 244, 209, 27, 0, 148, 139, 15, 0, 25, 232, 0, 0, 47, 118, 6, 0, 199, 98, 32, 0, 155, 66, 36, 0, 68, 202, 23, 0, 17, 65, 21, 0, 96, 99, 19, 0, 97, 197, 5, 0, 52, 162, 3, 0, 6, 246, 6, 0, 234, 109, 245, 255, 39, 115, 242, 255, 105, 6, 241, 255, 159, 61, 230, 255, 249, 16, 236, 255, 134, 22, 239, 255, 75, 210, 254, 255, 175, 139, 27, 0, 88, 218, 36, 0, 175, 204, 37, 0, 214, 97, 40, 0, 198, 116, 27, 0, 188, 14, 26, 0, 142, 255, 21, 0, 109, 164, 8, 0, 72, 36, 10, 0, 57, 14, 4, 0, 32, 99, 5, 0, 37, 249, 0, 0, 174, 86, 238, 255, 87, 190, 228, 255, 144, 24, 237, 255, 12, 115, 241, 255, 151, 83, 237, 255, 243, 57, 229, 255, 137, 171, 227, 255, 113, 73, 243, 255, 123, 253, 228, 255, 130, 226, 222, 255, 141, 85, 249, 255, 104, 163, 2, 0, 51, 183, 252, 255, 187, 91, 11, 0, 52, 104, 29, 0, 87, 73, 37, 0, 232, 115, 20, 0, 70, 135, 253, 255, 22, 172, 247, 255, 4, 28, 5, 0, 73, 243, 13, 0, 170, 129, 11, 0, 255, 93, 253, 255, 82, 204, 230, 255, 74, 192, 241, 255, 211, 14, 248, 255, 135, 66, 246, 255, 114, 196, 215, 255, 31, 85, 180, 255, 218, 54, 184, 255, 33, 250, 205, 255, 174, 5, 221, 255, 72, 234, 223, 255, 101, 155, 230, 255, 116, 212, 249, 255, 156, 166, 10, 0, 33, 22, 20, 0, 223, 103, 12, 0, 84, 110, 13, 0, 169, 213, 27, 0, 219, 178, 24, 0, 108, 231, 23, 0, 92, 106, 6, 0, 193, 3, 245, 255, 181, 100, 248, 255, 151, 81, 245, 255, 106, 155, 3, 0, 32, 110, 16, 0, 117, 202, 24, 0, 14, 190, 27, 0, 5, 154, 9, 0, 14, 71, 3, 0, 135, 161, 23, 0, 75, 146, 9, 0, 209, 57, 224, 255, 144, 212, 222, 255, 167, 135, 236, 255, 181, 41, 233, 255, 161, 213, 237, 255, 198, 220, 235, 255, 125, 252, 236, 255, 216, 2, 4, 0, 95, 163, 18, 0, 112, 100, 15, 0, 56, 14, 247, 255, 207, 238, 240, 255, 172, 45, 254, 255, 42, 1, 7, 0, 91, 17, 4, 0, 229, 246, 231, 255, 244, 67, 237, 255, 180, 117, 254, 255, 170, 20, 237, 255, 57, 75, 237, 255, 177, 82, 235, 255, 205, 142, 231, 255, 114, 229, 3, 0, 105, 36, 12, 0, 145, 173, 3, 0, 26, 103, 254, 255, 226, 167, 245, 255, 79, 202, 248, 255, 167, 112, 246, 255, 236, 161, 246, 255, 219, 247, 250, 255, 111, 113, 14, 0, 129, 85, 42, 0, 106, 228, 35, 0, 187, 85, 21, 0, 85, 173, 23, 0, 235, 17, 35, 0, 158, 118, 39, 0, 223, 253, 35, 0, 231, 44, 28, 0, 170, 167, 28, 0, 54, 4, 26, 0, 161, 155, 24, 0, 50, 34, 34, 0, 80, 95, 15, 0, 205, 109, 7, 0, 76, 187, 20, 0, 174, 26, 21, 0, 249, 85, 11, 0, 16, 67, 247, 255, 72, 14, 239, 255, 201, 204, 10, 0, 190, 171, 36, 0, 238, 57, 31, 0, 207, 51, 15, 0, 226, 5, 16, 0, 164, 68, 37, 0, 149, 186, 46, 0, 17, 246, 39, 0, 167, 252, 20, 0, 172, 180, 10, 0, 115, 212, 15, 0, 49, 1, 6, 0, 161, 49, 246, 255, 44, 189, 248, 255, 118, 43, 251, 255, 251, 42, 250, 255, 139, 111, 252, 255, 242, 143, 253, 255, 91, 30, 254, 255, 23, 109, 234, 255, 168, 237, 213, 255, 94, 126, 211, 255, 107, 146, 215, 255, 4, 241, 217, 255, 96, 145, 223, 255, 31, 99, 227, 255, 141, 209, 231, 255, 197, 203, 7, 0, 95, 96, 23, 0, 155, 238, 5, 0, 15, 59, 255, 255, 155, 94, 2, 0, 179, 141, 5, 0, 25, 48, 237, 255, 14, 243, 214, 255, 195, 197, 222, 255, 18, 235, 233, 255, 143, 238, 246, 255, 61, 215, 243, 255, 83, 14, 218, 255, 68, 137, 206, 255, 136, 144, 208, 255, 57, 187, 232, 255, 194, 28, 248, 255, 249, 135, 238, 255, 186, 208, 236, 255, 8, 93, 232, 255, 65, 198, 240, 255, 106, 93, 2, 0, 22, 113, 255, 255, 181, 92, 5, 0, 249, 245, 14, 0, 66, 71, 18, 0, 224, 13, 28, 0, 29, 19, 17, 0, 110, 200, 4, 0, 212, 247, 254, 255, 185, 175, 9, 0, 103, 160, 39, 0, 188, 77, 37, 0, 95, 187, 9, 0, 238, 67, 3, 0, 119, 203, 16, 0, 249, 219, 22, 0, 213, 71, 2, 0, 52, 254, 233, 255, 85, 165, 237, 255, 226, 49, 242, 255, 124, 187, 1, 0, 235, 34, 4, 0, 159, 103, 245, 255, 234, 90, 254, 255, 166, 96, 252, 255, 210, 30, 250, 255, 133, 36, 0, 0, 13, 79, 249, 255, 59, 30, 3, 0, 232, 136, 8, 0, 55, 243, 246, 255, 182, 42, 237, 255, 14, 1, 224, 255, 239, 198, 222, 255, 213, 160, 228, 255, 61, 160, 233, 255, 134, 130, 244, 255, 222, 112, 0, 0, 9, 240, 251, 255, 49, 208, 255, 255, 76, 102, 2, 0, 25, 148, 238, 255, 169, 12, 234, 255, 96, 110, 241, 255, 96, 49, 239, 255, 141, 254, 243, 255, 0, 227, 242, 255, 168, 131, 240, 255, 176, 213, 3, 0, 28, 182, 16, 0, 10, 247, 13, 0, 237, 145, 4, 0, 168, 26, 10, 0, 13, 156, 26, 0, 66, 137, 29, 0, 254, 109, 46, 0, 48, 15, 62, 0, 90, 102, 41, 0, 115, 175, 24, 0, 250, 86, 34, 0, 35, 84, 43, 0, 138, 94, 49, 0, 42, 53, 40, 0, 18, 255, 30, 0, 169, 219, 32, 0, 109, 54, 32, 0, 17, 23, 21, 0, 200, 233, 3, 0, 199, 45, 246, 255, 214, 176, 4, 0, 17, 69, 21, 0, 239, 87, 13, 0, 222, 32, 6, 0, 81, 205, 255, 255, 195, 98, 2, 0, 177, 148, 7, 0, 189, 69, 249, 255, 244, 27, 245, 255, 236, 169, 253, 255, 236, 68, 1, 0, 62, 194, 7, 0, 101, 240, 253, 255, 36, 124, 239, 255, 199, 174, 242, 255, 28, 35, 255, 255, 48, 99, 9, 0, 28, 156, 2, 0, 18, 101, 244, 255, 97, 40, 240, 255, 237, 135, 237, 255, 27, 114, 243, 255, 107, 149, 242, 255, 253, 204, 228, 255, 234, 55, 217, 255, 138, 210, 218, 255, 96, 59, 237, 255, 15, 180, 255, 255, 217, 236, 8, 0, 10, 247, 3, 0, 193, 142, 251, 255, 4, 228, 1, 0, 18, 34, 11, 0, 150, 209, 249, 255, 147, 109, 225, 255, 140, 80, 216, 255, 216, 131, 221, 255, 46, 131, 236, 255, 222, 222, 235, 255, 175, 191, 245, 255, 227, 213, 253, 255, 252, 218, 251, 255, 46, 60, 0, 0, 173, 250, 254, 255, 33, 22, 11, 0, 83, 238, 8, 0, 141, 91, 249, 255, 196, 153, 253, 255, 179, 81, 246, 255, 128, 74, 243, 255, 75, 231, 248, 255, 48, 75, 241, 255, 81, 97, 0, 0, 79, 16, 24, 0, 202, 14, 25, 0, 169, 100, 19, 0, 88, 223, 40, 0, 18, 145, 54, 0, 19, 191, 25, 0, 164, 194, 251, 255, 219, 50, 226, 255, 38, 157, 232, 255, 235, 102, 6, 0, 248, 237, 255, 255, 42, 118, 240, 255, 19, 115, 236, 255, 147, 118, 240, 255, 68, 42, 5, 0, 160, 60, 7, 0, 144, 87, 247, 255, 153, 148, 246, 255, 242, 37, 4, 0, 44, 202, 254, 255, 212, 133, 230, 255, 193, 162, 222, 255, 85, 70, 234, 255, 231, 192, 239, 255, 17, 6, 233, 255, 168, 100, 219, 255, 96, 213, 218, 255, 175, 180, 229, 255, 169, 140, 242, 255, 108, 82, 255, 255, 47, 114, 251, 255, 9, 177, 241, 255, 163, 231, 246, 255, 101, 165, 254, 255, 250, 207, 3, 0, 234, 181, 1, 0, 71, 194, 245, 255, 128, 160, 247, 255, 201, 252, 4, 0, 206, 101, 14, 0, 57, 243, 28, 0, 103, 220, 20, 0, 13, 124, 250, 255, 169, 19, 253, 255, 128, 53, 19, 0, 222, 124, 38, 0, 26, 111, 23, 0, 209, 5, 15, 0, 234, 11, 33, 0, 162, 74, 37, 0, 192, 72, 30, 0, 236, 248, 12, 0, 189, 174, 8, 0, 236, 196, 14, 0, 192, 53, 11, 0, 0, 186, 7, 0, 152, 147, 12, 0, 129, 135, 30, 0, 93, 190, 48, 0, 100, 228, 36, 0, 50, 207, 15, 0, 92, 205, 15, 0, 155, 70, 29, 0, 196, 122, 12, 0, 174, 125, 239, 255, 213, 85, 239, 255, 44, 196, 238, 255, 70, 133, 227, 255, 96, 128, 237, 255, 28, 216, 253, 255, 159, 242, 13, 0, 1, 93, 24, 0, 25, 175, 17, 0, 238, 153, 8, 0, 189, 115, 6, 0, 90, 149, 4, 0, 241, 8, 10, 0, 141, 87, 5, 0, 135, 42, 234, 255, 73, 111, 227, 255, 2, 80, 245, 255, 238, 212, 247, 255, 118, 227, 244, 255, 38, 69, 245, 255, 182, 5, 250, 255, 95, 39, 0, 0, 85, 138, 1, 0, 117, 33, 242, 255, 10, 146, 224, 255, 213, 255, 216, 255, 72, 10, 223, 255, 201, 239, 227, 255, 130, 239, 230, 255, 189, 229, 246, 255, 238, 61, 254, 255, 8, 32, 2, 0, 1, 61, 5, 0, 146, 162, 241, 255, 74, 147, 239, 255, 159, 106, 7, 0, 148, 109, 9, 0, 52, 43, 8, 0, 100, 40, 254, 255, 252, 179, 237, 255, 152, 58, 244, 255, 112, 215, 12, 0, 210, 39, 37, 0, 224, 81, 45, 0, 55, 97, 14, 0, 159, 72, 244, 255, 139, 169, 3, 0, 43, 133, 11, 0, 39, 103, 1, 0, 218, 24, 252, 255, 236, 57, 245, 255, 246, 173, 254, 255, 245, 34, 9, 0, 49, 238, 4, 0, 46, 30, 7, 0, 24, 204, 7, 0, 251, 6, 0, 0, 166, 254, 252, 255, 214, 115, 6, 0, 172, 67, 9, 0, 37, 253, 253, 255, 1, 235, 231, 255, 231, 102, 229, 255, 233, 118, 242, 255, 130, 93, 237, 255, 153, 145, 240, 255, 25, 13, 243, 255, 29, 250, 239, 255, 222, 162, 241, 255, 11, 7, 245, 255, 57, 62, 240, 255, 175, 247, 225, 255, 65, 139, 234, 255, 183, 216, 246, 255, 6, 56, 243, 255, 200, 83, 236, 255, 111, 89, 242, 255, 122, 132, 6, 0, 160, 235, 6, 0, 55, 92, 250, 255, 40, 88, 1, 0, 170, 80, 10, 0, 240, 152, 21, 0, 16, 162, 6, 0, 77, 97, 233, 255, 223, 41, 240, 255, 237, 182, 0, 0, 244, 151, 2, 0, 132, 203, 1, 0, 0, 196, 1, 0, 71, 249, 253, 255, 204, 197, 248, 255, 24, 113, 1, 0, 20, 149, 8, 0, 102, 197, 6, 0, 209, 203, 3, 0, 151, 217, 0, 0, 109, 254, 1, 0, 24, 183, 8, 0, 223, 139, 17, 0, 199, 90, 20, 0, 83, 82, 21, 0, 194, 103, 17, 0, 14, 156, 8, 0, 24, 160, 14, 0, 91, 66, 4, 0, 138, 47, 241, 255, 124, 173, 253, 255, 174, 212, 11, 0, 6, 55, 11, 0, 165, 151, 10, 0, 96, 73, 253, 255, 114, 190, 1, 0, 199, 40, 26, 0, 100, 107, 21, 0, 122, 223, 9, 0, 175, 11, 255, 255, 194, 218, 255, 255, 235, 101, 16, 0, 93, 26, 13, 0, 82, 76, 255, 255, 232, 82, 255, 255, 116, 70, 4, 0, 198, 46, 28, 0, 17, 186, 46, 0, 102, 66, 32, 0, 83, 150, 21, 0, 91, 7, 28, 0, 11, 46, 30, 0, 51, 164, 20, 0, 240, 126, 5, 0]
  }
  
}
