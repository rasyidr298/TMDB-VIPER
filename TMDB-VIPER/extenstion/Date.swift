//
//  Date.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 24/01/23.
//

import Foundation

extension Date {
  func dateToString() -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM yyyy HH:mm"
    dateFormatter.locale = Locale(identifier: "id")
    let stringDate = dateFormatter.string(from: self)
    return stringDate
  }
}
