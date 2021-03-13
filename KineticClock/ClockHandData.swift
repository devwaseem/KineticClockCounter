//
//  ClockHandData.swift
//  KineticClock
//
//  Created by Waseem Akram on 13/03/21.
//

import Foundation

struct Hand: Identifiable {
    var id = UUID()
    
    //minitues are also considered as hours to make it simple. There is no real use of precise value from 0 to 60
    let hour: Int
    let minute: Int
    
    init(_ hour: Int, _ minute: Int){
        self.hour = hour
        self.minute = minute
    }
    
    static var idle = Hand(7,7)
    static var leftTopDiagonal = Hand(10,10)
    
    static var top = Hand(0,0)
    static var topLeft = Hand(0,9)
    static var topRight = Hand(0,3)
    
    static var bottom = Hand(6,6)
    static var bottomLeft = Hand(6,9)
    static var bottomRight = Hand(6,3)
    
    static var horizonalLine = Hand(9,3)
    static var verticalLine = Hand(0,6)
    
    static var diagonalLineLeft = Hand(1,7)
    static var diagonalLineRight = Hand(10,5)
    
    static var leftDiagonalLeft = Hand(9,7)
    static var topDiagonalLeft = Hand(0,7)
    static var bottomDiagonalRight = Hand(6,2)
}

typealias ClockHands = [[Hand]]

class ClockHandData {
    
    
    static func getClockHands(for value: Int) -> ClockHands {
        
        switch value {
            case -2: return diagonalLeftPattern
            case -1: return leftTopDiagonal
            case 0: return zero
            case 1: return one
            case 2: return two
            case 3: return three
            case 4: return four
            case 5: return five
            case 6: return six
            case 7: return seven
            case 8: return eight
            case 9: return nine
            default : return zero
        }
    }
    
    static var zero: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.verticalLine, .bottomRight, .horizonalLine, .bottomLeft, .verticalLine],
            [.verticalLine, .verticalLine, .idle, .verticalLine, .verticalLine],
            [.verticalLine, .verticalLine, .idle, .verticalLine, .verticalLine],
            [.verticalLine, .topRight, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .horizonalLine, .topLeft],
    ]
    
    
    static var one: ClockHands = [
            [.idle, .bottomRight, .horizonalLine, .bottomLeft, .idle],
            [.idle, .topRight, .bottomLeft, .verticalLine, .idle],
            [.idle, .idle, .verticalLine, .verticalLine, .idle],
            [.idle, .idle, .verticalLine, .verticalLine, .idle],
            [.idle, .idle, .verticalLine, .verticalLine, .idle],
            [.idle, .idle, .topRight, .topLeft, .idle],
    ]
    
    static var two: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.topRight, .horizonalLine, .horizonalLine, .bottomLeft, .verticalLine],
            [.bottomRight, .horizonalLine, .horizonalLine, .topLeft, .verticalLine],
            [.verticalLine, .bottomRight, .horizonalLine, .horizonalLine, .topLeft],
            [.verticalLine, .topRight, .horizonalLine, .horizonalLine, .bottomLeft],
            [.topRight, .horizonalLine, .horizonalLine, .horizonalLine, .topLeft],
    ]
    
    static var three: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.topRight, .horizonalLine, .horizonalLine, .bottomLeft, .verticalLine],
            [.bottomRight, .horizonalLine, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .bottomLeft, .verticalLine],
            [.bottomRight, .horizonalLine, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .horizonalLine, .topLeft],
    ]
    
    static var four: ClockHands = [
            [.bottomRight, .bottomLeft, .idle, .idle, .idle],
            [.verticalLine, .verticalLine, .idle, .idle, .idle],
            [.verticalLine, .verticalLine, .bottomRight, .bottomLeft, .idle],
            [.verticalLine, .topRight, .topLeft, .topRight, .bottomLeft],
            [.topRight, .horizonalLine, .bottomLeft, .bottomRight, .topLeft],
            [.idle, .idle, .topRight, .topLeft, .idle],
    ]
    
    static var five: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.verticalLine, .bottomRight, .horizonalLine, .horizonalLine, .topLeft],
            [.verticalLine, .topRight, .horizonalLine, .horizonalLine, .bottomLeft],
            [.topRight, .horizonalLine, .horizonalLine, .bottomLeft, .verticalLine],
            [.bottomRight, .horizonalLine, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .horizonalLine, .topLeft],
    ]
    
    static var six: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.verticalLine, .bottomRight, .horizonalLine, .horizonalLine, .topLeft],
            [.verticalLine, .topRight, .horizonalLine, .horizonalLine, .bottomLeft],
            [.verticalLine, .bottomRight, .horizonalLine, .bottomLeft, .verticalLine],
            [.verticalLine, .topRight, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .horizonalLine, .topLeft],
    ]
    
    static var seven: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.topRight, .horizonalLine, .horizonalLine, .leftDiagonalLeft, .topDiagonalLeft],
            [.idle, .idle, .bottomDiagonalRight, .bottomDiagonalRight, .idle],
            [.idle, .idle, .verticalLine, .verticalLine, .idle],
            [.idle, .idle, .verticalLine, .verticalLine, .idle],
            [.idle, .idle, .topRight, .topLeft, .idle],
    ]
    
    static var eight: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.verticalLine, .bottomRight, .horizonalLine, .bottomLeft, .verticalLine],
            [.verticalLine, .topRight, .horizonalLine, .topLeft, .verticalLine],
            [.verticalLine, .bottomRight, .horizonalLine, .bottomLeft, .verticalLine],
            [.verticalLine, .topRight, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .horizonalLine, .topLeft],
    ]
    
    static var nine: ClockHands = [
            [.bottomRight, .horizonalLine, .horizonalLine, .horizonalLine, .bottomLeft],
            [.verticalLine, .bottomRight, .horizonalLine, .bottomLeft, .verticalLine],
            [.verticalLine, .topRight, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .bottomLeft, .verticalLine],
            [.bottomRight, .horizonalLine, .horizonalLine, .topLeft, .verticalLine],
            [.topRight, .horizonalLine, .horizonalLine, .horizonalLine, .topLeft],
    ]
    
    static var diagonalLeftPattern: ClockHands = {
        let cols = repeatElement(Hand.diagonalLineLeft, count: 5).map { $0 }
        let rows = repeatElement(cols, count: 6).map { $0 }
        return rows
    }()
    
    static var leftTopDiagonal: ClockHands = {
        let cols = repeatElement(Hand.leftTopDiagonal, count: 5).map { $0 }
        let rows = repeatElement(cols, count: 6).map { $0 }
        return rows
    }()
    
}
