//
//  Link.swift
//  Models
//

import Foundation

public protocol Link {
    var url: String { get }
    var title: String { get }
}

public struct LinkModel: Link {
    public let url: String
    public let title: String
    
    public init(url: String, title: String) {
        self.url = url
        self.title = title
    }
}
