//
//  pie.swift
//  meomorize
//
//  Created by MAC on 8/2/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct Pie : Shape{
    var startAngle:Angle
    var endAnlge:Angle
    var clockWise = false
    var animatableData: AnimatablePair<Double, Double>{
        get{
            AnimatablePair(startAngle.radians, endAnlge.radians)
        }
        set{
            startAngle = Angle.init(radians: newValue.first)
            endAnlge = Angle.init(radians: newValue.second)
        }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let redius = min(rect.width, rect.height)/2.0
        let startPoint = CGPoint(
            x: CGFloat(center.x + redius * cos(CGFloat(startAngle.radians))),
            y: CGFloat(center.y + redius * sin(CGFloat(startAngle.radians)))
        )
        
        
        path.move(to: center)
        path.addLine(to: startPoint)
        path.addArc(
            center: center,
            radius: redius,
            startAngle: startAngle,
            endAngle: endAnlge,
            clockwise: clockWise
        )
        path.addLine(to: center)
        
        return path
    }
    
    
}
