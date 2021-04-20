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

    private let disposeBag = DisposeBag()

    func doLogin(_ router: ServiceRouter) -> Observable<LoginResultModel> {
        return Observable.create { observer in
            let _ = provider.rx.request(router)
                .asObservable()
                .subscribe { (response) in
                    let output = try? JSONDecoder().decode(LoginResultModel.self, from: response.data)
                    observer.onNext(output ?? LoginResultModel())
                    observer.onCompleted()
                } onError: { (error) in
                    observer.onError(error)
                }
                .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }

    // De-init
    deinit {
        print("\(self) dealloc")
    }
}
