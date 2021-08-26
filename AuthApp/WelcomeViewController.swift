//
//  WelcomeViewController.swift
//  AuthApp
//
//  Created by Николай Тунин on 25.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!

    @IBOutlet var logoutButton: UIButton!

    var welcomeText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButton.layer.cornerRadius = 3

        welcomeLabel.text = welcomeText

        
    }
    
    @IBAction func logoutButtonClick() {
        dismiss(animated: true)

    }
}
