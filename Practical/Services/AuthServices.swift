//
//  AuthServices.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

protocol AuthServiceProtocol : class {
    func doLogin(_ router: ServiceRouter) -> Observable<LoginResultModel>
}

private let provider = MoyaProvider<ServiceRouter>()

final class AuthServices: AuthServiceProtocol {

    func doLogin(_ router: ServiceRouter) -> Observable<LoginResultModel> {
        return Observable.create { _ in
            return Disposables.create()
        }
    }
}
