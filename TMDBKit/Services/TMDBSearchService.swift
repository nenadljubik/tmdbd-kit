//
//  TMDBSearchService.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 27.12.25.
//


public protocol TMDBSearchServiceProtocol {
    func searchMovies(with keyword: String, page: Int) async throws -> MovieResponse
    func searchTvShows(with keyword: String, page: Int) async throws -> TVShowResponse
}

public final class TMDBSearchService: TMDBSearchServiceProtocol {
    private let networkService: NetworkServiceProtocol

    public convenience init() {
        self.init(networkService: NetworkService())
    }

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    public func searchMovies(with keyword: String, page: Int = 1) async throws -> MovieResponse {
        try await networkService.request(SearchRouter.searchMovies(keyword: keyword, page: page))
    }

    public func searchTvShows(with keyword: String, page: Int = 1) async throws -> TVShowResponse {
        try await networkService.request(SearchRouter.searchTvShows(keyword: keyword, page: page))
    }
}
