//
//  UserTrackerViewController.swift
//  LoginScreen
//
//  Created by Anna Ostapenko on 29.05.21.
//

import UIKit

class UserTrackerViewController: UIViewController {
    private let primaryColor = UIColor(
        red: 168/255,
        green: 202/255,
        blue: 186/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 93/255,
        green: 65/255,
        blue: 87/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    @IBAction func onDropClick(_ sender: UIButton) {
        let dropEmpty = UIImage(systemName: "drop")
        let dropFilled = UIImage(systemName: "drop.fill")
        if sender.currentImage == dropEmpty {
            sender.setImage(dropFilled , for: .normal)
        } else {
            sender.setImage(dropEmpty , for: .normal)
        }
    }
    
    @IBAction func onMoonClick(_ sender: UIButton) {
        let moonFilled = UIImage(systemName: "moon.fill")
        let moonEmpty = UIImage(systemName: "moon")
        if sender.currentImage == moonEmpty {
            sender.setImage(moonFilled , for: .normal)
        } else {
            sender.setImage(moonEmpty , for: .normal)
        }
    }
}
