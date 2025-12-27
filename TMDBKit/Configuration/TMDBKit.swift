//
//  TMDBKit.swift
//  TMDBKit
//
//  Created by Ненад Љубиќ on 26.12.25.
//

import Foundation

public final class TMDBConfiguration {
    public static let shared = TMDBConfiguration()

    private var accessToken: String?

    private init() {}

    public static func configure(accessToken: String) {
        shared.accessToken = accessToken
    }

    internal func getAccessToken() -> String {
        guard let accessToken = accessToken else {
            fatalError("TMDBKit: Access token not configured. Call TMDBConfiguration.configure(accessToken:) before using the SDK.")
        }
        return accessToken
    }
}
