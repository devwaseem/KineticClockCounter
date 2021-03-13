//
//  TimerInputView.swift
//  KineticClock
//
//  Created by Waseem Akram on 13/03/21.
//

import SwiftUI
import Combine

struct TimerInputView: View {
    
    @Binding var minutesString: String
    @Binding var secondsString: String
    
    var isDisabled: Bool = false
    
    
    var body: some View {
        HStack {
            TextField("60", text: $minutesString)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .onReceive(Just(minutesString)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.minutesString = filtered
                    }
                    
                    guard let number = Int(filtered) else {
                        return
                    }
                    
                    if number > 60 {
                        self.minutesString = "60"
                    }
                }
                .frame(maxWidth: 100)
                .frame(height: 60)
                .padding()
                .background(Color(UIColor.secondarySystemFill))
                .cornerRadius(12)
                .font(.title2)
            
            TextField("60", text: $secondsString)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .onReceive(Just(secondsString)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.secondsString = filtered
                    }
                    
                    guard let number = Int(filtered) else {
                        return
                    }
                    
                    if number > 60 {
                        self.secondsString = "60"
                    }
                }
                .frame(maxWidth: 100)
                .frame(height: 60)
                .padding()
                .background(Color(UIColor.secondarySystemFill))
                .cornerRadius(12)
                .font(.title2)
        }
        .disabled(isDisabled)
        .opacity( isDisabled ? 0.5 : 1)
        .scaleEffect(isDisabled ? 0.8 : 1)
        .animation(.easeOut)
    }
}

struct TimerInputView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimerInputView(minutesString: .constant("1"), secondsString: .constant("2"))
                .previewLayout(.fixed(width: 300, height: 300))
                .preferredColorScheme(.light)
            TimerInputView(minutesString: .constant("1"), secondsString: .constant("2"))
                .previewLayout(.fixed(width: 300, height: 300))
                .preferredColorScheme(.dark)
        }
    }
}
