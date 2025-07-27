//
//  SendMoneyViewController.swift
//  MiniBank
//
//  Created by Beshoy Atef on 26/07/2025.
//

import UIKit

class SendMoneyViewController: UIViewController {
    
    
    @IBOutlet var dateUserTF: UITextField!
    @IBOutlet var nameReceiverTF: UITextField!
    @IBOutlet var valueTextField: UITextField!
    @IBOutlet var reasonTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dateButtonPressed(_ sender: Any) {
        if let datePopUpVC = storyboard?.instantiateViewController(identifier: "DatePopUpViewController") as? DatePopUpViewController {
            datePopUpVC.dateBackClosure = {
                name in self.dateUserTF.text = name
            }
            present(datePopUpVC, animated: true)
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if let name = nameReceiverTF.text, name.isEmpty == true {
            createAlert(message: "Please Enter Receiver Name")
            return
        } else if let value = valueTextField.text, value.isEmpty == false {
            if let amount = Double(value) {
                if amount > 0 {
                    if reasonTextField.text?.isEmpty == true {
                        createAlert(message: "Please Enter a Reason")
                        return
                    } else if dateUserTF.text?.isEmpty == true {
                        createAlert(message: "Please Enter a Date")
                        return
                    } else {
                        successValidation()
                    }
                } else {
                    createAlert(message: "Enter a Positive Number")
                    return
                }
            } else {
                createAlert(message: "Enter a Correct Number")
                return
            }
        } else {
            createAlert(message: "Enter a Value")
            return
        }
    }
    
    func createAlert (message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let DoneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(DoneButton)
        present(alert, animated: true)
    }
    
    func successValidation() {
        if let popUpVC = storyboard?.instantiateViewController(identifier: "SendMoneyPopUpVC") as? SendMoneyPopUpVC {
            present(popUpVC, animated: true)
            popUpVC.protocolReference = self
            
        }
    }
    
    func clearTextFields () {
        dateUserTF.text = ""
        nameReceiverTF.text = ""
        valueTextField.text = ""
        reasonTextField.text = ""
    }
}
extension SendMoneyViewController: DataBackClearTF {
    func dismissPopUp() {
        UserDefaults.standard.set(nameReceiverTF.text, forKey: "NAME_kEY")
        UserDefaults.standard.set(valueTextField.text, forKey: "VALUE_KEY")
        UserDefaults.standard.set(reasonTextField.text, forKey: "REASON_KEY")
        UserDefaults.standard.set(dateUserTF.text, forKey: "DATE_KEY")
        clearTextFields()
    }
    
    
}
