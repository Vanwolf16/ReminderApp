//
//  RemindersVC.swift
//  ReminderApp
//
//  Created by David Murillo on 5/23/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class RemindersVC: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    @IBAction func editBtnPressed(_ sender: UIBarButtonItem) {
        if myTableView.isEditing{
            myTableView.isEditing = false
            sender.title = "Edit"
        }else{
            myTableView.isEditing = true
            sender.title = "Done"
        }
    }
    
    
}

extension RemindersVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            ReminderService.shared.delete(index: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.shared.getCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped at")
        ReminderService.shared.toggleCompleted(index: indexPath.row)
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "remindCell", for: indexPath) as? ReminderCell else { return UITableViewCell()}
        //Each pool of tableview has there own info :)
        let reminder = ReminderService.shared.getReminder(index: indexPath.row)
        
        cell.configCell(reminder: reminder)
        
        return cell
    }
    
    
}
