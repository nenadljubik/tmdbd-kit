//
//  TMDBSearchServiceTests.swift
//  TMDBKitTests
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import XCTest
@testable import TMDBKit

final class TMDBSearchServiceTests: XCTestCase {
    var sut: TMDBSearchService!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = TMDBSearchService(networkService: mockNetworkService)
    }

    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testSearchMoviesSuccess() async throws {
        mockNetworkService.mockResponse = DataFixtures.MovieResponseUtils.create()

        let result = try await sut.searchMovies(with: FixturesConstants.Search.avatarQuery, page: 1)

        XCTAssertEqual(mockNetworkService.requestCallCount, 1)
        XCTAssertEqual(result.page, FixturesConstants.Response.page)
        XCTAssertEqual(result.results?.first?.title, FixturesConstants.Movie.title)
    }

    func testSearchTVShowsSuccess() async throws {
        mockNetworkService.mockResponse = DataFixtures.TVShowResponseUtils.create()

        let result = try await sut.searchTvShows(with: FixturesConstants.Search.onePieceQuery, page: 1)

        XCTAssertEqual(mockNetworkService.requestCallCount, 1)
        XCTAssertEqual(result.page, FixturesConstants.Response.page)
        XCTAssertEqual(result.results?.first?.name, FixturesConstants.TVShow.name)
    }

    func testSearchMoviesWithPagination() async throws {
        mockNetworkService.mockResponse = DataFixtures.MovieResponseUtils.createMultiPage()

        let result = try await sut.searchMovies(with: FixturesConstants.Search.avatarQuery, page: 1)

        XCTAssertEqual(result.page, 1)
        XCTAssertEqual(result.totalPages, 5)
        XCTAssertEqual(result.totalResults, 100)
        XCTAssertEqual(result.results?.count, 20)
    }

    func testSearchMoviesEmptyResults() async throws {
        mockNetworkService.mockResponse = DataFixtures.MovieResponseUtils.createEmpty()

        let result = try await sut.searchMovies(with: "NonExistentMovie", page: 1)

        XCTAssertEqual(mockNetworkService.requestCallCount, 1)
        XCTAssertEqual(result.results?.count, 0)
        XCTAssertEqual(result.totalResults, 0)
    }

    func testSearchTVShowsEmptyResults() async throws {
        mockNetworkService.mockResponse = DataFixtures.TVShowResponseUtils.createEmpty()

        let result = try await sut.searchTvShows(with: "NonExistentShow", page: 1)

        XCTAssertEqual(mockNetworkService.requestCallCount, 1)
        XCTAssertEqual(result.results?.count, 0)
        XCTAssertEqual(result.totalResults, 0)
    }
}
