//
//  SplashViewPresenter.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/28/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation

class SplashViewPresenter {
  
  private let proxy: ServicesAPIProxyProtocol
  
  init() {
    proxy = ServiceAPIProxyFactory.createServiceAPIProxy()
  }
  
  // MARK: - Service fetching
  func fetchGoal(_ completion: @escaping (Bool) -> Void ) {
    // TODO: Consider creating an adapter to separate the retrieve
    //  and storing in the db into two separate responsibilities
    proxy.goals { (error, goals) in
      guard error != nil, goals.count == 0 else {
        completion(false)
        return
      }
      
      completion(true)
    }
  }
  
  
  
}
