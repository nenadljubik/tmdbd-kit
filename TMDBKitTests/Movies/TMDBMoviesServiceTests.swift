//
//  TMDBMoviesServiceTests.swift
//  TMDBKitTests
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import XCTest
@testable import TMDBKit

final class TMDBMoviesServiceTests: XCTestCase {
    var sut: TMDBMoviesService!
    var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        sut = TMDBMoviesService(networkService: mockNetworkService)
    }

    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchTrendingMoviesSuccess() async throws {
        mockNetworkService.mockResponse = DataFixtures.MovieResponseUtils.create()

        let result = try await sut.fetchTrendingMovies(page: 1)

        XCTAssertEqual(mockNetworkService.requestCallCount, 1)
        XCTAssertEqual(result.page, FixturesConstants.Response.page)
        XCTAssertEqual(result.results?.count, 1)
        XCTAssertEqual(result.results?.first?.title, FixturesConstants.Movie.title)
    }

    func testFetchTrendingMoviesThrowsError() async throws {
        mockNetworkService.mockError = NetworkError.httpError(statusCode: 500)

        do {
            _ = try await sut.fetchTrendingMovies(page: 1)
            XCTFail("Should have thrown an error")
        } catch {
            XCTAssertEqual(mockNetworkService.requestCallCount, 1)
        }
    }
}
