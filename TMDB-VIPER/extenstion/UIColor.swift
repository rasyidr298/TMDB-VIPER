//
//  UIColor.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import Foundation
import UIKit

extension UIColor {
  static var random: UIColor {
    return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
  }
}
