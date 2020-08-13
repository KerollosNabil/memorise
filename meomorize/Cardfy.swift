//
//  Cardfy.swift
//  meomorize
//
//  Created by MAC on 8/2/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct Cardfy : ViewModifier {
    var isFaceUp:Bool
    func body(content: Content) -> some View {
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: cornerRedus).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRedus).stroke(lineWidth: lineWidth)
                content
            }else{
                RoundedRectangle(cornerRadius: cornerRedus).fill()
            }
        }
    }
    private let cornerRedus:CGFloat = 10.0
    private let lineWidth:CGFloat = 3.0
    
}
