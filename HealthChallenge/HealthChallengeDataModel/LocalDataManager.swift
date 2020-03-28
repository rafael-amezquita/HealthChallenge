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
  
  static let shared = LocalDataModelManager()
  
  private var database: Realm?
  
  private init() {
    do {
      database = try Realm()
      // TODO: customize the db path
      print(Realm.Configuration.defaultConfiguration.fileURL)
    } catch {
      print(error)
    }
  }
  
  func save(goals: [Goal]) {
    
    guard let db = database else {
      // TODO: handle this error
      print("an error was occured storing the data")
      return
    }
    
    // TODO: Check if they already exis
    for goal in goals {
      let goalModel = GoalModel.instance(from: goal)
      do {
        try db.write {
          db.add(goalModel)
        }
      } catch {
        print(error)
      }
    }
    
  }
  
  func getGoals() -> [Goal] {
    guard let db = database else {
      // TODO: handle this error
      print("an error was occured storing the data")
      return [Goal]()
    }
    
    var goals = [Goal]()

    let models = db.objects(GoalModel.self)
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

    
    return goals
  }
  
  func get(goal: Goal) -> Goal? {
    return nil
  }
  
  func updateAll() -> Bool {
    return false
  }
  
  func update(goal: Goal) -> Bool {
    return false
  }
  
  func removeAll() -> Bool {
    return false
  }
  
  func remove(goal: Goal) -> Bool {
    return false
  }
}
