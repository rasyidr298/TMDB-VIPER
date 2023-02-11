//
//  ReviewEntitiesTest.swift
//  TMDB-VIPERTests
//
//  Created by Rasyid Ridla on 11/02/23.
//

import XCTest
@testable import TMDB_VIPER

final class ReviewEntitiesTest: XCTestCase {
  
  func testReviewEntitiesGetSet() {
    
    let author = AuthorDetails(avatarPath: "avatar_james")
    let review = MovieReview(
      id: "1",
      author: "james",
      content: "amazing movie",
      avatarPath: "avatar_james",
      authorDetails: author
    )
    
    XCTAssertNotNil(author)
    XCTAssertNotNil(review)
    XCTAssertEqual(author.avatarPath, "avatar_james")
    XCTAssertEqual(review.id, "1")
    XCTAssertEqual(review.author, "james")
    XCTAssertEqual(review.content, "amazing movie")
    XCTAssertEqual(review.avatarPath, "avatar_james")
    XCTAssertEqual(review.authorDetails, AuthorDetails(avatarPath: "avatar_james"))
  }

}
