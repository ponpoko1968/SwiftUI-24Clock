//
//  Arc.swift
//  TwentyFour
//
//  Created by 越智修司 on 2020/06/28.
//  Copyright © 2020 ponpoko.tv. All rights reserved.
//

import Foundation
import SwiftUI

struct ArcShape: Shape{
    var start = 90.0
    var end = 270.0
    init(_ start:Double=0.0, _ end: Double=360.0, _ radius:CGFloat=0){
        self.start = start
        self.end = end
    }
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2

        return Path { path in
            path.addArc(center: CGPoint(x:rect.width / 2, y:rect.height / 2 ),
                        radius: radius - radius/12.0,
            startAngle: .degrees(start),
            endAngle: .degrees(end),
            clockwise:false
            )
        }
    }
}
