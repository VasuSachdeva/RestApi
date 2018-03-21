//
//  networkController.swift
//  RestApi
//
//  Created by MAC on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation
class networkController{
	
	func GET(URL:String, Parameters:[String:Any],headers :[String:Any] , success:@escaping ([String:Any])-> Void){
		
		
		
		let URL = NSMutableURLRequest(url: NSURL(string: URL)! as URL,
								    cachePolicy: .useProtocolCachePolicy,
								    timeoutInterval: 10.0)
		
		URL.httpMethod = "GET"

		let session = URLSession.shared
		let dataTask = session.dataTask(with: URL as URLRequest, completionHandler: { (data, response, error) -> Void in
			guard error == nil else {
				print("returning error")
				return
			}
			do{
				guard let d = data else {
					print("not returning data")
					return
				}
				let datafetched = try! JSONSerialization.jsonObject(with: d, options: .mutableContainers) as! [String:Any]
				print(datafetched)
				success(datafetched)
			
			}
		})
		dataTask.resume()
	}
	
	
	
	func post(URL:String, Parameters:[String:Any],headers :[String:Any] , success:@escaping ([String:Any])-> Void){
		
		let request = NSMutableURLRequest(url: NSURL(string: URL)! as URL,
								    cachePolicy: .useProtocolCachePolicy,
								    timeoutInterval: 10.0)
		request.httpMethod = "POST"
		
		
		var bodyData = String()

		for(key, value) in Parameters{
			bodyData.append("\(key)=\(value)&")
		}

		bodyData.removeLast()

		request.httpBody = bodyData.data(using: String.Encoding.utf8)
		
		let session = URLSession.shared
		let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
			guard error == nil else {
				print("returning error")
				return
			}
			do{
				
				guard let d = data else {
					print("not returning data")
					return
				}
				let datafetched1 = try! JSONSerialization.jsonObject(with: d, options: .mutableContainers) as! [String:Any]
				print(datafetched1)
				success(datafetched1)
			}
		})
		
		dataTask.resume()
}
}
