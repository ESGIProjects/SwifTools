//
//  STNetworkTests.swift
//  SwifToolsTests
//
//  Created by Jason PIERNA on 23/10/2018.
//  Copyright © 2018 Jason Pierna & Kévin Le. All rights reserved.
//

import XCTest
@testable import SwifTools

class STNetworkTests: XCTestCase {
	static var urlToCall: String!
	
	override class func setUp() {
		super.setUp()
		urlToCall = ""
	}
	
	override class func tearDown() {
		super.tearDown()
		urlToCall = nil
	}
	
	func testParseParameters_Empty() {
		let params = [String: Any]()
		let encodedParameters = STNetwork.parseParameters(params)
		
		XCTAssertEqual(encodedParameters, "")
	}
	
	func testParseParameters_TwoStrings() {
		let params: [String: Any] = [
			"param1": "val1",
			"param2": "val2"
		]
		let encodedParameters = STNetwork.parseParameters(params)
		
		XCTAssertEqual(encodedParameters, "param1=val1&param2=val2")
	}
	
	func testParameters_StringAndInt() {
		let params: [String: Any] = [
			"param1": "val1",
			"param2": 1
		]
		let encodedParameters = STNetwork.parseParameters(params)
		
		XCTAssertEqual(encodedParameters, "param1=val1&param2=1")
	}
	
	func testRequest_GET() {
		let urlString = ""
		
		let method = STNetwork.HTTPMethod.get
		
		let params: [String: Any] = [
			"param1": "val1",
			"param2": "val2"
		]
		
		let urlRequest = STNetwork.request(url: urlString, method: method, with: params)!
		
		XCTAssertEqual(urlRequest.httpMethod!, method.rawValue)
		XCTAssertEqual(urlRequest.url!, URL(string: urlString.appending("?param1=val1&param2=val2")))
	}
	
	func testCall_Google() {
		STNetwork.call(url: "https://www.google.com") { _, response, error in
			XCTAssertNil(error)
			
			let httpURLResponse = response as! HTTPURLResponse
			XCTAssertEqual(httpURLResponse.statusCode, 200)
		}
	}
}
