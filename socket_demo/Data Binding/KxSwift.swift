//
//  KxSwift.swift
//  ProjectStructure
//
//  Created by Krishna Soni on 09/09/19.
//  Copyright © 2019 Krishna Soni. All rights reserved.
//

import Foundation

class KxSwift<T> {
    
    typealias Observer = (T) -> ()
    var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    func bind(_ listner: Observer?) {
        self.observer = listner
    }
    
    func subscribe(_ observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
    
}
