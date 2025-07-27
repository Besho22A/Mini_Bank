//
//  EditProfileViewController.swift
//  MiniBank
//
//  Created by Beshoy Atef on 27/07/2025.
//

import UIKit

protocol DataBackProtocol {
    func nameBack(name:String)
    func emailBack(email:String)
    func accountNumberBack(num:Int)
}
class EditProfileViewController: UIViewController {

    var protocolReference: DataBackProtocol?
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var accountNumberTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveProfileButtonPressed(_ sender: Any) {
        createAlert()
    }
    
    func createAlert() {
        let alert = UIAlertController(title: "Saved", message: "Successed Saved your Information ✅", preferredStyle: .alert)
        let OkButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.backData()
            self.navigationController?.popViewController(animated: true)

        }
        alert.addAction(OkButton)
        present(alert, animated: true)
    }
    
    func backData () {
        
        if let name = nameTF.text {
            protocolReference?.nameBack(name: name)
        }
        
        if let email = emailTF.text {
            protocolReference?.emailBack(email: email)
        }
        
        if let account = accountNumberTF.text, let num = Int(account) {
            protocolReference?.accountNumberBack(num: num)
        }
        
        UserDefaults.standard.set(nameTF.text, forKey: "NAME_KEY")
        UserDefaults.standard.set(emailTF.text, forKey: "EMAIL_KEY")
        UserDefaults.standard.set(accountNumberTF.text, forKey: "ACCOUNT_KEY")
    }
    
}
