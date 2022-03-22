//
//  NetworkServiceImpl.swift
//  NetworkService
//

import Foundation

public final class NetworkServiceImpl: NetworkService {
    public let baseURL: URL?
    public let defaultHeaders: [String: String]

    private let session: URLSession

    public init(
        baseURL: URL? = nil,
        defaultHeaders: [String: String] = [:],
        sessionConfiguration: URLSessionConfiguration? = nil
    ) {
        self.baseURL = baseURL
        self.defaultHeaders = defaultHeaders
        self.session = .init(configuration: sessionConfiguration ?? .default)
    }

    public func send<E>(
        endpoint: E,
        completion: @escaping (Result<E.Value, Error>) -> Void
    ) -> Cancellation where E: Endpoint {
        let urlRequest: URLRequest
        do {
            urlRequest = try autoreleasepool {
                var request = try endpoint.makeRequest(
                    baseURL: self.baseURL,
                    defaultCachePolicy: .useProtocolCachePolicy
                )

                self.defaultHeaders.forEach {
                    if request.value(forHTTPHeaderField: $0.key) == nil {
                        request.setValue($0.value, forHTTPHeaderField: $0.key)
                    }
                }

                return request
            }
        } catch {
            completion(.failure(error))

            return {}
        }

        let task = self.session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))

                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.noResponse))

                return
            }

            do {
                let value = try autoreleasepool {
                    try endpoint.parse(response: response, data: data)
                }

                completion(.success(value))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()

        return task.cancel
    }
}
