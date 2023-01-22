//
//  Double.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 21/01/23.
//

import Foundation

extension Double {
  func rating() -> String {
    let rating = Int(self)
    let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
      return acc + "⭐️"
    }
    return ratingText
  }
}
