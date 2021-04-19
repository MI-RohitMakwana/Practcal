//
//  HomeVC.swift
//  Practical
//
//  Created by mind-0023 on 19/04/21.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - Varibles
    static func instantiate() -> HomeVC {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Title.Welcome
        navigationItem.hidesBackButton = true
    }
}
