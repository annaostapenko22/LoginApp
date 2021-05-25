//
//  ViewController.swift
//  LoginScreen
//
//  Created by Anna Ostapenko on 25.05.21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let userName = "Anna"
    let userPassword = "Password"
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.delegate = self
        self.userPasswordTextField.delegate = self
    }
    
    
    @IBAction func onLoginTapped() {
        if(checkLoginData()){
            performSegue(withIdentifier: "showWelcomeScreen", sender: nil)
            self.view.endEditing(true)
        } else {
            showErrorNotification(title: "Invalid login or password ❌", message: "Please, enter correct login and password")
        }
    }
    
    @IBAction func onForgotUserName() {
        showErrorNotification(title: "Oops😉", message: "You have forgotten user name")
    }
    
    @IBAction func onForgotPassword() {
        showErrorNotification(title: "Oops😉", message: "You have forgotten user password")
    }
    
    
    @IBAction  func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        
    }
    
    private func checkLoginData() -> Bool {
        if(userNameTextField.text == userName && userPasswordTextField.text == userPassword) {
            return true
        }
        return false
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
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.userName = userNameTextField.text
        userNameTextField.text = ""
        userPasswordTextField.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

