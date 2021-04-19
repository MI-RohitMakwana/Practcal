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
    fileprivate let disposeBag = DisposeBag()
    var viewModel: LoginViewModel!

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = LoginViewModel()

        self.title = Title.Login
        self.createBinding()

        self.configure(with: self.viewModel)
    }

    //MARK: - Helpert Methods

    // Create Binding
    fileprivate func createBinding() {
        emailTextField.rx.controlEvent(UIControl.Event.editingDidEndOnExit).subscribe { (_) in
            self.passwordTextField.becomeFirstResponder()
        }.disposed(by: disposeBag)
    }

    //Config with Input & Output
    fileprivate func configure(with viewModel: LoginViewModel) {

        let input = LoginViewModel.Input(
            email: emailTextField.rx.text.orEmpty.distinctUntilChanged(),
            password: passwordTextField.rx.text.orEmpty.distinctUntilChanged(),
            login: loginButton.rx.tap.asObservable()
        )

        let output = viewModel.transform(input: input)

        output.loginEnabled.drive(loginButton.rx.isEnabled).disposed(by: disposeBag)

        output.loginEnabled.drive(onNext: { [weak self] in
            self?.loginButton.isEnabled = $0
            self?.loginButton.alpha = $0 ? 1: 0.6
        }).disposed(by: disposeBag)

        output.result.drive { response  in
            print(response)
            if response.result == 0 {
                UIAlertController
                    .present(in: self, title: Title.Error, message: response.errorMessage)
                    .subscribe(onNext: { buttonIndex in
                    }).disposed(by: self.disposeBag)
            }
            else {
                UserDefaults.standard.user = response.data.user
                self.navigationController?.pushViewController(WelcomeViewController.instantiate(),
                                                              animated: true)
            }
        }.disposed(by: disposeBag)
    }
}
