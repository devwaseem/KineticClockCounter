//
//  Int + Extensions.swift
//  KineticClock
//
//  Created by Waseem Akram on 13/03/21.
//

import Foundation
import SwiftUI

extension Angle {
//    static func degressFromMinutes(value: Double) -> Angle {
//        let percentage = value / 60.0
//        return Angle.degrees(360.0 * percentage)
//    }
    
    static func degressFromHour(value: Int) -> Angle {
        let percentage = Double(value) / Double(12.0)
        return Angle.degrees(360.0 * percentage)
    }
    
}

