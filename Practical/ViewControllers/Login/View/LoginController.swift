//
//  LoginController.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class LoginController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Properties
    typealias ViewModelType = LoginViewModel
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
    }
}

