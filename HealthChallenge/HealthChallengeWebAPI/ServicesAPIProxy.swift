//
//  ServicesAPIProxy.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/25/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation
import Alamofire

protocol ServicesAPIProxyProtocol {
  func goals(_ completionHandler: @escaping (Error?, [Goal]) -> Void )
}

class ServicesAPIProxy: ServicesAPIProxyProtocol {
  
  // TODO: take the URL from .plist
  let baseURL = "https://thebigachallenge.appspot.com/_ah/api/myApi/v1/goals"
  
  private func parse(_ dataResponse: Data) -> [Goal] {
    var goalsList = [Goal]()
    
    do {
      let goals = try JSONDecoder().decode(Goals.self, from: dataResponse)
      goalsList = goals.items
      save(goals: goalsList)
    } catch {
      // TODO: handle error
      print(error)
    }
    
    return goalsList
  }
  
  private func save(goals: [Goal]) {
    LocalDataModelManager.save(goals: goals)
  }
  
  // MARK: - API
  func goals(_ completionHandler: @escaping (Error?, [Goal]) -> Void ) {
    Alamofire.request(baseURL).responseJSON {
      [weak self] (jsonResponse) in
      
      guard let self = self else {
        // TODO: handle error
        return
      }
      
      var goals = [Goal]()
      
      if let error = jsonResponse.error {
        completionHandler(error, goals)
        return
      }
      
      if let dataResponse = jsonResponse.data{
        goals = self.parse(dataResponse)
        completionHandler(nil, goals)
      }
      
    }
  }
  
  
  
}
