//
//  List.swift
//  Models
//

import Foundation

public struct List<Element> {
    public var page: Int
    public var hasMore: Bool
    public var items: [Element]
    
    public init(page: Int,
                hasMore: Bool,
                items: [Element]) {
        self.page = page
        self.hasMore = hasMore
        self.items = items
    }
    
    public init() {
        self.page = .zero
        self.hasMore = true
        self.items = []
    }
}

public extension List {
    static func +=(lhs: inout List, rhs: List) {
        lhs.page = rhs.page
        lhs.hasMore = rhs.hasMore
        lhs.items.append(contentsOf: rhs.items)
    }
        
    mutating func reset() {
        page = .zero
        hasMore = true
        items.removeAll()
    }
}
