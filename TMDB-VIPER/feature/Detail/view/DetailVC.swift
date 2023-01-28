//
//  DetailVC.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import UIKit

class DetailVC: UIViewController {
  
  var presenter: DetailViewToPresenterProtocol?
  var movie: Movie?
  private var reviews = [MovieReview]()
  private var movieVideo: MovieVideo?
  private var curentPage = 1
  
  @IBOutlet weak var viewTblReview: UIView!
  @IBOutlet weak var btnTrailler: UIButton!
  @IBOutlet weak var actIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tblViewReview: UITableView!
  @IBOutlet weak var lblOverview: UILabel!
  @IBOutlet weak var lblVote: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var imgPoster: UIImageView!
  @IBOutlet weak var imgBackdrop: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  @IBAction func didTapTrailler(_ sender: Any) {
    if let url = movieVideo?.youtubeURL {
      UIApplication.shared.open(url)
    }
  }
  
  // MARK: Configure View
  private func configureView() {
    self.lblOverview.text = movie?.overview
    self.lblVote.text = movie?.voteAveragePercentText
    self.lblTitle.text = movie?.title
    self.imgBackdrop.setImageUrl(urlPath: movie?.backdropURL ?? "")
    self.imgPoster.setImageUrl(urlPath: movie?.posterURL ?? "")
    
    presenter?.startFetchReviews(idMovie: movie?.id ?? 0, page: 1)
    presenter?.startFetchVideo(idMovie: movie?.id ?? 0)
    actIndicator.start()
    
    self.tblViewReview.rowHeight = UITableView.automaticDimension
    self.tblViewReview.delegate = self
    self.tblViewReview.dataSource = self
    self.tblViewReview.register(cell: ItemReviewCell.self)
  }
}

// MARK: Fetching Data
extension DetailVC: DetailPresenterToViewProtocol {
  func showReviews(reviews: [MovieReview]) {
    self.reviews.append(contentsOf: reviews)
    self.tblViewReview.reloadData()
    actIndicator.stop()
    
    if reviews.isEmpty {
      viewTblReview.isHidden = false
      self.showLottie(name: "empty", view: viewTblReview, loop: .loop, speed: 0.5)
    }else {
      viewTblReview.isHidden = true
    }
  }
  
  func showVideo(videos: [MovieVideo]) {
    actIndicator.stop()
    let _ = videos.map({ video in
      if video.type == "Trailer" {
        self.movieVideo = video
      }
    })
  }
  
  func showError(error: Error) {
    self.showGeneralError(message: error.localizedDescription)
    actIndicator.stop()
  }
}

// MARK: Configure TableView
extension DetailVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return reviews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(for: indexPath) as ItemReviewCell
    cell.configureView(review: reviews[indexPath.row])
    
    if indexPath.row == reviews.count - 1 {
      curentPage += 1
      presenter?.startFetchReviews(idMovie: movie?.id ?? 0, page: 1)
    }
    
    return cell
  }
}
