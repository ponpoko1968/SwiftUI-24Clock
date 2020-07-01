//
//  Hand.swift
//  TwentyFour
//
//  Created by 越智修司 on 2020/06/30.
//  Copyright © 2020 ponpoko.tv. All rights reserved.
//

import SwiftUI
import SwifterSwift

private struct Hand: Shape {
var date: Date
    private func toRadian(from date: Date)->Double?{
        if let beginning = date.changing(.hour, value: 0)?
            .changing(.minute, value: 0)?
            .changing(.second, value:0){
            let dist = abs(date.distance(to: beginning))
            print("hour1=\(dist/3600)")
            // 0πが18時を指すため18hの剰余をとる
            let modulo = dist > 18*3600 ? dist.truncatingRemainder(dividingBy: 18*3600) : dist + 6*3600
            return 2 * Double.pi *  modulo / (24*3600)
        }
        return nil
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            if let rad =  toRadian(from:date){
                print("hour2 = \(rad)")
                let radius = min(rect.width/2, rect.height/2)
                let center = CGPoint(x:rect.width/2, y: rect.height/2)
                let handEnd = CGPoint(x: center.x + CGFloat(cos(rad)) * radius,
                                      y: center.y + CGFloat(sin(rad)) * radius)
                path.move(to: center)
                path.addLine(to: handEnd)
            }
        }
    }
}

struct HandView: View {
    var date: Date
    var body: some View {
        Hand(date:date).stroke(style: StrokeStyle(lineWidth: 3, lineCap: .butt)).foregroundColor(Color.red)
    }
}

struct Hand_Previews: PreviewProvider {
    static var previews: some View {
        Hand(date: Date())
    }
}
