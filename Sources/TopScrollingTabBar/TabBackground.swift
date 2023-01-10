//
//  TabBackground.swift
//  TopScrollingTabBar
//
//  Created by Bri on 1/10/23.
//

import SwiftUI

struct TabBackground: Shape {
    var cornerRadius: CGFloat = 16
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: .zero + cornerRadius, y: .zero))
        path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: .zero))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: .zero + cornerRadius), control: CGPoint(x: rect.width, y: .zero))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: rect.width + cornerRadius, y: rect.height), control: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: .zero - cornerRadius, y: rect.height))
        path.addQuadCurve(to: CGPoint(x: .zero, y: rect.height - cornerRadius), control: CGPoint(x: .zero, y: rect.height))
        path.addLine(to: CGPoint(x: .zero, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: .zero + cornerRadius, y: .zero), control: .zero)
        return path
    }
}

struct TabBackground_Previews: PreviewProvider {
    static var previews: some View {
        TabBackground()
            .fill(.blue)
            .padding()
            .frame(width: 128, height: 64)
            .overlay {
                Text("Meow")
            }
    }
}
