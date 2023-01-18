//
//  ItemGenreCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import UIKit

class ItemGenreCell: UICollectionViewCell {

  @IBOutlet weak var viewContainer: UIView!
  @IBOutlet weak var lblTitle: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    viewContainer.backgroundColor = UIColor.random
  }
  
  func setupView(genre: Genre) {
    lblTitle.text = genre.name
  }
    
}
