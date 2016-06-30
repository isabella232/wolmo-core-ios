//
//  AVPlayerItem.swift
//  Core
//
//  Created by Francisco Depascuali on 6/29/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import AVFoundation
import ReactiveCocoa
import enum Result.NoError

public extension AVPlayerItem {
    
    public func seekToTimeProducer(time: CMTime) -> SignalProducer<Bool, NoError> {
        return SignalProducer { observer, _ in
            self.seekToTime(time) {
                observer.sendNext($0)
                observer.sendCompleted()
            }
        }
    }
    
}
