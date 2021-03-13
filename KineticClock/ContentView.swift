//
//  ContentView.swift
//  KineticClock
//
//  Created by Waseem Akram on 13/03/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var counterManager: CounterManager
    
    @State var minuteString = ""
    @State var secondsString = ""
    
    
    var body: some View {
        VStack(spacing: 16){
            GeometryReader { geometry in
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        KineticClockCell(number: counterManager.minuteFirstPart, clockSize: geometry.size.width/10)
                        KineticClockCell(number: counterManager.minuteSecondPart, clockSize: geometry.size.width/10)
                    }.frame(height: geometry.size.width/10 * 6)
                    HStack(spacing: 0){
                        KineticClockCell(number: counterManager.secondsFirstPart, clockSize: geometry.size.width/10)
                        KineticClockCell(number: counterManager.secondsSecondPart, clockSize: geometry.size.width/10)
                    }.frame(height: geometry.size.width/10 * 6)
                }
                VStack {
                    Spacer()
                    TimerInputView(minutesString: $minuteString, secondsString: $secondsString, isDisabled: counterManager.isTimerRunning)
//                        .offset(x: counterManager.isTimerRunning ? geometry.size.width : 0)
//                        .animation(.easeOut)
//                        .onReceive(Just((minuteString, secondsString))) { newValue in
//                            counterManager.setClock(minutes: newValue.0, seconds: newValue.1)
//                        }
                    Button(action: {
                        if counterManager.isTimerRunning {
                            counterManager.reset()
                            return
                        }
                        counterManager.startTimer(minutes: minuteString, seconds: secondsString)
                    }, label: {
                        Text(counterManager.isTimerRunning ? "Stop" : "Start")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .font(.title3)
                            .cornerRadius(12)
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                    })
                }
                .padding(.top, 60)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    counterManager.reset()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(counterManager: CounterManager())
    }
}
