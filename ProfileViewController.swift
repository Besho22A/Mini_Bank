//
//  ProfileViewController.swift
//  MiniBank
//
//  Created by Beshoy Atef on 27/07/2025.
//

import UIKit

class ProfileViewController: UIViewController, DataBackProtocol {
    func nameBack(name: String) {
        nameLabel.text = name
    }
    
    func emailBack(email: String) {
        emailLabel.text = email
    }
    
    func accountNumberBack(num: Int) {
        accountNumberLabel.text = "\(num)"
    }
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var accountNumberLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfileData()
    }
    
    func loadProfileData() {
        let showName = UserDefaults.standard.value(forKey: "NAME_KEY") as? String
        let showEmail = UserDefaults.standard.value(forKey: "EMAIL_KEY") as? String
        let showAcconutNumber = UserDefaults.standard.value(forKey: "ACCOUNT_KEY") as? String
        
        nameLabel.text = showName
        emailLabel.text = showEmail
        accountNumberLabel.text = showAcconutNumber
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        if let editVC = storyboard?.instantiateViewController(identifier: "EditProfileViewController") as? EditProfileViewController {
            editVC.protocolReference = self
            navigationController?.pushViewController(editVC, animated: true)
        }
    }
}
