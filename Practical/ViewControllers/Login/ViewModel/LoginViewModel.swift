//
//  LoginViewModel.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel: ValidationViewModel {

    private let service = AuthServices()

    func transform(input: Input) -> Output {

        let emailAndPassword = Observable.combineLatest(input.email, input.password)

        // This will help to show indicator ot disable button
        let activityIndicator = ActivityIndicator()
        
        let canlogin = Observable.combineLatest(emailAndPassword, activityIndicator.asObservable()).map {
            return $0.0.isValidEmail && $0.1.isValidPassword && !$1
        }
        .startWith(false)
        .asDriver(onErrorJustReturn: false)

        let result = input.login.asObservable().withLatestFrom(emailAndPassword).map({ (email, password) -> LoginModel in
            return LoginModel(email: email, password: password)
        })
        .flatMap({ [unowned self] param  in
            return service.doLogin(.login(param))
                .trackActivity(activityIndicator)
        })
        .asDriver(onErrorJustReturn: LoginResultModel())

        return Output(loginEnabled: canlogin, result: result)
    }
}

extension LoginViewModel {

    struct Input {
        let email: Observable<String>
        let password: Observable<String>
        let login : Observable<Void>
    }

    struct Output {
        let loginEnabled: Driver<Bool>
        let result: Driver<LoginResultModel>
    }
}
