//
//  Routable.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//


import Foundation

public protocol Routable {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
    var body: Data? { get }
}

public extension Routable {
    var headers: [String: String] { [:] }
    var queryItems: [URLQueryItem] { [] }
    var body: Data? { nil }
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org") else {
            fatalError("Invalid TMDB base URL - this should never happen")
        }
        return url
    }
}
