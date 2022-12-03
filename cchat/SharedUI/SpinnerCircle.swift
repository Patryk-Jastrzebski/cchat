//
//  SpinnerCircle.swift
//  cchat
//
//  Created by Patryk Jastrzębski on 11/11/2022.
//
import
SwiftUI

struct SpinnerCircle: View {
    var start: CGFloat
    var end: CGFloat
    var rotation: Angle
    var color: Color
    
    var body: some View {
        Circle()
            .trim(from: start, to: end)
            .stroke(style: StrokeStyle(lineWidth: Constants.circleWidth, lineCap: .round))
            .fill(color)
            .rotationEffect(rotation)
    }
}

private struct Constants {
    static let circleWidth: CGFloat = 3
}
