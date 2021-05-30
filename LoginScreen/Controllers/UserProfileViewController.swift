//
//  UserProfileViewController.swift
//  LoginScreen
//
//  Created by Anna Ostapenko on 29.05.21.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    var user = User()

    @IBOutlet weak var userWelcomeText: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    private let primaryColor = UIColor(
        red: 240/255,
        green: 194/255,
        blue: 123/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 75/255,
        green: 18/255,
        blue: 72/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userWelcomeText.text = "Hello, \(user.userName ?? "")"
        logoutButton.layer.cornerRadius = 10
        logoutButton.layer.borderWidth = 2
        logoutButton.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        self.view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
}
