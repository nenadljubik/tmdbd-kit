//
//  NetworkServiceTests.swift
//  TMDBKitTests
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import XCTest
@testable import TMDBKit

final class NetworkServiceTests: XCTestCase {
    var sut: NetworkService!
    var mockSession: URLSession!

    override func setUp() {
        super.setUp()

        TMDBConfiguration.configure(apiKey: "test-api-key")

        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        mockSession = URLSession(configuration: configuration)

        sut = NetworkService(session: mockSession)
    }

    override func tearDown() {
        sut = nil
        mockSession = nil
        MockURLProtocol.requestHandler = nil
        super.tearDown()
    }

    func testRequestSuccessfullyDecodesMovieResponse() async throws {
        let jsonData = JSONFixtures.MovieResponse.valid.data(using: .utf8)!

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, jsonData)
        }
        
        let result: MovieResponse = try await sut.request(MovieRouter.trending(page: 1))

        XCTAssertEqual(result.page, 1)
        XCTAssertEqual(result.results?.count, 1)
        XCTAssertEqual(result.results?.first?.title, "Avatar")
    }

    func testRequestThrowsErrorOnHTTPError() async throws {
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 404,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data())
        }

        do {
            let _: MovieResponse = try await sut.request(MovieRouter.trending(page: 1))
            XCTFail("Should have thrown an error")
        } catch let error as NetworkError {
            if case .httpError(let statusCode) = error {
                XCTAssertEqual(statusCode, 404)
            } else {
                XCTFail("Wrong error type")
            }
        }
    }

    func testRequestThrowsDecodingError() async throws {
        let invalidJSON = JSONFixtures.MovieResponse.invalid.data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, invalidJSON)
        }

        do {
            let _: MovieResponse = try await sut.request(MovieRouter.trending(page: 1))
            XCTFail("Should have thrown a decoding error")
        } catch let error as NetworkError {
            if case .decodingError = error {
                // Success
            } else {
                XCTFail("Wrong error type: \(error)")
            }
        }
    }
}
