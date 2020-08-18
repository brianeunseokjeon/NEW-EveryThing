//
//  AccessTest.swift
//  BrianJFrameWork
//
//  Created by brian on 18/08/2020.
//  Copyright © 2020 brian. All rights reserved.
//

import Foundation


open class OpenClass {
    public init() {}
    open func someMethod() {}
    
    //외부에서 접근불가..
    func someInternalMethod() {}
}

public class PublicClass {
    public init() {}
    public func someMethod() {}

}
