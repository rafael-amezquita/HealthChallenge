//
//  ChallengesTableViewPresenter.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/28/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation

class ChallengesTableViewPresenter {
  
  private let dataManager: LocalDataModelManager
  private var row: Int = 0
  
  var selectedGoal: Goal {
    return goals[row]
  }
  
  var goals: [Goal] {
    return dataManager.getGoals()
  }
  
  init() {
    dataManager = LocalDataModelManager.shared
  }
  
  func goal(from row: Int) {
    self.row = row
  }
}
