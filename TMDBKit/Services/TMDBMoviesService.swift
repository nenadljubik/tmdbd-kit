//
//  TMDBMoviesService.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//


import Foundation

public protocol TMDBMoviesServiceProtocol {
    func fetchTrendingMovies(page: Int) async throws -> MovieResponse
}

public final class TMDBMoviesService: TMDBMoviesServiceProtocol {
    private let networkService: NetworkServiceProtocol

    public convenience init() {
        self.init(networkService: NetworkService())
    }

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    public func fetchTrendingMovies(page: Int) async throws -> MovieResponse {
        try await networkService.request(MovieRouter.trending(page: page))
    }
}
