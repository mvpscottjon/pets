//
//  DebugLogger.swift
//  Pets
//
//  Created by Seven on 2022/7/14.
//

import Foundation

class DebugLogger {
    static func log(item: Any...) {
        #if DEBUG
            Swift.print(item)
        #endif
    }
}
