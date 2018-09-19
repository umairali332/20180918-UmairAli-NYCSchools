//
//  NSObject+Extensions.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

extension NSObject {
    
    func synced(_ lock: Any, closure: () -> ()) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }
    
    func performBlockOnMainThread(after delay:Double = 0, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func performBlockOnBackgroundThread(after delay:Double = 0, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.global().asyncAfter(deadline: when, execute: closure)
    }
}
