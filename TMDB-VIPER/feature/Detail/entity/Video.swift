//
//  Video.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation

public struct MovieVideoResponse: Decodable {
  public let movieVideo: [MovieVideo]
  
  internal enum CodingKeys: String, CodingKey {
    case movieVideo = "results"
  }
}

public struct MovieVideo: Decodable {
  public let id: String?
  public let key: String?
  public let name: String?
  public let site: String?
  public let size: Int?
  public let type: String?
  
  public var youtubeURL: String? {
    guard site == "YouTube" else {
      return nil
    }
    return ApiCall.youtubeUrl + (key ?? "")
  }
  
  public var youtubeTumbnail: String? {
    guard site == "YouTube" else {
      return nil
    }
    return ApiCall.imageTumbnailYt + (key ?? "") + "/1.jpg"
  }
  
  internal enum CodingKeys: String, CodingKey {
    case id = "id"
    case key = "key"
    case name = "name"
    case site = "site"
    case size = "size"
    case type = "type"
  }
}
