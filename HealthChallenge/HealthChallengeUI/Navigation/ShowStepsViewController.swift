//
//  ShowStepsViewController.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/29/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import UIKit
import Lottie

class ShowStepsViewController: UIViewController {
  
  @IBOutlet weak var animationContainer: UIView!
  @IBOutlet weak var messageLabel: UILabel!
  
  private let animation = AnimationView(name: "phone-running")
  private var presenter: ShowStepsPresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    animationContainer.addSubview(animation)
    animation.loopMode = .loop
    animation.play()
    
    if let steps = presenter?.steps {
      messageLabel.text = "Keep going, You have walked \(steps) steps"
    }
    
    setupAnimationConstraints()
  }
  
  private func setupAnimationConstraints() {
    animation.translatesAutoresizingMaskIntoConstraints = false
    animation.leftAnchor.constraint(equalTo: animationContainer.leftAnchor).isActive = true
    animation.rightAnchor.constraint(equalTo: animationContainer.rightAnchor).isActive = true
    animation.topAnchor.constraint(equalTo: animationContainer.topAnchor).isActive = true
    animation.bottomAnchor.constraint(equalTo: animationContainer.bottomAnchor).isActive = true
  }
  
  // MARK: - Bridge
  
  func setupData(from presenter: ShowStepsPresenter) {
    self.presenter = presenter
  }
  
  // MARK: - Actions
  
  @IBAction func closeButtonTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  

}
