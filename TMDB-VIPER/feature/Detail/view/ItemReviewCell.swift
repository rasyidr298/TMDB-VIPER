//
//  ItemReviewCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import UIKit

class ItemReviewCell: UITableViewCell {
  
  @IBOutlet weak var lblAuthor: UILabel!
  @IBOutlet weak var lblContent: UILabel!
  @IBOutlet weak var imgAvatar: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func setupView(review: MovieReview) {
    lblAuthor.text = review.author
    lblContent.text = review.content
    imgAvatar.setImageUrl(urlPath: (review.avatarPath ?? review.authorDetails.avatarPathUrl) ?? "")
  }
}
