//
//  AVAsset.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import AVFoundation
import ReactiveCocoa
import Result


public extension AVAsset {
    
    public func loadValuesAsynchronouslyForKeys(keys: [String]) -> SignalProducer<[String: Result<AVKeyValueStatus, NSError>], NoError> {
        return SignalProducer { observer, _ in
            self.loadValuesAsynchronouslyForKeys(keys) { _ in
                
                var keysStatus: [String: Result<AVKeyValueStatus, NSError>] = [:]
                
                for key in keys {
                    var error: NSError?
                    
                    let status = self.statusOfValueForKey(key, error: &error)
                    
                    // The documentation states that if a .Failed is received, then statusOfValueForKey reports it in error parameter.
                    if status == .Failed, let error = error {
                        keysStatus[key] = Result(error: error)
                    } else {
                        keysStatus[key] = Result(status)
                    }
                }
                
                observer.sendNext(keysStatus)
                observer.sendCompleted()
            }
        }
    }
}
