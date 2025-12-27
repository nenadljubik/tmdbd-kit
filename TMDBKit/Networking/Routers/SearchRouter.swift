//
//  SearchRouter.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 27.12.25.
//


import Foundation

enum SearchRouter: Routable {
    case searchMovies(keyword: String, page: Int)
    case searchTvShows(keyword: String, page: Int)

    var path: String {
        switch self {
        case .searchMovies:
            "/3/search/movie"
        case .searchTvShows:
            "/3/search/tv"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .searchMovies, .searchTvShows:
            .get
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .searchMovies(let keyword, let page):
            [
                URLQueryItem(name: "query", value: keyword),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        case .searchTvShows(let keyword, let page):
            [
                URLQueryItem(name: "query", value: keyword),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        }
    }
}
