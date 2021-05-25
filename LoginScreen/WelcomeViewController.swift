//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Anna Ostapenko on 25.05.21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var userName: String?
    
    @IBOutlet weak var welcomeText: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeText.text = "Hello, \(userName ?? "")!"
        logoutButton.layer.cornerRadius = 10
        logoutButton.layer.borderWidth = 2
        logoutButton.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }

    func setGradientBackground() {
        let colorTop =  UIColor(red: 240.0/255.0, green: 194.0/255.0, blue: 123.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 75.0/255.0, green: 18.0/255.0, blue: 72.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
