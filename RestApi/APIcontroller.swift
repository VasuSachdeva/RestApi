//
//  APIcontroller.swift
//  RestApi
//
//  Created by MAC on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation
class APIController
{
	func singup( Parameters:[String:Any],success:@escaping (User)-> Void){
		let headers = [
			"cache-control": "no-cache",
			"postman-token": "32450c7f-db09-0285-a8f6-5dd5fc9d9ba3"
		]
		
		let singupurl =  "https://httpbin.org/get"
		
	
		var requestedUrl = singupurl+"?"

		for(key, value) in Parameters{
			requestedUrl.append("\(key)=\(value)&")
		}
		
		requestedUrl.removeLast()
		
		networkController().GET(URL: requestedUrl,Parameters:Parameters,headers:headers){
			data in
			let user = data["args"] as! [String:Any]
			let userType = User(username: user["username"] as! String, userid: user["userid"] as! String)
			success(userType)
			
}
	}
	
	func login( Parameters:[String:Any],success:@escaping (User)-> Void){
		let headers = [
			"content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
			"cache-control": "no-cache",
			"postman-token": "5ede957e-a901-756b-b608-ac0e8f75c248"
		]
		
		
		let requestedUrl =  "https://httpbin.org/post"
		
	
		networkController().post(URL: requestedUrl,Parameters:Parameters,headers:headers){
			data in
			let user = data["form"] as! [String:Any]
			let userType = User(username: user["username"] as! String, userid: user["userid"] as! String)
			success(userType)
			
		}
	}
}
