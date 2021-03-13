//
//  ClockView.swift
//  KineticClock
//
//  Created by Waseem Akram on 13/03/21.
//

import SwiftUI


struct ClockView: View {
    
    var hour: Int = 0
    var minute: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
//                .stroke(lineWidth: geometry.size.width * 0.01)
                .stroke(Color.primary.opacity(0.25))
                .overlay(
                    Capsule()
                        .frame(width: geometry.size.width/2, height: geometry.size.width * 0.05)
                        .offset(x: geometry.size.width/4)
                        .rotationEffect(.init(degrees: -90), anchor: .center)
                        .rotationEffect(.degressFromHour(value: minute), anchor: .center)
//                        .animation(.spring(response: 3, dampingFraction: 1, blendDuration: 0))
                )
                
                .overlay(
                    Capsule()
                        .frame(width: geometry.size.width/2.35, height: geometry.size.width * 0.05)
                        .offset(x: geometry.size.width/5)
                        .rotationEffect(.init(degrees: -90), anchor: .center)
                        .rotationEffect(.degressFromHour(value: hour), anchor: .center)
//                        .animation(.spring(response: 2, dampingFraction: 0.5, blendDuration: 0))
                )
//                .frame(width: geometry.size.width, height: geometry.size.width)
//                .animation(.spring(response: 2, dampingFraction: 1, blendDuration: 10))
                .animation(.easeIn(duration: 0.7))
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(hour: 7, minute: 7)
    }
}
