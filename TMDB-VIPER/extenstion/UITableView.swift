//
//  UITableView.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 25/01/23.
//

import UIKit

extension UITableView {
  func register<T: UITableViewCell>(cell: T.Type) {
    register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
  }
}
