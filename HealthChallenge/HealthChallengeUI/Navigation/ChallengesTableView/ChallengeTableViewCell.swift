//
//  ChallengeTableViewCell.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/28/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
  
  @IBOutlet weak private var challengeTitle: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func setup(from title: String) {
    challengeTitle.text = title
  }
  
//  override func setSelected(_ selected: Bool, animated: Bool) {
//    super.setSelected(selected, animated: animated)
//
//    // Configure the view for the selected state
//  }
  
}
