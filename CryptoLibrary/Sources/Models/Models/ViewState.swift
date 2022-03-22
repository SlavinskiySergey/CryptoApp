//
//  ViewState.swift
//  Models
//

import Foundation

@frozen
public enum ViewState<Content> {
    case data(Content)
    case loading
    case error(Error)
}

extension ViewState {
    public var contentHidden: Bool {
        switch self {
        case .loading:
            return true
        case .data ,
             .error:
            return false
        }
    }
}
