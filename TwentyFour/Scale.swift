//
//  Scale.swift
//  TwentyFour
//
//  Created by 越智修司 on 2020/06/30.
//  Copyright © 2020 ponpoko.tv. All rights reserved.
//

import Foundation
import SwiftUI


struct Scale: Shape {
    var step = 1
    var lengthRatio = 1.0
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        let radPer10Min = Double.pi * 2 / 144.0
        let hourScaleLen = radius - CGFloat(radius) / 12 * CGFloat(lengthRatio)

        return Path { path in
            for _min in 0..<step {
                let min = _min * (144/step)
                let s = CGFloat(sin(radPer10Min * Double(min)))
                let c = CGFloat(cos(radPer10Min * Double(min)))
                path.move(to: CGPoint(x: center.x + c * radius,
                                      y: center.y + s * radius))

                path.addLine(to: CGPoint(x: center.x + c * hourScaleLen,
                                         y: center.y + s * hourScaleLen))
            }
        }
    }
}

struct ScaleView: View {
    var body: some View {
        ZStack{
            Scale(step: 144, lengthRatio: 0.6).stroke(style: StrokeStyle(lineWidth: 0.5, lineCap: .butt)).foregroundColor(Color.white)
            Scale(step: 48, lengthRatio: 0.9).stroke(style: StrokeStyle(lineWidth: 1, lineCap: .butt)).foregroundColor(Color.white)
            Scale(step: 24, lengthRatio: 1.0).stroke(style: StrokeStyle(lineWidth: 3, lineCap: .butt)).foregroundColor(Color.white)
        }
    }
}
