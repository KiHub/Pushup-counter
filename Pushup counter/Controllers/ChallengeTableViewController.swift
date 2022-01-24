//
//  ChallengeTableViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 24.01.2022.
//

import UIKit

class ChallengeTableViewController: UITableViewController {
    
    var traininDays: [TrainingDay] = [
        TrainingDay(dayNumber: 1, firstSet: 4, secondSet: 2, thirdSet: 2, done: false),
        TrainingDay(dayNumber: 2, firstSet: 6, secondSet: 2, thirdSet: 2, done: false),
        TrainingDay(dayNumber: 3, firstSet: 6, secondSet: 2, thirdSet: 2, done: false),
        TrainingDay(dayNumber: 4, firstSet: 8, secondSet: 4, thirdSet: 2, done: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background2.jpg"))
        tableView.register(UINib(nibName: "TrainingDayCell", bundle: nil), forCellReuseIdentifier: "DayCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return traininDays.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! TrainingDayCell
      
        cell.celllabel.text = "Day \(traininDays[indexPath.row].dayNumber): \(traininDays[indexPath.row].firstSet)-\(traininDays[indexPath.row].secondSet)-\(traininDays[indexPath.row].thirdSet)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
