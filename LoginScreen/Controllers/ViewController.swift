//
//  ViewController.swift
//  LoginScreen
//
//  Created by Anna Ostapenko on 25.05.21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let userName = "Anna"
    private let userPassword = "Password"
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.delegate = self
        self.userPasswordTextField.delegate = self
    }
    
    
    @IBAction func onLoginTapped() {
        if checkLoginData() {
            performSegue(withIdentifier: "showTabBarController", sender: nil)
            self.view.endEditing(true)
        } else {
            showErrorNotification(title: "Invalid login or password ❌", message: "Please, enter correct login and password")
        }
    }
    
    @IBAction func onForgotUserName() {
        showErrorNotification(title: "Oops😉", message: "Your user name is \(userName)")
    }
    
    @IBAction func onForgotPassword() {
        showErrorNotification(title: "Oops😉", message: "Your password is \(userPassword)")
    }
    
    
    @IBAction  func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
    }
    
    private func checkLoginData() -> Bool {
        userNameTextField.text == userName && userPasswordTextField.text == userPassword
    }
    
    private func showErrorNotification(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        onLoginTapped()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabVC = segue.destination as? UITabBarController
        for viewcontroller in tabVC?.viewControllers ?? [] {
            if let userProfileVC = viewcontroller as? UserProfileViewController {
                userProfileVC.user.userName = "Anna"
                userNameTextField.text = ""
                userPasswordTextField.text = ""
            }
            else if let userDetailsVC = viewcontroller as? UserDetailsViewController {
                userDetailsVC.user.userDetails = "Anna's"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

