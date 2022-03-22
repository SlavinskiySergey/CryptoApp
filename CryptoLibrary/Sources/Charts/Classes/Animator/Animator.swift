//
//  Animator.swift
//  Charts
//

import UIKit

public protocol Animatable: Equatable {
    init()
    
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, progress: Double) -> Self
}

extension Double: Animatable { }

extension CGFloat: Animatable { }

public func * (lhs: CGFloat, rhs: Double) -> CGFloat {
    return lhs * CGFloat(rhs)
}

final class AnimatorLoop {
    static let shared = AnimatorLoop()

    var currentTimestamp: CFTimeInterval {
        return displayLink.timestamp
    }

    private lazy var displayLink = CADisplayLink(target: self, selector: #selector(update))

    init() {
        displayLink.add(to: .current, forMode: .common)
    }

    private var updaters = [Updater]()

    func addUpdater(_ updater: Updater) {
        updaters.append(updater)
    }

    @objc
    private func update() {
        updaters.forEach { $0.update() }
    }
}

protocol Updater {
    func update()
}

class Animator<T: Animatable>: Updater {
    var duration: CFTimeInterval {
        return 0.5
    }

    let easingFunction: (_ progress: Double) -> Double = { progress in
        1 - ((1 - progress) * (1 - progress))
    }

    private var previousTimestamp: CFTimeInterval = 0.0
    private(set) var elapsedTime: CFTimeInterval = 0.0

    private let updateHandler: (_ updatedValue: T) -> Void

    private(set) var fromValue = T()
    private(set) var toValue = T()

    private(set) var state: ValueAnimatorState = .finished

    init(updateHandler: @escaping (_ value: T) -> Void) {
        self.updateHandler = updateHandler

        AnimatorLoop.shared.addUpdater(self)
    }

    func animate(_ fromValue: T, toValue: T) {
        reset()

        self.fromValue = fromValue
        self.toValue = toValue

        if fromValue == toValue {
            updateHandler(toValue)
            return
        }

        state = .inProgress
    }

    @objc
    func update() {
        if state == .inProgress {
            let timestampDiff = AnimatorLoop.shared.currentTimestamp - previousTimestamp
            elapsedTime += timestampDiff
            if elapsedTime > duration {
                elapsedTime = duration
                state = .finished
            }
            let progress = elapsedTime / duration
            let interpolation = easingFunction(progress)
            let currentValue = fromValue + (toValue - fromValue) * interpolation
            updateHandler(currentValue)
        }
        previousTimestamp = AnimatorLoop.shared.currentTimestamp
    }

    func reset() {
        elapsedTime = 0
        state = .finished
    }
}

enum ValueAnimatorState {
    case inProgress
    case finished
}

