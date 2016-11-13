//
//  SharedSequenceConvertibleType+Shortcuts.swift
//  Pods
//
//  Created by Lukasz Mroz on 13.11.2016.
//
//

import RxCocoa

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    
    /**
     Invokes an action for each Next event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public func doOnNext(_ onNext: @escaping (E) -> Void) -> Driver<E> {
        return self.do(onNext: onNext)
    }
    
    /**
     Invokes an action for the Completed event in the observable sequence, and propagates all observer messages through the result sequence.
     
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - returns: The source sequence with the side-effecting behavior applied.
     */
    // @warn_unused_result(message:"http://git.io/rxs.uo")
    public func doOnCompleted(_ onCompleted: @escaping () -> Void) -> Driver<E> {
        return self.do(onCompleted: onCompleted)
    }
    
    /**
     Subscribes an element handler to an observable sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
     */
    // @warn_unused_result(message: "http://git.io/rxs.ud")
    public func driveNext(_ onNext: @escaping (E) -> Void) -> Disposable {
        return self.drive(onNext: onNext)
    }
}