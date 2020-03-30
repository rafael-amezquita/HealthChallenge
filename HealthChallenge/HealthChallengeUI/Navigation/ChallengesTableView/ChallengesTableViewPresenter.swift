//
//  ChallengesTableViewPresenter.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/28/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation
import HealthKit

class ChallengesTableViewPresenter {
  
  private let dataManager: LocalDataModelManager
  private var row: Int = 0
  
  private var hkStore = HKHealthStore()
  
  var selectedGoal: Goal {
    return goals[row]
  }
  
  var goals: [Goal] {
    return dataManager.getGoals()
  }
  
  var stepsNumber: Double = 0
  
  init() {
    dataManager = LocalDataModelManager.shared
  }
  
  func goal(from row: Int) {
    self.row = row
  }
  
  func configureHealthKit(_ completion: @escaping (Double)->Void) {
    authorization { (isSuccessful) in
      if isSuccessful{
        self.retrieveStepsCount(completion)
      }
    }
  }
  
  // MARK: - Healthkit
  
  private func authorization(completion: @escaping (Bool) -> Void) {
    guard HKHealthStore.isHealthDataAvailable() else {
      completion(false)
      return
    }
    
    let permissionToRead = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
    
    hkStore.requestAuthorization(toShare: nil, read: permissionToRead) { (isSuccessful, error) in
      guard error == nil, isSuccessful else {
        completion(false)
        return
      }
      
      completion(isSuccessful)
    }
    
  }
  
  private func retrieveStepsCount(_ completion: @escaping (Double)->Void) {
    
    guard let stepsCount = HKQuantityType.quantityType(forIdentifier:
      HKQuantityTypeIdentifier.stepCount) else {
        return
    }
    
    let date = Date()
    let cal = Calendar(identifier: Calendar.Identifier.gregorian)
    let newDate = cal.startOfDay(for: date)
    
    let predicate = HKQuery.predicateForSamples(withStart: newDate, end: Date(), options: .strictStartDate)
    var interval = DateComponents()
    interval.day = 1
    
    let query = HKStatisticsCollectionQuery(quantityType: stepsCount,
                                            quantitySamplePredicate: predicate,
                                            options: [.cumulativeSum],
                                            anchorDate: newDate as Date,
                                            intervalComponents: interval)
    query.initialResultsHandler = {
      query, queryResults, error in
      
      guard let result = queryResults, error == nil else {
        completion(self.stepsNumber)
        return
      }
      
      self.stepsNumber = result.statistics().first?.sumQuantity()?.doubleValue(for: .count()) ?? 0.0
      print(self.stepsNumber)
      completion(self.stepsNumber)
    }
    
    hkStore.execute(query)
  }
}
