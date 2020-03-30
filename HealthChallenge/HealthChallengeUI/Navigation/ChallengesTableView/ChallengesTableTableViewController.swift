//
//  ChallengesTableTableViewController.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/27/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import UIKit

class ChallengesTableTableViewController: UITableViewController {
  
  private let presenter = ChallengesTableViewPresenter()
  private var steps: Double = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.configureHealthKit { (steps) in
      if steps == 0 {
        return
      }
      self.steps = steps
      DispatchQueue.main.async {
        self.performSegue(withIdentifier: "showStepsSegue", sender: nil)
      }
    }
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return presenter.goals.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeCell", for: indexPath) as? ChallengeTableViewCell else {
      return UITableViewCell()
    }
    
    let goal = presenter.goals[indexPath.row]
    cell.setup(from: goal)
    
    return cell
  }
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.goal(from: indexPath.row)
  }
  
  // MARK: - Navigation
   
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    
    if segue.identifier == "showStepsSegue" {
      requestStepsScreen(from: segue.destination)
      return
    }
    
    guard let detailController = segue.destination as? ChallengeDetailViewController else {
      return
    }
    let detailsPresenter = ChallengeDetailsViewPresenter(from: presenter.selectedGoal)
    detailController.setupData(from: detailsPresenter)
  }
  
  // MARK: - Navigation Utilities
  
  private func requestStepsScreen(from destination: UIViewController?) {
    guard let stepsController = destination as? ShowStepsViewController else {
      return
    }
    let stepsPresenter = ShowStepsPresenter(from: steps)
    stepsController.setupData(from: stepsPresenter)
  }
  
}
