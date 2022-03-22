//
//  NetworkError.swift
//  NetworkService
//

import Foundation

public enum NetworkError: Error {
    case failedToCreateURLComponents(path: String)
    case failedToCreateURL(components: URLComponents)
    case noData
    case noResponse
    case errorStatusCode(Int)
}
