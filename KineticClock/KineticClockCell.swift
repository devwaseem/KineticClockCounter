//
//  KineticClockCell.swift
//  KineticClock
//
//  Created by Waseem Akram on 13/03/21.
//

import SwiftUI

struct KineticClockCell: View {
    
    var clockSize: CGFloat
    
    var clockHandData: ClockHands
    
    init(number: Int, clockSize: CGFloat) {
        self.clockHandData = ClockHandData.getClockHands(for: number)
        self.clockSize = clockSize
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<clockHandData.count, id: \.self) { col in
                    HStack(alignment: .top,spacing: 0){
                        ForEach(0..<clockHandData[col].count, id: \.self) { row in
                            ClockView(hour: clockHandData[col][row].hour, minute: clockHandData[col][row].minute)
                                .frame(width: clockSize, height: clockSize)
                        }
                    }
                }
            }
        }
    }
}

struct KineticClockCell_Previews: PreviewProvider {
    static var previews: some View {
        KineticClockCell(number: 1, clockSize: 70)
    }
}
