//
//  CounterManager.swift
//  KineticClock
//
//  Created by Waseem Akram on 13/03/21.
//

import Foundation
import Combine

class CounterManager: ObservableObject {
    
    @Published var minuteFirstPart = -2
    @Published var minuteSecondPart = -2
    @Published var secondsFirstPart = -2
    @Published var secondsSecondPart = -2
    @Published var isTimerRunning = false
    
    var cancellableTimer: AnyCancellable?
    
    var timeLeft = 0
    
    func setClock(minutes: String, seconds: String){
        var minutes = minutes
        var seconds = seconds
        guard
            minutes != "",
            seconds != "",
            let _mins = Int(minutes),
            let _secs = Int(seconds),
            _mins <= 60,
            _secs <= 60
        else {
            return
        }
        
        if minutes.count == 1 {
            minutes = "0" + minutes
        }
        
        if seconds.count == 1 {
            seconds = "0" + seconds
        }
        
        self.minuteFirstPart = Int("\(String(describing: minutes.first ?? Character("-1")))") ?? -1
        self.minuteSecondPart = Int("\(String(describing: minutes.last ?? Character("-1")))") ?? -1
        self.secondsFirstPart = Int("\(String(describing: seconds.first ?? Character("-1")))") ?? -1
        self.secondsSecondPart = Int("\(String(describing: seconds.last ?? Character("-1")))") ?? -1
        timeLeft = minutesToSeconds(minutes: _mins, seconds: _secs)
    }
    
    func startTimer(minutes: String, seconds: String){
        if minutes == "" || seconds == "" {
            return
        }
        setClock(minutes: minutes, seconds: seconds)
        self.cancellableTimer = Timer.publish(every: 1, on: RunLoop.main, in: RunLoop.Mode.common)
            .autoconnect()
            .sink { (date) in
                self.timeLeft -= 1
                if self.timeLeft < 0 {
                    self.reset()
                    return
                }
                let time = self.secondsToMinutesSeconds(seconds: self.timeLeft)
                self.setClock(minutes: "\(time.0)", seconds: "\(time.1)")
            }
        isTimerRunning = true
    }
    
    func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
      return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func minutesToSeconds(minutes: Int, seconds: Int = 0) -> Int {
        return (minutes * 60) + seconds
    }
    
    func reset() {
        isTimerRunning = false
        self.cancellableTimer?.cancel()
        minuteFirstPart = -1
        minuteSecondPart = -1
        secondsFirstPart = -1
        secondsSecondPart = -1
    }
    
    
    deinit {
        self.cancellableTimer?.cancel()
    }
    
}
