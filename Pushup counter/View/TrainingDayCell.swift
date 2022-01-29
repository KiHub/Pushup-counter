//
//  TrainingDayCell.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 24.01.2022.
//

import UIKit

class TrainingDayCell: UITableViewCell {
    
    
    @IBOutlet weak var celllabel: UILabel!
    
    @IBOutlet weak var cellBubble: UIImageView!
    
    @IBOutlet weak var cellCheck: UIImageView!
    //  @IBOutlet weak var celllabel: UILabel!
    
//    @IBOutlet weak var cellBubble: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  cellBubble.layer.cornerRadius = cellBubble.frame.size.height / 3

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       // cellBubble.image = UIImage(named: "ButtonDoneLong")
        // Configure the view for the selected state
    }
    
}
