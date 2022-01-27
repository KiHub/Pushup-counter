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
        TrainingDay(dayNumber: 2, firstSet: 6, secondSet: 3, thirdSet: 2, done: false),
        TrainingDay(dayNumber: 3, firstSet: 6, secondSet: 4, thirdSet: 2, done: false),
        TrainingDay(dayNumber: 4, firstSet: 8, secondSet: 4, thirdSet: 2, done: false),
        TrainingDay(dayNumber: 5, firstSet: 10, secondSet: 4, thirdSet: 4, done: false),
        TrainingDay(dayNumber: 6, firstSet: 10, secondSet: 6, thirdSet: 4, done: false),
        TrainingDay(dayNumber: 7, firstSet: 10, secondSet: 7, thirdSet: 4, done: false),
        TrainingDay(dayNumber: 8, firstSet: 12, secondSet: 4, thirdSet: 4, done: false),
        TrainingDay(dayNumber: 9, firstSet: 14, secondSet: 6, thirdSet: 4, done: false),
        TrainingDay(dayNumber: 10, firstSet: 16, secondSet: 6, thirdSet: 4, done: false),
        TrainingDay(dayNumber: 11, firstSet: 16, secondSet: 7, thirdSet: 4, done: false),
        TrainingDay(dayNumber: 12, firstSet: 16, secondSet: 8, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 13, firstSet: 16, secondSet: 10, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 14, firstSet: 18, secondSet: 12, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 15, firstSet: 18, secondSet: 14, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 16, firstSet: 20, secondSet: 10, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 17, firstSet: 22, secondSet: 10, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 18, firstSet: 24, secondSet: 12, thirdSet: 8, done: false),
        TrainingDay(dayNumber: 19, firstSet: 24, secondSet: 14, thirdSet: 8, done: false),
        TrainingDay(dayNumber: 20, firstSet: 26, secondSet: 14, thirdSet: 8, done: false),
        TrainingDay(dayNumber: 21, firstSet: 26, secondSet: 15, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 22, firstSet: 26, secondSet: 15, thirdSet: 10, done: false),
        TrainingDay(dayNumber: 23, firstSet: 26, secondSet: 15, thirdSet: 10, done: false),
        TrainingDay(dayNumber: 24, firstSet: 28, secondSet: 15, thirdSet: 10, done: false),
        TrainingDay(dayNumber: 25, firstSet: 30, secondSet: 15, thirdSet: 15, done: false),
        TrainingDay(dayNumber: 26, firstSet: 35, secondSet: 15, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 27, firstSet: 37, secondSet: 15, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 28, firstSet: 40, secondSet: 15, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 29, firstSet: 45, secondSet: 5, thirdSet: 5, done: false),
        TrainingDay(dayNumber: 30, firstSet: 50, secondSet: 0, thirdSet: 0, done: false)
        
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     //   UITabBar.setTransparentTabbar()
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
        cell.backgroundColor = .clear
     //   cell.cellBubble.layer.backgroundColor = CAGradientLayer
        
//        let gradientLayer = CAGradientLayer()
//
//        gradientLayer.colors = [UIColor.red.cgColor,
//                                UIColor.yellow.cgColor,
//                                UIColor.green.cgColor,
//                                UIColor.blue.cgColor]
//        gradientLayer.frame = cell.cellBubble.bounds
//      //  gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
//
//        cell.cellBubble.layer.addSublayer(gradientLayer)
        
        cell.celllabel.text = "Day \(traininDays[indexPath.row].dayNumber): \(traininDays[indexPath.row].firstSet)-\(traininDays[indexPath.row].secondSet)-\(traininDays[indexPath.row].thirdSet)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        performSegue(withIdentifier: "challengeSegue", sender: tableView)
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let counterChallengeVC = segue.destination as? ChallengeCounterViewController else {return}
//            counterChallengeVC.labelNumber = 500
//           // traininDays[indexPath.row].firstSet
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "challengeSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let challengeCounterVC = segue.destination as! ChallengeCounterViewController
                challengeCounterVC.setOne = traininDays[indexPath.row].firstSet
                challengeCounterVC.setTwo = traininDays[indexPath.row].secondSet
                challengeCounterVC.setThree = traininDays[indexPath.row].thirdSet
            }
        }
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


