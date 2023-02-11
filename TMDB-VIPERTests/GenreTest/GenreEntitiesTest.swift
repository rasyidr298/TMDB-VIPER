//
//  GenreEntitiesTest.swift
//  TMDB-VIPERTests
//
//  Created by Rasyid Ridla on 11/02/23.
//

import XCTest
@testable import TMDB_VIPER

final class GenreEntitiesTest: XCTestCase {
  
  func testGenreSetGet() {
    let genre = Genre(id: 1, name: "action")
    
    XCTAssertEqual(genre.id, 1)
    XCTAssertEqual(genre.name, "action")
    XCTAssertNotNil(genre)
  }

}
