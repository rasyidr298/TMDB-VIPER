//
//  UIView.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import Foundation
import UIKit


extension UIView {
  @IBInspectable
  var radiusView: CGFloat {
    get {
      return self.layer.cornerRadius
    } set {
      self.layer.cornerRadius = newValue
    }
  }
}
