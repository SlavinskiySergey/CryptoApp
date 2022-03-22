//
//  ClientNetworkServiceImpl.swift
//  ClientNetworkService
//

import Foundation
import NetworkService

public final class ClientNetworkServiceImpl: ClientNetworkService {
    public let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}
