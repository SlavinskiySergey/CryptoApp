//
//  Renderable.swift
//  Components
//

import Foundation

public protocol Renderable: AnyObject {
    associatedtype ViewData
    
    func configure(with data: ViewData)
    func willBeShown(with data: ViewData)
    func wasHidden(with data: ViewData)
}

extension Renderable {
    public func willBeShown(with data: ViewData) {}
    public func wasHidden(with data: ViewData) {}
}

public protocol Rendering {
    func configureWithValue(_ value: Any)
    func willDisplay(_ value: Any)
    func didEndDisplay(_ value: Any)
}

extension Rendering where Self: Renderable {
    public func configureWithValue(_ value: Any) {
        if let viewData = value as? ViewData {
            configure(with: viewData)            
        }
    }
    
    public func willDisplay(_ value: Any) {
         if let viewData = value as? ViewData {
            willBeShown(with: viewData)
        }
    }
    
    public func didEndDisplay(_ value: Any) {
        if let viewData = value as? ViewData {
           wasHidden(with: viewData)
       }
    }
}
