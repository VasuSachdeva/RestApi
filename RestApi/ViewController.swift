//
//  ViewController.swift
//  RestApi
//
//  Created by MAC on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let  Parameters = ["username":"vasu","userid":"vasu@appinventiv.com"]
		APIController().singup(Parameters: Parameters)
		{
			(user) in
			
			print("user name is ", user.username)
			
			print("User id is ",user.userid)
			
		}
		APIController().login(Parameters:Parameters) { (user) in
			print("heloo",user.username)
			print("your userid is",user.userid)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

