//
//  ViewController.swift
//  AuthApp
//
//  Created by Николай Тунин on 25.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginInput: UITextField!
    @IBOutlet var passwordInput: UITextField!

    @IBOutlet var buttonLogin: UIButton!
    @IBOutlet var buttonForgotPass: UIButton!
    @IBOutlet var buttonForgotLogin: UIButton!

    var login = "niko"
    var password = "12345678"

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogin.layer.cornerRadius = 3

        buttonForgotPass.layer.cornerRadius = 3
        buttonForgotLogin.layer.cornerRadius = 3
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let WelcomeVC = segue.destination as? WelcomeViewController
        else { return }

        WelcomeVC.welcomeText = "Welcome \(login)"
    }
    
    @IBAction func buttonSendAuth() {
        loginInput.text != login && passwordInput.text != password
            ? wrongAuthAlert()
            : wrongAuthAlert()
    }

    @IBAction func buttonSendForgotLogin() {
        let alert = UIAlertController(
            title: "Your Login!",
            message: "Login: \(login)",
            preferredStyle: .alert)

        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil))

        self.present(alert, animated: true)
    }

    @IBAction func buttonSendForgotPassword() {
        let alert = UIAlertController(
            title: "Your Password",
            message: "Password: \(password)" ,
            preferredStyle: .alert)

        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil))

        self.present(alert, animated: true)
    }

    func wrongAuthAlert(){
        if loginInput.text != login &&
            passwordInput.text != password {
            let alert = UIAlertController(
                title: "Wrong!",
                message: "Wrong Login or Password!",
                preferredStyle: .alert)

            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil))

            self.present(alert, animated: true)

            passwordInput.text = ""
        }

    }
}
