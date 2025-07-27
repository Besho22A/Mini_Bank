//
//  SendMoneyPopUpVC.swift
//  MiniBank
//
//  Created by Beshoy Atef on 27/07/2025.
//

import UIKit

protocol DataBackClearTF {
    func dismissPopUp()
}

class SendMoneyPopUpVC: UIViewController {
    var protocolReference: DataBackClearTF?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func sendFinalButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Success ✅", message: "Conversion Completed Successfully", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default) { (action) in
            self.protocolReference?.dismissPopUp()
            self.dismiss(animated: true)
        }
        alert.addAction(doneButton)
        present(alert, animated: true)
    }
    
}
