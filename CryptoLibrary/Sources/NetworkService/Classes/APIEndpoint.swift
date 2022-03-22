//
//  APIEndpoint.swift
//  NetworkService
//

import Foundation

public final class APIEndpoint<Value>: Endpoint {
    private let request: APIRequest
    private let value: (HTTPURLResponse, Data?) throws -> Value

    public init(
        request: APIRequest,
        value: @escaping (HTTPURLResponse, Data?) throws -> Value
    ) {
        self.request = request
        self.value = value
    }

    public func makeRequest(baseURL: URL?, defaultCachePolicy: URLRequest.CachePolicy) throws -> URLRequest {
        try self.request.makeRequest(baseURL: baseURL, defaultCachePolicy: defaultCachePolicy)
    }

    public func parse(response: HTTPURLResponse, data: Data?) throws -> Value {
        guard response.statusCode < 400 else {
            throw NetworkError.errorStatusCode(response.statusCode)
        }
        return try self.value(response, data)
    }
}

public extension APIEndpoint {
    static func json<T: Decodable>(request: APIRequest, decoder: JSONDecoder = .init()) -> APIEndpoint<T> {
        .init(request: request) { (_, data) -> T in
            guard let data = data else {
                throw NetworkError.noData
            }
            return try decoder.decode(T.self, from: data)
        }
    }
}
