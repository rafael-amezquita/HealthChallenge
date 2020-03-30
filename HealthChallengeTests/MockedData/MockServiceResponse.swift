//
//  MockServiceResponse.swift
//  HealthChallengeTests
//
//  Created by Rafael Andres Amezquita Mejia on 3/30/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation
@testable import HealthChallenge


class MockedProxy: ServicesAPIProxyProtocol {
  func goals(_ completionHandler: @escaping (Error?, [Goal]) -> Void ) {
    completionHandler(nil, MockedGoals.items)
  }
}

struct MockedGoals {
  static var items: [Goal] = [
    Goal(id:"1000",
               title:"Easy walk steps",
               description:"Walk 500 steps a day",
               type:.step,
               goal: 500,
               reward: Reward(trophy: .bronze,
                                    points:5)),
    Goal(id:"1001",
               title:"Medium walk steps",
               description:"Walk 1000 steps a day",
               type:.step,
               goal: 1000,
               reward: Reward(trophy: .silver,
                                    points:10)),
    Goal(id:"1002",
               title:"Hard walk steps",
               description:"Walk 6000 steps a day",
               type:.step,
               goal: 6000,
               reward: Reward(trophy: .gold,
                                    points:20))
  ]
}




