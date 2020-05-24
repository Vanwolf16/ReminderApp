//
//  NewReminderVC.swift
//  ReminderApp
//
//  Created by David Murillo on 5/23/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class NewReminderVC: UIViewController {
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        //Create a reminder object
        let reminder = Reminder(title: titleTF.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        ReminderService.shared.create(reminder: reminder)
        navigationController?.popViewController(animated: true)
    }
    
    
}
