//
//  ItemGenreCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import UIKit
import SnapKit

class ItemGenreCell: UICollectionViewCell {
  
  lazy var lblTitle: UILabel = {
    let lblTitle = UILabel()
    lblTitle.translatesAutoresizingMaskIntoConstraints = false
    lblTitle.textColor = UIColor.white
    lblTitle.font = UIFont.font(type: .sfSemibold, size: CGFloat.size_18)
    lblTitle.textAlignment = .center
    contentView.addSubview(lblTitle)
    return lblTitle
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureView(genre: Genre) {
    lblTitle.text = genre.name
  }
  
  private func setupConstraint() {
    contentView.backgroundColor = UIColor.random
    contentView.radiusView = 8
    
    lblTitle.snp.makeConstraints { make in
      make.top.equalTo(contentView)
      make.bottom.equalTo(contentView)
      make.right.equalTo(contentView)
      make.left.equalTo(contentView)
    }
  }
}
