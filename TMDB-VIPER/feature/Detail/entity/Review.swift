//
//  Review.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation

public struct MovieReviewResponse: Decodable {
  public let reviews: [MovieReview]
  
  internal enum CodingKeys: String, CodingKey {
    case reviews = "results"
  }
}

//data response
public struct MovieReview {
  public let id: String?
  public let author: String?
  public let content: String?
  public let avatarPath: String?
  public let authorDetails: AuthorDetails
}

public struct AuthorDetails {
  public let avatarPath: String?
  
  public var avatarPathUrl: String? {
    ApiCall.imageAvatarUrl + (avatarPath ?? "")
  }
}

//decodable
extension MovieReview: Decodable {
  internal enum CodingKeys: String, CodingKey {
    case id = "id"
    case author = "author"
    case content = "content"
    case avatarPath = "avatar_path"
    case authorDetails = "author_details"
  }
}

//decodable
extension AuthorDetails: Decodable {
  internal enum CodingKeys: String, CodingKey {
    case avatarPath = "avatar_path"
  }
}

//Equatable
extension MovieReview: Equatable {
  public static func == (lhs: MovieReview, rhs: MovieReview) -> Bool {
    return lhs.id == rhs.id &&
    lhs.author == rhs.author &&
    lhs.content == rhs.content &&
    lhs.avatarPath == rhs.avatarPath &&
    lhs.authorDetails == rhs.authorDetails
  }
}

//Equatable
extension AuthorDetails: Equatable {
  public static func == (lhs: AuthorDetails, rhs: AuthorDetails) -> Bool {
    return lhs.avatarPath == rhs.avatarPath &&
    lhs.avatarPathUrl == rhs.avatarPathUrl
  }
}
