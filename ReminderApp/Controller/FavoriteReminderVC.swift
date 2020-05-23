//
//  FavoriteReminderVC.swift
//  ReminderApp
//
//  Created by David Murillo on 5/23/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class FavoriteReminderVC: UIViewController {
    
    var reminder:Reminder!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let favoritedReminder = ReminderService.shared.getFavoritedReminder(){
            titleLbl.text = favoritedReminder.title
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy hh:mma"
            dateLbl.text = dateFormatter.string(from: favoritedReminder.date)
        }
    }
    
    

}
