//
//  ViewController.swift
//  MiniBank
//
//  Created by Beshoy Atef on 26/07/2025.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var accountNumberTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        if userNameTF.text?.isEmpty == true {
            createAlert(message: "Please Enter UserName 👨")
        } else if let account = accountNumberTF.text, account.isEmpty == true || Int(account) == nil {
            createAlert(message: "Please Enter Account Number 💳")
        } else if passwordTF.text?.isEmpty == true {
            createAlert(message: "Please Enter Password 🔐")
        } else {
            UserDefaults.standard.set(userNameTF.text, forKey: "USERNAME_KEY")
            successValidation()
        }
    }
    
    func createAlert(message:String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(OKButton)
        present(alert, animated: true)
    }
    
    func successValidation() {
        let alert = UIAlertController(title: "Success", message: "Successfully to Login ✅", preferredStyle: .alert)
        let OkButtonAlert = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigateToNextScreen()
        }
        alert.addAction(OkButtonAlert)
        present(alert, animated: true)
    }
    
    func navigateToNextScreen () {
        if let dashboardVC = storyboard?.instantiateViewController(identifier: "DashboardViewController") as? DashboardViewController {
            navigationController?.pushViewController(dashboardVC, animated: true)
        }
    }
}

