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
      print(Realm.Configuration.defaultConfiguration.fileURL as Any)
    } catch {
      print(error)
    }
  }
  
  @discardableResult
  func save(goals: [Goal]) -> Bool {
    var didSaveRecords = false
    
    guard let db = database else {
      // TODO: handle this error
      print("an error was occured storing the data")
      return false
    }
    
    for goal in goals {
      let goalModel = GoalModel.instance(from: goal)
      do {
        try db.write {
          db.add(goalModel, update: .modified)
          didSaveRecords = true
        }
      } catch {
        print(error)
      }
    }
    
    return didSaveRecords
    
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
  
  @discardableResult
  func removeAll() -> Bool {
    var didRemoveRecords = false
    
    guard let db = database else {
      print("an error was occured removing the data")
      return didRemoveRecords
    }
    
    do {
      try db.write {
        db.deleteAll()
        didRemoveRecords = true
      }
    } catch {
      print(error)
    }
    
    return didRemoveRecords
  }
  
}
