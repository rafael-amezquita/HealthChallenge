//
//  SplashViewController.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/27/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import UIKit
import Lottie

// TODO: handle dark-mode

class SplashViewController: UIViewController {
  
  @IBOutlet weak var loadingView: UIView!
  private let animation = AnimationView(name: "splash-loading-aimation")
  
  private let presenter = SplashViewPresenter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(animation)
    // TODO: apply constraints
    animation.frame = view.frame
    animation.loopMode = .loop
    animation.play()
    
    presenter.fetchGoal { (isFetchSuccessful) in
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
        self.animation.stop()
        self.performSegue(withIdentifier: "navigationSegue", sender: nil)
      }
    }
  }
  
}
