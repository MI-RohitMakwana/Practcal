//
//  WelcomeViewController.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Varibles
    static func instantiate() -> WelcomeViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Title.Welcome
        navigationItem.hidesBackButton = true
    }
}
