//
//  ServiceAPIProxyFactory.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/25/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation


class ServiceAPIProxyFactory {
  
  static func createServiceAPIProxy() -> ServicesAPIProxyProtocol {
    return ServicesAPIProxy()
  }
}
