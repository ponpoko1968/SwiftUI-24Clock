//
//  TimeSlot.swift
//  TwentyFour
//
//  Created by 越智修司 on 2020/06/29.
//  Copyright © 2020 ponpoko.tv. All rights reserved.
//

import SwiftUI

struct TimeSlot: Shape {
    var start: Double = 0.0
    var end: Double = 360
    var clockWise = false
    func path(in rect: CGRect) -> Path {
        return Path {path in
        let radius = min(rect.width, rect.height)/2 - 20
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
            let sstart = CGFloat(sin(Angle.radians(3*Double.pi/2).radians))
            let cstart = CGFloat(cos(Angle.radians(3*Double.pi/2).radians))
            path.addArc(center: center, radius: radius, startAngle: .degrees(start), endAngle: .degrees(end), clockwise: clockWise)
       // path.closeSubpath()
        }
    }


}


