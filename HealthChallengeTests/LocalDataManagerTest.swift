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
  
  let dataManager = LocalDataModelManager.shared
  let mockedProxy = MockedProxy()
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    dataManager.removeAll()
  }
  
  func test_save_shouldSaveGoalsAsModels() {
    mockedProxy.goals { (_, goals) in
      let didSave = self.dataManager.save(goals: goals)
      XCTAssertTrue(didSave)
    }
  }
  
  func test_getGoals_shouldRetrieveGoalsAsServiceModels() {
    
    mockedProxy.goals { (_, goals) in
      let didSave = self.dataManager.save(goals: goals)
      XCTAssertTrue(didSave)
      
      let goals = self.dataManager.getGoals()
      XCTAssertNotNil(goals)
      XCTAssertTrue(goals.count > 0)
    }
    
    
    
  }
  
}
