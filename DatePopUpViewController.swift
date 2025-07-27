//
//  DatePopUpViewController.swift
//  MiniBank
//
//  Created by Beshoy Atef on 26/07/2025.
//

import UIKit

class DatePopUpViewController: UIViewController {
    
    @IBOutlet var datePickerSelected: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closePopUp))
        view.addGestureRecognizer(tap)
    }
    
    @objc func closePopUp () {
       dismiss(animated: true)
    }
    
    @IBAction func saveDateButtonPressed(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        let dateToString = dateFormatter.string(from: datePickerSelected.date)
        dateBackClosure?(dateToString)
        dismiss(animated: true)
    }
    
    var dateBackClosure:((_ date:String)->Void)?
    
}
