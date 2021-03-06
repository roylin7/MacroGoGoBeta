//
//  CalendarFoodTableViewController.swift
//  Project-Alpha
//
//  Created by Sheryar Ali on 12/7/17.
//  Copyright © 2017 Roy Lin. All rights reserved.
//
import UIKit

class CalendarFoodTableViewController: UITableViewController {
    
    var newlist1 : [FoodLog]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var s = DataStore.shared.checkDate()
        return s.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid2", for: indexPath)
        
        
        var s = DataStore.shared.checkDate()
        if s.isEmpty{
            cell.textLabel?.text = ""
            return cell
        }
        else{
            cell.textLabel?.text = String(s[indexPath.row].foodname)
            return cell
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "flog" {
            // Get the table view row that was tapped.
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! CalendarFoodViewController
                // Pass the selected data model object to the destination view controller.
                
                var s = DataStore.shared.checkDate()
                vc.flogs = s[indexPath.row]
                
                
                // Set the navigation bar back button text.
                // If you don't do this, the back button text is this screens title text.
                // If this screen didn't have any nav bar title text, the back button text would be 'Back', by default.
                let backItem = UIBarButtonItem()
                backItem.title = "Cached Food Logs"
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
}
