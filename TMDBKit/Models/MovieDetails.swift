//
//  MovieDetails.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//

import Foundation

public struct MovieDetails: Codable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let belongsToCollection: MovieCollection?
    public let budget: Int?
    public let genres: [Genre]?
    public let homepage: String?
    public let id: Int?
    public let imdbId: String?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let productionCompanies: [ProductionCompany]?
    public let productionCountries: [ProductionCountry]?
    public let releaseDate: String?
    public let revenue: Int?
    public let runtime: Int?
    public let spokenLanguages: [SpokenLanguage]?
    public let status: String?
    public let tagline: String?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?
}

public struct MovieCollection: Codable {
    public let id: Int?
    public let name: String?
    public let posterPath: String?
    public let backdropPath: String?
}

public struct Genre: Codable, Identifiable {
    public let id: Int?
    public let name: String?
}

public struct ProductionCompany: Codable, Identifiable {
    public let id: Int?
    public let logoPath: String?
    public let name: String?
    public let originCountry: String?
}

public struct ProductionCountry: Codable {
    public let iso31661: String?
    public let name: String?
}

public struct SpokenLanguage: Codable {
    public let englishName: String?
    public let iso6391: String?
    public let name: String?
}
