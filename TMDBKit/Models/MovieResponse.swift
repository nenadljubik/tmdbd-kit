//
//  MovieResponse.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//


import Foundation

public struct MovieResponse: Codable {
    public let page: Int?
    public let results: [Movie]?
    public let totalPages: Int?
    public let totalResults: Int?
    
    public init(page: Int? = nil, results: [Movie]? = nil, totalPages: Int? = nil, totalResults: Int? = nil) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

public struct Movie: Codable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let id: Int?
    public let title: String?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let posterPath: String?
    public let mediaType: String?
    public let genreIds: [Int]?
    public let popularity: Double?
    public let releaseDate: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?
    
    public init(adult: Bool? = nil, backdropPath: String? = nil, id: Int? = nil, title: String? = nil, originalLanguage: String? = nil, originalTitle: String? = nil, overview: String? = nil, posterPath: String? = nil, mediaType: String? = nil, genreIds: [Int]? = nil, popularity: Double? = nil, releaseDate: String? = nil, video: Bool? = nil, voteAverage: Double? = nil, voteCount: Int? = nil) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.id = id
        self.title = title
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.mediaType = mediaType
        self.genreIds = genreIds
        self.popularity = popularity
        self.releaseDate = releaseDate
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }

    public static func dummy(id: Int = 19995) -> Movie {
        Movie(
            adult: false,
            backdropPath: "/7JNzw1tSZZEgsBw6lu0VfO2X2Ef.jpg",
            id: id,
            title: "Avatar",
            originalLanguage: "en",
            originalTitle: "Avatar",
            overview: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora.",
            posterPath: "/gKY6q7SjCkAU6FqvqWybDYgUKIF.jpg",
            mediaType: "movie",
            genreIds: [28, 12, 14, 878],
            popularity: 120.5635,
            releaseDate: "2009-12-16",
            video: false,
            voteAverage: 7.597,
            voteCount: 33028
        )
    }
}
