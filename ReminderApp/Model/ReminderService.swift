//
//  ReminderService.swift
//  ReminderApp
//
//  Created by David Murillo on 5/23/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import Foundation

class ReminderService{
    //Make a static
    static let shared = ReminderService()
    private var reminders = [Reminder]()
    //Create a method
    func create(reminder:Reminder){
        reminders.append(reminder)
    }
    
    //Update
    func update(reminder:Reminder,index:Int){
        reminders[index] = reminder
    }
    
    //Get # of reminders
    func getCount() -> Int{
        return reminders.count
    }
    //Get a specific reminder
    func getReminder(index:Int) -> Reminder{
        return reminders[index]
    }
    
    //Toggle completed status of a reminder
    func toggleCompleted(index:Int){
        var reminder = getReminder(index: index)
        reminder.isCompleted = !reminder.isCompleted
    }
    //Get the list of reminders
    func getReminders() -> [Reminder]{
        return reminders
    }
    //Delete a reminder
    func delete(index:Int){
        reminders.remove(at: index)
    }
    //Get the favoritedReminder
    func getFavoritedReminder() -> Reminder?{
        return reminders.first
    }
    
}
