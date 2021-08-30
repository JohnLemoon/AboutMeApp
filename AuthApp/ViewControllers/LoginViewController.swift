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

    private var login = "alex"
    private var password = "12345678"

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonLogin.layer.cornerRadius = 3

        buttonForgotPass.layer.cornerRadius = 3
        buttonForgotLogin.layer.cornerRadius = 3

        loginInput.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        passwordInput.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        loginInput.attributedPlaceholder = NSAttributedString(
            string: "Login",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        passwordInput.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let WelcomeVC = segue.destination as? WelcomeViewController
        else { return }

        WelcomeVC.welcomeText = login
    }

    func alert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)


        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default
        ))

        self.present(alert, animated: true)
    }

    func wrongAuthAlert() {
        alert(title: "Wrong", message: "Wrong Login or Password")
        passwordInput.text = ""
    }

    @IBAction func buttonSendAuth() {
        if loginInput.text != login || passwordInput.text != password {
            wrongAuthAlert()
        }
    }

    @IBAction func buttonSendForgotLogin() {
        alert(title: "Your Login!", message: "Login: \(login)")
    }

    @IBAction func buttonSendForgotPassword() {
        alert(title: "Your Password", message: "Password: \(password)")
    }

    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        loginInput.text = ""
        passwordInput.text = ""
    }

}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginInput {
            passwordInput.becomeFirstResponder()
        } else {
            performSegue(withIdentifier: "WelcomeVC" , sender: nil)
        }
        return true
    }
}

