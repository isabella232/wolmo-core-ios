//
//  AVAsset.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import AVFoundation
import ReactiveCocoa
import enum Result.NoError

public extension AVAsset {
    
    public func loadValuesAsynchronouslyForKeys(keys: [String]) -> SignalProducer<(), NSError> {
        return SignalProducer { observer, _ in
            self.loadValuesAsynchronouslyForKeys(keys) { _ in
                
                var error: NSError?
                
                for key in keys {
                    let status = self.statusOfValueForKey(key, error: &error)
                    // We need to ensure that the keys were loaded
                    guard status == .Loaded else {
                        if let error = error {
                            // There is an error only if the status is Failed
                            observer.sendFailed(error)
                        }
                        return
                    }
                }
                
                observer.sendNext(())
                observer.sendCompleted()
            }
        }
    }
}
