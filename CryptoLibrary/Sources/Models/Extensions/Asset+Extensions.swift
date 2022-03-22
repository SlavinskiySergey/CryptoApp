//
//  Asset+Extensions.swift
//  Models
//

import Foundation

extension Asset {
    public var displayPriceUsd: String? {
        guard let priceValue = priceUsd.string(.price) else {
            return nil
        }
        return "$ \(priceValue)"
    }
}
