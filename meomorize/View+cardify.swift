//
//  View+cardify.swift
//  meomorize
//
//  Created by MAC on 8/2/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

extension View{
    func cardify(isFaceUp:Bool) -> some View {
        self.modifier(Cardfy(isFaceUp: isFaceUp))
    }
}
