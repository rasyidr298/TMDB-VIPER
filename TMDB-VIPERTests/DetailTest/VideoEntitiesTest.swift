//
//  VideoEntitiesTest.swift
//  TMDB-VIPERTests
//
//  Created by Rasyid Ridla on 11/02/23.
//

import XCTest
@testable import TMDB_VIPER

final class VideoEntitiesTest: XCTestCase {
  
  func testVideoEntitiesGetSet() {
    
    let video = MovieVideo(
      id: "1",
      key: "12345",
      name: "avenger",
      site: "Youtube",
      size: 1,
      type: "Trailer"
    )
    
    XCTAssertNotNil(video)
    XCTAssertEqual(video.id, "1")
    XCTAssertEqual(video.key, "12345")
    XCTAssertEqual(video.name, "avenger")
    XCTAssertEqual(video.site, "Youtube")
    XCTAssertEqual(video.size, 1)
    XCTAssertEqual(video.type, "Trailer")
  }

}
