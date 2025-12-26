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
}
