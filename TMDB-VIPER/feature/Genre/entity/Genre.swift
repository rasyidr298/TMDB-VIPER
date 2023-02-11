//
//  Genre.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation

struct genreResponse: Decodable {
  let genre: [Genre]?
  
  internal enum CodingKeys: String, CodingKey {
    case genre = "genres"
  }
}

//Data Response
struct Genre {
  let id: Int?
  let name: String?
  
  public static var `default`: Genre {
    Genre(id: 1, name: "Default")
  }
}

//Decodable
extension Genre: Decodable {
  internal enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
  }
}

//Equatable
extension Genre: Equatable {
  public static func ==(lhs: Genre, rhs: Genre) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name
  }
}
