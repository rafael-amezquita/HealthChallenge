//
//  ServiceAPIProxyTest.swift
//  HealthChallengeTests
//
//  Created by Rafael Andres Amezquita Mejia on 3/25/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import XCTest
@testable import HealthChallenge

class ServiceAPIProxyTest: XCTestCase {
  
  var proxy: ServicesAPIProxyProtocol!
  
  override func setUp() {
    proxy =  ServiceAPIProxyFactory.createServiceAPIProxy()
  }
  
  func test_apiGoals_shouldReturnGoalsArray() {
    let exp = expectation(description: "loading goals")
    
    var goalsList: [Goal]?
    proxy.goals { (_, goals) in
      goalsList = goals
      exp.fulfill()
    }
    
    wait(for: [exp], timeout: 3)
    
    XCTAssertNotNil(goalsList)
  }
  
  
}
