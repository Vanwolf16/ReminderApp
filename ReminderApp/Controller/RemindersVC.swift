//
//  RemindersVC.swift
//  ReminderApp
//
//  Created by David Murillo on 5/23/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class RemindersVC: UIViewController {
    @IBOutlet weak var myTableViewCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableViewCell.delegate = self
        myTableViewCell.dataSource = self
    }
    

}

extension RemindersVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.shared.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableViewCell.dequeueReusableCell(withIdentifier: "remindCell", for: indexPath) as? ReminderCell else { return UITableViewCell()}
        //Each pool of tableview has there own info :)
        let reminder = ReminderService.shared.getReminder(index: indexPath.row)
        
        cell.configCell(reminder: reminder)
        
        return cell
    }
    
    
}
