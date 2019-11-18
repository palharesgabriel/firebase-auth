//
//  ViewController.swift
//  firebase-auth
//
//  Created by Gabriel Palhares on 18/11/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
//        AuthManager.shared.register(email: "gabriel@gabriel.com", password: "delicia1") { (success) in
//            if success {
//                print("cadastrou")
//            }
//        }
        
        
        AuthManager.shared.login(email: "gabriel@gabriel.com", password: "delicia1") { (success) in
            if success {
                print("logado")
            }
        }
        
    }


}

