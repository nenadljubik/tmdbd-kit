//
//  NetworkService.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//


import Foundation

public protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: Routable) async throws -> T
}

public final class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let accessToken: String

    public init(session: URLSession = .shared) {
        self.session = session
        self.accessToken = TMDBConfiguration.shared.getAccessToken()
    }
    
    public func request<T: Decodable>(_ endpoint: Routable) async throws -> T {
        let urlRequest = try buildURLRequest(from: endpoint)
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
    
    private func buildURLRequest(from endpoint: Routable) throws -> URLRequest {
        var components = URLComponents(
            url: endpoint.baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )
        
        components?.queryItems = endpoint.queryItems.isEmpty ? nil : endpoint.queryItems
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        
        endpoint.headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        return request
    }
}
