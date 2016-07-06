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
    
    public func loadValuesAsynchronouslyForKeys(keys: [String]) -> SignalProducer<[String: AVKeyValueStatus], NSError> {
        return SignalProducer { observer, _ in
            self.loadValuesAsynchronouslyForKeys(keys) { _ in
                
                var keysStatus: [String: AVKeyValueStatus] = [:]
                
                keys.forEach { key in
                    var error: NSError?
                    let status = self.statusOfValueForKey(key, error: &error)
                    
                    // The documentation states that if a .Failed is received, then statusOfValueForKey reports it in error parameter.
                    if status == .Failed, let error = error {
                        observer.sendFailed(error)
                        return
                    }
                    
                    keysStatus[key] = status
                }
                
                observer.sendNext(keysStatus)
                observer.sendCompleted()
            }
        }
    }
}
