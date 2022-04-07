//
//  LongPressGestureView.swift
//  prototype
//
//  Created by 김혜수 on 2022/04/07.
//

import SwiftUI

struct LongPressGestureView: View {
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false

    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 3)
            .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 2.0)
            }
            .onEnded { finished in
                self.completedLongPress = finished
            }
    }

    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ?
                Color.red :
                (self.completedLongPress ? Color.green : Color.blue))
            .frame(width: 100, height: 100, alignment: .center)
            .gesture(longPress)
    }

}

struct LongPressGestureView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureView()
    }
}
