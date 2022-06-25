//
//  EventSearchModifiers.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/22/22.
//

import Foundation
import SwiftUI

struct TextEntry: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .border(Color.black)
            .background(Color.white)
    }
}

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}

struct Balloon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX / 2, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY / 2), control: CGPoint(x: 0, y: 0))
        path.addCurve(to: CGPoint(x: rect.maxX / 2, y: rect.maxY * 1),
                      control1: CGPoint(x: 0, y: rect.maxY * 0.75),
                      control2: CGPoint(x: rect.maxX / 2, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY / 2),
                      control1: CGPoint(x: rect.maxX / 2, y: rect.maxY),
                      control2: CGPoint(x: rect.maxX, y: rect.maxY * 0.75))
        path.addQuadCurve(to: CGPoint(x: rect.maxX / 2, y: 0),
                          control: CGPoint(x: rect.maxX, y: 0))

        return path
    }
}
