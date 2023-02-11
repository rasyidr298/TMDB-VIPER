//
//  MovieEntitiesGetSet.swift
//  TMDB-VIPERTests
//
//  Created by Rasyid Ridla on 11/02/23.
//

import XCTest
@testable import TMDB_VIPER

final class MovieEntitiesTest: XCTestCase {
  
  func testMovieEntitiesGetSet() {
    
    let movie = Movie(
      id: 1,
      title: "avenger",
      backdropPath: "backdrop_avenger",
      posterPath: "poster_avenger",
      overview: "overview_avenger",
      releaseDate: "01-01-2001",
      voteAverage: 10.0,
      voteCount: 100
    )
    
    XCTAssertEqual(movie.id, 1)
    XCTAssertEqual(movie.title, "avenger")
    XCTAssertEqual(movie.backdropPath, "backdrop_avenger")
    XCTAssertEqual(movie.posterPath, "poster_avenger")
    XCTAssertEqual(movie.overview, "overview")
    XCTAssertEqual(movie.releaseDate, "01-01-2001")
    XCTAssertEqual(movie.voteAverage, 10.0)
    XCTAssertEqual(movie.voteCount, 100)
    XCTAssertNotNil(movie)
  }
}
