//
//  ViewController.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/25/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let proxy =  ServiceAPIProxyFactory.createServiceAPIProxy()
    proxy.goals { (error, goals) in
      print(error, goals)
    }
  }


}

