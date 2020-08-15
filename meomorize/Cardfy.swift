//
//  Cardfy.swift
//  meomorize
//
//  Created by MAC on 8/2/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct Cardfy : AnimatableModifier {
    var rotation:Double
    init(isFaceUp:Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    var isFaceUp:Bool{
        rotation < 90
    }
    var animatableData:Double{
        get{rotation}
        set{rotation = newValue}
    }
    func body(content: Content) -> some View {
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: cornerRedus).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRedus).stroke(lineWidth: lineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRedus).fill()
                .opacity(isFaceUp ? 0 : 1)
            
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))

    }
    private let cornerRedus:CGFloat = 10.0
    private let lineWidth:CGFloat = 3.0
    
}
