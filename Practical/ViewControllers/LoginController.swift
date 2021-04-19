//
//  LoginController.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import UIKit

class LoginController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
    }
}

