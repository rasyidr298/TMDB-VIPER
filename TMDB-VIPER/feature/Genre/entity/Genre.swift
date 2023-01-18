//
//  Genre.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation

struct genreResponse: Decodable {
  let genre: [Genre]
  
  internal enum CodingKeys: String, CodingKey {
    case genre = "genres"
  }
}

struct Genre: Decodable {
  let id: Int?
  let name: String?
  
  internal enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
  }
}
