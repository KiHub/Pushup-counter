//
//  ChallengeCounterViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 25.01.2022.
//

import UIKit
import KDCircularProgress



class ChallengeCounterViewController: UIViewController {
    
    var labelNumber = 0
    
    @IBOutlet weak var progressView: KDCircularProgress!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var cupImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(labelNumber)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
