//
//  LocalDataModel.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/26/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation
import RealmSwift

/*
 primary keys are used to check if the object was previously
 stored, if so, Realm won't create a new register.
 */

class GoalModel: Object {
  @objc dynamic var id = ""
  @objc dynamic var title = ""
  @objc dynamic var goalDescription = ""
  @objc dynamic var type = ""
  @objc dynamic var goal: Float = 0.0
  @objc dynamic var reward: RewardModel?
  
  static func instance(from goal: Goal) -> GoalModel {
    let model = GoalModel()
    model.id = goal.id
    model.title = goal.title
    model.goalDescription = goal.description
    model.type = goal.type.rawValue
    model.goal = goal.goal
    model.reward = RewardModel.instance(from: goal.reward, parentID: model.id)
    return model
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

class RewardModel: Object {
  @objc dynamic var trophy = ""
  @objc dynamic var points: Float = 0.0
  @objc dynamic var id = ""
  
  static func instance(from reward: Reward, parentID: String) -> RewardModel {
    let model = RewardModel()
    model.trophy = reward.trophy.rawValue
    model.points = reward.points
    model.id = parentID
    return model
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
