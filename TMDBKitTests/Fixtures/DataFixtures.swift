//
//  DataFixtures.swift
//  TMDBKitTests
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import Foundation
@testable import TMDBKit

class DataFixtures {
    // MARK: - Movie Utils

    enum MovieUtils {
        static func create(
            id: Int = FixturesConstants.Movie.id,
            title: String = FixturesConstants.Movie.title,
            voteAverage: Double = FixturesConstants.Movie.voteAverage
        ) -> Movie {
            Movie(
                adult: FixturesConstants.Movie.adult,
                backdropPath: FixturesConstants.Movie.backdropPath,
                id: id,
                title: title,
                originalLanguage: FixturesConstants.Movie.originalLanguage,
                originalTitle: FixturesConstants.Movie.originalTitle,
                overview: FixturesConstants.Movie.overview,
                posterPath: FixturesConstants.Movie.posterPath,
                mediaType: FixturesConstants.Movie.mediaType,
                genreIds: FixturesConstants.Movie.genreIds,
                popularity: FixturesConstants.Movie.popularity,
                releaseDate: FixturesConstants.Movie.releaseDate,
                video: FixturesConstants.Movie.video,
                voteAverage: voteAverage,
                voteCount: FixturesConstants.Movie.voteCount
            )
        }

        static func createList(count: Int = 3) -> [Movie] {
            (0..<count).map { index in
                create(
                    id: FixturesConstants.Movie.id + index,
                    title: "\(FixturesConstants.Movie.title) \(index + 1)"
                )
            }
        }
    }

    // MARK: - MovieResponse Utils

    enum MovieResponseUtils {
        static func create(
            page: Int = FixturesConstants.Response.page,
            movies: [Movie]? = nil
        ) -> MovieResponse {
            MovieResponse(
                page: page,
                results: movies ?? [MovieUtils.create()],
                totalPages: FixturesConstants.Response.totalPages,
                totalResults: FixturesConstants.Response.totalResults
            )
        }

        static func createEmpty() -> MovieResponse {
            MovieResponse(
                page: FixturesConstants.Response.page,
                results: [],
                totalPages: 0,
                totalResults: 0
            )
        }

        static func createMultiPage() -> MovieResponse {
            MovieResponse(
                page: 1,
                results: MovieUtils.createList(count: 20),
                totalPages: 5,
                totalResults: 100
            )
        }
    }

    // MARK: - TVShow Utils

    enum TVShowUtils {
        static func create(
            id: Int = FixturesConstants.TVShow.id,
            name: String = FixturesConstants.TVShow.name
        ) -> TVShow {
            TVShow(
                adult: FixturesConstants.TVShow.adult,
                backdropPath: FixturesConstants.TVShow.backdropPath,
                genreIds: FixturesConstants.TVShow.genreIds,
                id: id,
                originCountry: FixturesConstants.TVShow.originCountry,
                originalLanguage: FixturesConstants.TVShow.originalLanguage,
                originalName: FixturesConstants.TVShow.originalName,
                overview: FixturesConstants.TVShow.overview,
                popularity: FixturesConstants.TVShow.popularity,
                posterPath: FixturesConstants.TVShow.posterPath,
                firstAirDate: FixturesConstants.TVShow.firstAirDate,
                name: name,
                voteAverage: FixturesConstants.TVShow.voteAverage,
                voteCount: FixturesConstants.TVShow.voteCount
            )
        }

        static func createList(count: Int = 3) -> [TVShow] {
            (0..<count).map { index in
                create(
                    id: FixturesConstants.TVShow.id + index,
                    name: "\(FixturesConstants.TVShow.name) \(index + 1)"
                )
            }
        }
    }

    // MARK: - TVShowResponse Utils

    enum TVShowResponseUtils {
        static func create(
            page: Int = FixturesConstants.Response.page,
            tvShows: [TVShow]? = nil
        ) -> TVShowResponse {
            TVShowResponse(
                page: page,
                results: tvShows ?? [TVShowUtils.create()],
                totalPages: FixturesConstants.Response.totalPages,
                totalResults: FixturesConstants.Response.totalResults
            )
        }

        static func createEmpty() -> TVShowResponse {
            TVShowResponse(
                page: FixturesConstants.Response.page,
                results: [],
                totalPages: 0,
                totalResults: 0
            )
        }
    }
}
