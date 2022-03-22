//
//  Date+Extensions.swift
//  Models
//

import Foundation

extension Date {
    public enum Format {
        case mirroredDate
    }
    
    public func string(_ format: Format) -> String {
        switch format {
        case .mirroredDate:
            return Formatter.mirroredDate.string(from: self)
        }
    }
    
    public func byAddingMonths(_ offset: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: offset, to: self)
    }
}
