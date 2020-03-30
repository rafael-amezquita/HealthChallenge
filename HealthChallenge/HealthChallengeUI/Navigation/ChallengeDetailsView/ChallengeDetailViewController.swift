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
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    trophyImage.image = rewardImage
    trophyImage.setNeedsDisplay()
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
    trophyImage.image = nil
  }
  
  // MARK: - Bridge
  
  func setupData(from presenter: ChallengeDetailsViewPresenter) {
    self.presenter = presenter
  }
  
  // MARK: - Setup
  
  private func setupReward(_ reward: Reward) {
    points.text = "\(reward.points)"
    
    switch reward.trophy {
    case .gold:
      rewardImage = UIImage(named: "gold_medal")
    case .silver:
      rewardImage = UIImage(named: "silver_medal")
    case .bronze:
      rewardImage = UIImage(named: "bronze_medal")
    case .zombie:
      rewardImage = UIImage(named: "zombie_hand")
    }
    
  }
  
}
