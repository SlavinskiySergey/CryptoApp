//
//  ClientNetworkService.swift
//  ClientNetworkService
//

import Foundation
import NetworkService

public protocol ClientNetworkService: ClientNetworkServiceAsset {
    var networkService: NetworkService { get }
}
