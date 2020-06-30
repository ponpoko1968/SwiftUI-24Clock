//
//  SectorShape.swift
//  TwentyFour
//
//  Created by 越智修司 on 2020/06/28.
//  Copyright © 2020 ponpoko.tv. All rights reserved.
//

import Foundation
import SwiftUI

struct SectorShape: Shape {
    var start: Double = 0.0
    var end: Double = 360
    var width: CGFloat = 0
    init(start:Double, end:Double, width: CGFloat){
        self.start = start
        self.end = end
        self.width = width
    }
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height)/2
        return Path {path in
            //path.addArc(center: CGPoint(x: rect.width/2, y: rect.height/2), radius: radius, startAngle: .degrees(start), endAngle: .degrees(end), clockwise: false)
            let center = CGPoint(x: rect.width/2, y: rect.height/2)
            let sstart = CGFloat(sin(Angle.degrees(start).radians))
            let cstart = CGFloat(cos(Angle.degrees(start).radians))
            path.move(to: CGPoint(x: (rect.width/2) + (radius-width) * cstart,
                                  y: (rect.height/2)+(radius-width) * sstart))

            path.addLine(to: CGPoint(x: rect.width/2 + CGFloat((radius)*cstart),
                                  y: rect.height/2+CGFloat((radius)*sstart)))
            path.addArc(center: center, radius: radius, startAngle: .degrees(start), endAngle: .degrees(end), clockwise: false)
            let sEnd = CGFloat(sin(Angle.degrees(end).radians))
            let cEnd = CGFloat(cos(Angle.degrees(end).radians))
            path.addLine(to: CGPoint(x: rect.width/2 + (radius-width)*cEnd, y: rect.height/2+(radius-width)*sEnd))
            // path.move(to: CGPoint(x: (rect.width/2) + (radius-width) * cstart,
            //                       y: (rect.height/2)+(radius-width) * sstart))
            path.addArc(center: center, radius: radius-width, startAngle: .degrees(end), endAngle: .degrees(start), clockwise: true)

            path.closeSubpath()



        }
    }
}
struct SectorShape_Previews: PreviewProvider{
    static var previews: some View{
        SectorShape(start: 15, end: 47, width: 50)
    }
}
