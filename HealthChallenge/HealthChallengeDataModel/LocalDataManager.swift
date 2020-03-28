//
//  LocalDataManager.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/26/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation
import RealmSwift

class LocalDataModelManager {
  
  static func save(goals: [Goal]) {
    // TODO: Check if they already exis
    do {
      let realm = try Realm()
      for goal in goals {
        let goalModel = GoalModel.instance(from: goal)
        print(Realm.Configuration.defaultConfiguration.fileURL)
        try realm.write {
          realm.add(goalModel)
        }
      }
    } catch {
      print(error)
    }
  }
  
  static func getGoals() -> [Goal] {
    var goals = [Goal]()
    do {
      let realm = try Realm()
      let models = realm.objects(GoalModel.self)
      for model in models {
        // TODO: save unwraped the optionals
        let reward = Reward(trophy: TrophyType(rawValue: model.reward!.trophy)!,
                            points: model.reward!.points)
        let goal = Goal(id: model.id,
                        title: model.title,
                        description: model.goalDescription,
                        type: GoalType(rawValue: model.type)!,
                        goal: model.goal,
                        reward: reward)
        goals.append(goal)
      }
    } catch {
      print(error)
    }
    
    return goals
  }
  
  static func get(goal: Goal) -> Goal? {
    return nil
  }
  
  static func updateAll() -> Bool {
    return false
  }
  
  static func update(goal: Goal) -> Bool {
    return false
  }
  
  static func removeAll() -> Bool {
    return false
  }
  
  static func remove(goal: Goal) -> Bool {
    return false
  }
}
