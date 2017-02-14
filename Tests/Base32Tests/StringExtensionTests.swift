//
//  StringExtensionTests.swift
//  Base32
//
//  Created by 野村 憲男 on 2/7/15.
//
//  Copyright (c) 2015 Norio Nomura
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import XCTest
@testable import Base32

class StringExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_dataUsingUTF8StringEncoding() {
        let string = "0112233445566778899AABBCCDDEEFFaabbccddeefff"
        XCTAssertEqual(string.dataUsingUTF8StringEncoding, string.data(using: .utf8, allowLossyConversion: false)!)
    }

    func test_dataUsingUTF8StringEncoding_empty() {
        #if !os(Linux) || (os(Linux) && swift(>=3.1))
            let emptyString = ""
            XCTAssertEqual(emptyString.dataUsingUTF8StringEncoding, emptyString.data(using: .utf8, allowLossyConversion: false)!)
        #else
            print("\(#function) is skipped because that crashes on Swift 3.0.2 for Linux.")
        #endif
    }
}

extension StringExtensionTests {
    static var allTests: [(String, (StringExtensionTests) -> () throws -> Void)] {
        return [
            ("test_dataUsingUTF8StringEncoding", test_dataUsingUTF8StringEncoding),
            ("test_dataUsingUTF8StringEncoding_empty", test_dataUsingUTF8StringEncoding_empty),
        ]
    }
}
