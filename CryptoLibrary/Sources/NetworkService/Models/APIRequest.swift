//
//  APIRequest.swift
//  NetworkService
//

import Foundation

public struct APIRequest {
    public enum HTTPMethod: String {
        case GET, POST, PUT, DELETE // etc.
    }

    public var path: String
    public var method: HTTPMethod = .GET
    public var query: [String: String] = [:]
    public var headers: [String: String] = [:]
    public var body: Data?
    public var timeoutInterval: TimeInterval = 60

    public init(
        path: String,
        method: APIRequest.HTTPMethod = .GET,
        query: [String: String] = [:],
        headers: [String: String] = [:],
        body: Data? = nil,
        timeoutInterval: TimeInterval = 60
    ) {
        self.path = path
        self.method = method
        self.query = query
        self.headers = headers
        self.body = body
        self.timeoutInterval = timeoutInterval
    }
}

extension APIRequest {
    func makeRequest(
        baseURL: URL?,
        defaultCachePolicy: URLRequest.CachePolicy
    ) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: self.path) else {
            throw NetworkError.failedToCreateURLComponents(path: self.path)
        }

        if urlComponents.scheme == nil {
            urlComponents.scheme = baseURL?.scheme
        }

        if urlComponents.host == nil {
            urlComponents.host = baseURL?.host
        }

        urlComponents.queryItems = self.query.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        guard let url = urlComponents.url else {
            throw NetworkError.failedToCreateURL(components: urlComponents)
        }

        var request = URLRequest(
            url: url,
            cachePolicy: defaultCachePolicy,
            timeoutInterval: self.timeoutInterval
        )

        request.httpMethod = self.method.rawValue

        self.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        request.httpBody = self.body

        return request
    }
}
