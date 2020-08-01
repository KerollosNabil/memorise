//
//  themeModel.swift
//  meomorize
//
//  Created by MAC on 7/31/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI
struct Theme {
    var name:String
    var emojies:[String]
    var color:Color
}

enum EmojiThemes {
    case faces = Theme(name: "faces", emojies:Array(arrayLiteral: "😀😁😂🤣😃😄😅😆😉😊😋😎😍😘🥰😗😙😚☺️🙂🤗🤩🤔🤨") , color: .blue)
}
