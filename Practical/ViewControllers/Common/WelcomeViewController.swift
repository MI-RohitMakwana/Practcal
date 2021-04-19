//
//  WelcomeViewController.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    static func instantiate() -> WelcomeViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
}
