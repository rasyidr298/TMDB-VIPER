//
//  ActivityIndicator.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 19/01/23.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
  func stop() {
    self.stopAnimating()
    self.hidesWhenStopped = true
  }
  
  func start() {
    self.startAnimating()
  }
}
