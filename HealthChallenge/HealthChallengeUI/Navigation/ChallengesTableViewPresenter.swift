//
//  ChallengesTableViewPresenter.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/28/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation

class ChallengesTableViewPresenter {
  
  private let proxy: ServicesAPIProxyProtocol
  
  init() {
    proxy = ServiceAPIProxyFactory.createServiceAPIProxy()
  }
  
  
}
