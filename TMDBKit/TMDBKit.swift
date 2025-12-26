//
//  TMDBKit.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//

import Foundation

public final class TMDBConfiguration {
    public static let shared = TMDBConfiguration()

    private var apiKey: String?

    private init() {}

    public static func configure(apiKey: String) {
        shared.apiKey = apiKey
    }

    internal func getAPIKey() -> String {
        guard let apiKey = apiKey else {
            fatalError("TMDBKit: API key not configured. Call TMDBConfiguration.configure(apiKey:) before using the SDK.")
        }
        return apiKey
    }
}
