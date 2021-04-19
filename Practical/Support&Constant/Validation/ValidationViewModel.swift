//
//  ValidationViewModel.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import Foundation
import RxCocoa
import RxSwift

protocol ValidationViewModel {

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
