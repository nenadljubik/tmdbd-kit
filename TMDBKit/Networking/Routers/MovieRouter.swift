//
//  MovieRouter.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//


import Foundation

enum MovieRouter: Routable {
    case trending(page: Int)
    case movieDetails(id: Int)

    var path: String {
        switch self {
        case .trending:
            "/3/trending/movie/week"
        case .movieDetails(let id):
            "/3/movie/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .trending, .movieDetails:
            .get
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .trending(let page):
            [URLQueryItem(name: "page", value: "\(page)")]
        case .movieDetails:
            []
        }
    }
}
