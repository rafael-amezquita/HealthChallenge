//
//  DataModel.swift
//  HealthChallenge
//
//  Created by Rafael Andres Amezquita Mejia on 3/25/20.
//  Copyright © 2020 Rafael Andres Amezquita Mejia. All rights reserved.
//

import Foundation

enum TrophyType: String, Codable {
  case gold = "gold_medal"
  case silver = "silver_medal"
  case bronze = "bronze_medal"
  case zombie = "zombie_hand"
}

enum GoalType: String, Codable {
  case step = "step"
  case walking = "walking_distance"
  case running = "running_distance"
}

struct Reward: Codable {
  var trophy: TrophyType
  var points: Float
}

struct Goal: Codable {
  var id: String
  var title: String
  var description: String
  var type: GoalType
  var goal: Float
  var reward: Reward
}

struct Goals: Codable {
  var items: [Goal]
  var nextPageToken: String
}
