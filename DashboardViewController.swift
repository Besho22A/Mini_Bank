//
//  DashboardViewController.swift
//  MiniBank
//
//  Created by Beshoy Atef on 26/07/2025.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userName = UserDefaults.standard.value(forKey: "USERNAME_KEY") {
            userNameLabel.text = "Welcome back, \(userName)"
        } else {
            userNameLabel.text = "Welcome back"
        }
    }
    
    @IBAction func sendMoneyButtonPressed(_ sender: Any) {
        if let sendMoneyVC = storyboard?.instantiateViewController(identifier: "SendMoneyViewController") as? SendMoneyViewController {
            navigationController?.pushViewController(sendMoneyVC, animated: true)
        }
    }
    
    @IBAction func transactionDetailButtonPressed(_ sender: Any) {
        if let detailVC = storyboard?.instantiateViewController(identifier: "TransactionDetailVC") as? TransactionDetailVC {
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        if let profileVC = storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController {
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
}
