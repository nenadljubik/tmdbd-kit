//
//  TVShowResponse.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import Foundation

public struct TVShowResponse: Codable {
    public let page: Int?
    public let results: [TVShow]?
    public let totalPages: Int?
    public let totalResults: Int?
}

public struct TVShow: Codable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let genreIds: [Int]?
    public let id: Int?
    public let originCountry: [String]?
    public let originalLanguage: String?
    public let originalName: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let firstAirDate: String?
    public let name: String?
    public let voteAverage: Double?
    public let voteCount: Int?
}
