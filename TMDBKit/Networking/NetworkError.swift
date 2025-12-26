//
//  NetworkError.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    case unknown(Error)
}
