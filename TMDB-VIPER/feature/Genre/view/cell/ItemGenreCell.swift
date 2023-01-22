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
    lblTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
    lblTitle.textAlignment = .center
    contentView.addSubview(lblTitle)
    return lblTitle
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView(genre: Genre) {
    lblTitle.text = genre.name
  }
  
  private func addView() {
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
