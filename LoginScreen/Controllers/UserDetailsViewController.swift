//
//  UserDetailsViewController.swift
//  LoginScreen
//
//  Created by Anna Ostapenko on 29.05.21.
//

import UIKit

class UserDetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var user = User()
    
    @IBOutlet weak var userDetailsLabel: UILabel!
    @IBOutlet weak var chooseProfileImage: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    private let primaryColor = UIColor(
        red: 221/255,
        green: 62/255,
        blue: 84/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 229/255,
        blue: 133/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsLabel.text = "\(user.userDetails ?? "") Details"
        userImage.layer.cornerRadius = 20
        chooseProfileImage.layer.cornerRadius = 10
        chooseProfileImage.layer.borderWidth = 2
        chooseProfileImage.layer.borderColor = UIColor(red:255/255, green:255/255, blue:255/255, alpha: 1).cgColor
        self.view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    @IBAction func onChooseImagePressed() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
        }
    }
    
    private func showNotitification(title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onSelectFact(_ sender: UISwitch) {
        let correctMessage = "That is truth!"
        let incorrectMessage = "It is wrong!"
        if sender.isOn {
            switch sender.tag {
            case 0:
                showNotitification(title: correctMessage)
            case 1:
                showNotitification(title: incorrectMessage)
                sender.setOn(false, animated: true)
            case 2:
                showNotitification(title: correctMessage)
            case 3:
                showNotitification(title: incorrectMessage)
                sender.setOn(false, animated: true)
            case 4:
                showNotitification(title: correctMessage)
            default:
                showNotitification(title: incorrectMessage)
                sender.setOn(false, animated: true)
            }
        }
    }
}
