//
//  UICollectionViewCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import Foundation
import UIKit

extension UICollectionViewCell {
  static var REUSE_IDENTIFIER: String {
    String(describing: self)
  }
}
