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
  @IBOutlet weak var trophyName: UILabel!
  @IBOutlet weak var points: UILabel!
  
  private var presenter: ChallengeDetailsViewPresenter?
  private let animation = AnimationView(name: "details-animation")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    headerView.addSubview(animation)
    headerView.clipsToBounds = true
    // TODO: set constraints properly
    animation.frame = headerView.frame
    animation.play()
    animation.loopMode = .loop
    
    if let presenter = self.presenter {
      setupReward(presenter.goal.reward)
    }
    
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
    trophyName.text = reward.trophy.rawValue
    points.text = "\(reward.points)"
  }
  
}
