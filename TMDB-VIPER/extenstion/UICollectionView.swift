//
//  UICollectionViewCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import UIKit

extension UICollectionView {
  func register<T: UICollectionViewCell>(cell: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
  
  func register<T: UICollectionReusableView>(header: T.Type) {
    register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
  }
  
  func register<T: UICollectionReusableView>(footer: T.Type) {
    register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
  }
  
  func dequeue<T: UICollectionReusableView>(for indexPath: IndexPath, kind: String) -> T {
    return dequeueReusableSupplementaryView( ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
  }
}
