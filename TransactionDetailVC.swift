//
//  TransactionDetailVC.swift
//  MiniBank
//
//  Created by Beshoy Atef on 27/07/2025.
//

import UIKit

class TransactionDetailVC: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var reasonLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadTransactionData()
    
    }
    
    func loadTransactionData() {
        let name = UserDefaults.standard.value(forKey: "NAME_kEY") as? String
        let value = UserDefaults.standard.value(forKey: "VALUE_KEY") as? String
        let reason = UserDefaults.standard.value(forKey: "REASON_KEY") as?  String
        let date = UserDefaults.standard.value(forKey: "DATE_KEY") as? String
        
        nameLabel.text = name
        valueLabel.text = value
        reasonLabel.text = reason
        dateLabel.text = date
    }


}
