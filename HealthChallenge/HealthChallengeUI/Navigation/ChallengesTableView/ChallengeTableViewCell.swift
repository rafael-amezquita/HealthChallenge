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
  @IBOutlet weak var challengeDescription: UILabel!
  
  // TODO: put an image for each type
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setup(from goal: Goal) {
    challengeTitle.text = goal.title
    challengeDescription.text = goal.description
  }
  
}
