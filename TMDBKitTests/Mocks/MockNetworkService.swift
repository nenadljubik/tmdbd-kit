//
//  MockNetworkService.swift
//  TMDBKitTests
//
//  Created by Ненад Љубиќ on 27.12.25.
//

import Foundation
@testable import TMDBKit

class MockNetworkService: NetworkServiceProtocol {
    var mockResponse: Any?
    var mockError: Error?
    var requestCallCount = 0
    var lastEndpoint: Routable?

    func request<T: Decodable>(_ endpoint: Routable) async throws -> T {
        requestCallCount += 1
        lastEndpoint = endpoint

        if let error = mockError {
            throw error
        }

        guard let response = mockResponse as? T else {
            throw NetworkError.unknown(NSError(domain: "MockError", code: -1))
        }

        return response
    }
}
