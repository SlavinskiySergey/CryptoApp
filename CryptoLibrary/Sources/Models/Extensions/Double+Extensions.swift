//
//  Double+Extensions.swift
//  Models
//

import Foundation

extension Double {
    public enum Format {
        case price
    }
    
    public func string(_ format: Format) -> String? {
        switch format {
        case .price:
            return Formatter.price.string(for: self)
        }
    }
}
