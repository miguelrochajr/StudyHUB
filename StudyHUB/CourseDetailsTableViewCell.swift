//
//  CourseDetailsTableViewCell.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/18/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import UIKit

class CourseDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var university: UILabel!
    @IBOutlet weak var semester: UILabel!
    @IBOutlet weak var courseCode: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
