//
//  FixturesConstants.swift
//  TMDBKitTests
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import Foundation

enum FixturesConstants {
    enum Movie {
        static let id = 19995
        static let adult = false
        static let backdropPath = "/7JNzw1tSZZEgsBw6lu0VfO2X2Ef.jpg"
        static let title = "Avatar"
        static let originalLanguage = "en"
        static let originalTitle = "Avatar"
        static let overview = "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora."
        static let posterPath = "/gKY6q7SjCkAU6FqvqWybDYgUKIF.jpg"
        static let mediaType = "movie"
        static let genreIds = [28, 12, 14, 878]
        static let popularity = 120.5635
        static let releaseDate = "2009-12-16"
        static let video = false
        static let voteAverage = 7.597
        static let voteCount = 33028
    }

    enum MovieDetails {
        static let id = 550
        static let adult = false
        static let backdropPath = "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg"
        static let budget = 63000000
        static let homepage = "http://www.foxmovies.com/movies/fight-club"
        static let imdbId = "tt0137523"
        static let originalLanguage = "en"
        static let originalTitle = "Fight Club"
        static let overview = "A ticking-time-bomb insomniac and a slippery soap salesman."
        static let popularity = 61.416
        static let posterPath = "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg"
        static let releaseDate = "1999-10-15"
        static let revenue = 100853753
        static let runtime = 139
        static let status = "Released"
        static let tagline = "Mischief. Mayhem. Soap."
        static let title = "Fight Club"
        static let video = false
        static let voteAverage = 8.433
        static let voteCount = 26280
    }

    enum Genre {
        static let dramaId = 18
        static let dramaName = "Drama"
        static let thrillerId = 53
        static let thrillerName = "Thriller"
        static let actionId = 28
        static let actionName = "Action"
    }

    enum ProductionCompany {
        static let id = 508
        static let logoPath = "/7cxRWzi4LsVm4Utfpr1hfARNurT.png"
        static let name = "Regency Enterprises"
        static let originCountry = "US"
    }

    enum ProductionCountry {
        static let iso31661 = "US"
        static let name = "United States of America"
    }

    enum SpokenLanguage {
        static let englishName = "English"
        static let iso6391 = "en"
        static let name = "English"
    }

    enum TVShow {
        static let id = 111110
        static let adult = false
        static let backdropPath = "/d0dRxEmbrYbkeJql4j2DDDYEyN.jpg"
        static let genreIds = [10759, 10765]
        static let originCountry = ["US"]
        static let originalLanguage = "en"
        static let originalName = "ONE PIECE"
        static let overview = "With his straw hat and ragtag crew, young pirate Monkey D. Luffy goes on an epic voyage for treasure."
        static let popularity = 23.4461
        static let posterPath = "/lXl3ZbY5TksOdt6eYgdyg6vsnFW.jpg"
        static let firstAirDate = "2023-08-31"
        static let name = "ONE PIECE"
        static let voteAverage = 8.1
        static let voteCount = 1444
    }

    enum Response {
        static let page = 1
        static let totalPages = 1
        static let totalResults = 1
    }

    enum Search {
        static let avatarQuery = "Avatar"
        static let onePieceQuery = "One Piece"
    }
}
