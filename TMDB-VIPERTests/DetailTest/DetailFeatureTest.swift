//
//  DetailFeatureTest.swift
//  TMDB-VIPERTests
//
//  Created by Rasyid Ridla on 12/02/23.
//

import XCTest
import Alamofire
@testable import TMDB_VIPER

final class DetailFeatureTest: XCTestCase {
  
  var fakeInteractor = FakeDetailInteractor()
  var fakePresenter = FakeDetailPresenter()
  var fakeView = FakeDetailView()
  
  struct FakeDetailResult {
    static let errorDetail: AFError = .sessionDeinitialized
    
    static let successMovieVideo = [
      MovieVideo(
        id: "63c71f1341ad8d05ad97d23c",
        key: "rCOkYwLKPv8",
        name: "Waller Briefing",
        site: "Youtube",
        size: 1080,
        type: "Clip"),
      MovieVideo(
        id: "63b9b3b3f8595800c84a57e3",
        key: "SCByGJCC99M",
        name: "Tomb Scene",
        site: "Tomb Scene",
        size: 1080,
        type: "Clip")
    ]
    
    static let successReviewVideo = [
      MovieReview(
        id: "76600",
        author: "mooney240",
        content: "Avatar: The Way of Water follows in its predecessor’s footsteps with stunning effects",
        avatarPath: "avatar_money",
        authorDetails: AuthorDetails(avatarPath: "mooney240")
      ),
      MovieReview(
        id: "7660054",
        author: "MSB",
        content: "Avatar: The Way of Water clearly sets itself apart from other",
        avatarPath: "avatar_msb",
        authorDetails: AuthorDetails(avatarPath: "MSB")
      )
    ]
  }
  
  override func setUp() {
    super.setUp()
    
    fakeInteractor.presenter = fakePresenter
    fakePresenter.interactor = fakeInteractor
    fakePresenter.detailView = fakeView
  }
  
  func fetchDetail() {
    fakeInteractor.fetchVideo(idMovie: 1)
    fakeInteractor.fetchReviews(idMovie: 1, page: 1)
  }
  
  func test_success_presenter() {
    fetchDetail()
    
    guard let videos = fakePresenter.movieVideo else {
      XCTFail("Videos Nil")
      return
    }
    
    guard let reviews = fakePresenter.movieReview else {
      XCTFail("Review Nil")
      return
    }
    
    XCTAssertEqual(videos, FakeDetailResult.successMovieVideo)
    XCTAssertEqual(reviews, FakeDetailResult.successReviewVideo)
  }
  
  func test_error_presenter() {
    fetchDetail()
    
    XCTAssertEqual(fakePresenter.error?.localizedDescription, FakeDetailResult.errorDetail.localizedDescription)
  }
  
  func test_success_view() {
    fetchDetail()
    
    guard let videos = fakeView.movieVideo else {
      XCTFail("Videos Nil")
      return
    }
    
    guard let reviews = fakeView.movieReview else {
      XCTFail("Review Nil")
      return
    }
    
    XCTAssertEqual(videos, FakeDetailResult.successMovieVideo)
    XCTAssertEqual(reviews, FakeDetailResult.successReviewVideo)
  }
  
  func test_error_view() {
    fetchDetail()
    
    XCTAssertEqual(fakeView.error?.localizedDescription, FakeDetailResult.errorDetail.localizedDescription)
  }
}


//setup detail feature
extension DetailFeatureTest {
  
  //fake detail interactor
  class FakeDetailInteractor: DetailPresenterToInteractorProtocol {
    var presenter: TMDB_VIPER.DetailInteractorToPresenterProtocol?
    
    func fetchReviews(idMovie: Int, page: Int) {
      presenter?.reviewFetchedSucces(reviews: FakeDetailResult.successReviewVideo)
      presenter?.reviewFetchedFailed(error: FakeDetailResult.errorDetail)
    }
    
    func fetchVideo(idMovie: Int) {
      presenter?.videoFetchedSucces(videos: FakeDetailResult.successMovieVideo)
      presenter?.reviewFetchedFailed(error: FakeDetailResult.errorDetail)
    }
  }
  
  //fake detail presenter
  class FakeDetailPresenter: DetailInteractorToPresenterProtocol, DetailViewToPresenterProtocol {
    
    var movieVideo: [MovieVideo]?
    var movieReview: [MovieReview]?
    var error: Error?
    
    func reviewFetchedSucces(reviews: [TMDB_VIPER.MovieReview]) {
      self.movieReview = reviews
      self.detailView?.showReviews(reviews: reviews)
    }
    
    func videoFetchedSucces(videos: [TMDB_VIPER.MovieVideo]) {
      self.movieVideo = videos
      self.detailView?.showVideo(videos: videos)
    }
    
    func reviewFetchedFailed(error: Error) {
      self.error = error
      self.detailView?.showError(error: error)
    }
    
    var detailView: TMDB_VIPER.DetailPresenterToViewProtocol?
    
    var interactor: TMDB_VIPER.DetailPresenterToInteractorProtocol?
    
    var router: TMDB_VIPER.DetailPresenterToRouterProtocol?
    
    func startFetchReviews(idMovie: Int, page: Int) {}
    
    func startFetchVideo(idMovie: Int) {}
  }
  
  //fake detail view
  class FakeDetailView: DetailPresenterToViewProtocol {
    
    var movieVideo: [MovieVideo]?
    var movieReview: [MovieReview]?
    var error: Error?
    
    func showReviews(reviews: [TMDB_VIPER.MovieReview]) {
      self.movieReview = reviews
    }
    
    func showVideo(videos: [TMDB_VIPER.MovieVideo]) {
      self.movieVideo = videos
    }
    
    func showError(error: Error) {
      self.error = error
    }    
  }
}
