//
//  ChallengeDetailViewController.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/27/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import UIKit
import Lottie

class ChallengeDetailViewController: UIViewController {
  
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var trophyImage: UIImageView!
  @IBOutlet weak var points: UILabel!
  
  private var presenter: ChallengeDetailsViewPresenter?
  private let animation = AnimationView(name: "details-animation")
  private var rewardImage: UIImage?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    headerView.addSubview(animation)
    animation.play()
    animation.loopMode = .loop
    
    if let presenter = self.presenter {
      setupReward(presenter.goal.reward)
    }
    
    setupAnimationConstraints()
  }
  
  private func setupAnimationConstraints() {
    animation.translatesAutoresizingMaskIntoConstraints = false
    animation.leftAnchor.constraint(equalTo: headerView.leftAnchor).isActive = true
    animation.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
    animation.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
    animation.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
  }
  
  deinit {
    animation.stop()
  }
  
  // MARK: - Bridge
  
  func setupData(from presenter: ChallengeDetailsViewPresenter) {
    self.presenter = presenter
  }
  
  // MARK: - Setup
  
  private func setupReward(_ reward: Reward) {
    points.text = "\(reward.points)"

    DispatchQueue.global().async {
     switch reward.trophy {
       case .gold:
        self.rewardImage = UIImage(named: "gold_medal")
       case .silver:
         self.rewardImage = UIImage(named: "silver_medal")
       case .bronze:
         self.rewardImage = UIImage(named: "bronze_medal")
       case .zombie:
         self.rewardImage = UIImage(named: "zombie_hand")
      }
      
      DispatchQueue.main.async {
        self.trophyImage.image = self.rewardImage
        self.trophyImage.setNeedsDisplay()
      }
      
    }
   
    
  }
  
}
