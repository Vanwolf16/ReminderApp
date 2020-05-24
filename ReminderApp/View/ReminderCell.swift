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
        
        completedView.layer.cornerRadius = completedView.frame.size.width / 2.0
        
        completedView.layer.borderColor = UIColor.lightGray.cgColor
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateLbl.text = dateFormatter.string(from: reminder.date)
        
        if reminder.isCompleted{
            completedView.backgroundColor = UIColor.green
            completedView.layer.borderWidth = 0.0
        }else{
            completedView.backgroundColor = UIColor.gray
            completedView.layer.borderWidth = 2.0
        }
        
    }
    

}
