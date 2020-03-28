//
//  LocalDataManagerTest.swift
//  HealthChallengeTests
//
//  Created by Rafael Andres Amezquita Mejia on 3/26/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import XCTest
@testable import HealthChallenge

class LocalDataManagerTest: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func test_save_shouldSaveGoalsAsModels() {
    // TODO: figure out how to handle tests for data base to avoid
    // having mocked data stored in the same data base
    // TODO: Mock service response
    // LocalDataModelManager.shared.save(goals: goals)
  }
  
  func test_getGoals_shouldRetrieveGoalsAsServiceModels() {
    let goals = LocalDataModelManager.shared.getGoals()
    
    XCTAssertNotNil(goals)
    XCTAssertTrue(goals.count > 0)
    
  }
  
}
