//
//  MovieRouter.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//


import Foundation

enum MovieRouter: Routable {
    case trending(page: Int)

    var path: String {
        switch self {
        case .trending:
            "/3/trending/movie/week"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .trending:
            .get
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .trending(let page):
            [URLQueryItem(name: "page", value: "\(page)")]
        }
    }
}
