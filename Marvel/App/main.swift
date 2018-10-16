//
//  main.swift
//  Marvel
//
//  Created by Juliano Terres on 08/08/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil
let appDelegateClass = isRunningTests ? nil : NSStringFromClass(AppDelegate.self)
let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
_ = UIApplicationMain(CommandLine.argc, args, nil, appDelegateClass)
