//
//  JSONFixtures.swift
//  TMDBKitTests
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import Foundation

enum JSONFixtures {
    enum MovieResponse {
        static let valid = """
        {
          "page": 1,
          "results": [
            {
              "adult": false,
              "backdrop_path": "/test.jpg",
              "id": 19995,
              "title": "Avatar",
              "original_language": "en",
              "original_title": "Avatar",
              "overview": "Test overview",
              "poster_path": "/poster.jpg",
              "media_type": "movie",
              "genre_ids": [28],
              "popularity": 120.0,
              "release_date": "2009-12-16",
              "video": false,
              "vote_average": 7.5,
              "vote_count": 30000
            }
          ],
          "total_pages": 1,
          "total_results": 1
        }
        """

        static let invalid = "{ invalid json }"
    }
}
