//
//  STNetwork.swift
//  SwifTools
//
//  Created by Jason PIERNA on 23/10/2018.
//  Copyright © 2018 Jason Pierna & Kévin Le. All rights reserved.
//

import Foundation

class STNetwork {
	
	/**
	Make a network call.
	- parameter url: The URL to call
	- parameter method: HTTP method to use
	- parameter parameters: Used parameters for the request.
	- parameter completion: Callback
	*/
	public static func call(url: String, method: HTTPMethod = .get, parameters: [String: Any] = [:], completion: @escaping NetworkCallback) {
		guard let urlRequest = request(url: url, method: method, with: parameters) else { return }
		
		let session = URLSession(configuration: .default)
		session.dataTask(with: urlRequest, completionHandler: completion).resume()
	}
	
	// MARK: - Helpers
	private init() {}
	
	typealias NetworkCallback = ((Data?, URLResponse?, Error?) -> Void)
	
	public enum HTTPMethod: String {
		case get	= "GET"
		case post	= "POST"
		case put	= "PUT"
		case delete	= "DELETE"
	}
	
	static func parseParameters(_ params: [String: Any]) -> String {
		var parameters = [String]()
		
		for (key, value) in params {
			parameters += ["\(key)=\(value)"]
		}
		
		return parameters.joined(separator: "&")
	}
	
	static func request(url urlString: String, method: HTTPMethod, with parameters: [String: Any]) -> URLRequest? {
		var urlRequest: URLRequest
		let encodedParameters = parseParameters(parameters)
		
		switch method {
			
		case .get, .delete:
			guard let url = URL(string: urlString.appending("?").appending(encodedParameters)) else { return nil }
			urlRequest = URLRequest(url: url)
			
		case .post, .put:
			guard let url = URL(string: urlString) else { return nil }
			urlRequest = URLRequest(url: url)
			urlRequest.httpBody = encodedParameters.data(using: .utf8)
		}
		
		if method == .put {
			urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
		}
		
		urlRequest.httpMethod = method.rawValue
		
		return urlRequest
	}
}
