//
//  ReminderCell.swift
//  ReminderApp
//
//  Created by David Murillo on 5/23/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class ReminderCell: UITableViewCell {
    @IBOutlet weak var completedView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    func configCell(reminder:Reminder){
        titleLbl.text = reminder.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateLbl.text = dateFormatter.string(from: reminder.date)
        
        if reminder.isCompleted{
            completedView.backgroundColor = UIColor.green
        }else{
            completedView.backgroundColor = UIColor.gray
        }
        
    }
    

}
