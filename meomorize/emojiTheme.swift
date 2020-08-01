//
//  emojiTheme.swift
//  meomorize
//
//  Created by MAC on 7/31/20.
//  Copyright © 2020 MAC. All rights reserved.
//
import SwiftUI

class EmohiThemes{
    private let thems = [Themes<String>.Theme(name: "faces", emojies:["😀","😁","😂","🤣","😃","😄","😅","😆","😉","😊","😋","😎","😍","😘","🥰","😗","😙","😚","☺️","🙂","🤗","🤩","🤔","🤨"] , color: .blue)
    ,Themes<String>.Theme(name: "animals", emojies:["🐶","🐱","🐭","🐹","🐰","🦊","🦝","🐻","🐼","🦘","🦡","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦"], color: .red)
    ,Themes<String>.Theme(name: "sports", emojies: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🥅","🥊","🎽","🛹","⛷","🪂","🏋️‍♀️","🤸‍♀️","⛹️‍♀️","🤺","🏌️‍♀️","🏇","🧘‍♀️","🏄‍♀️"] , color: .green)
    ,Themes<String>.Theme(name: "ftuits", emojies: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍈","🍒","🍑","🥭","🍍","🥝","🍅","🍆","🥑","🥦","🥬","🥒","🌶","🌽","🥕","🧄","🧅","🥔","🍠"] , color: .yellow)
    ,Themes<String>.Theme(name: "viacles", emojies: ["🚗","🚙","🚕","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🚚","🚛","🚜","🛴","🚲","🛵","🏍","🛺","🚔","🚍","🚘","🚖","🚡","🚠","🚟","🚝","🚄","🚅","✈️","🛬","💺"] , color: .orange)
    ,Themes<String>.Theme(name: "flags", emojies: ["🏳️","🏴","🏁","🚩","🏳️‍🌈","🏴‍☠️","🇦🇫","🇦🇽","🇦🇱","🇩🇿","🇦🇸","🇦🇩","🇦🇴","🇦🇮","🇦🇶","🇦🇬","🇦🇷","🇦🇲","🇦🇼","🇦🇺","🇦🇹","🇦🇿","🇧🇸","🇧🇭","🇧🇩","🇧🇧","🇧🇾","🇧🇪","🇧🇿","🇧🇯","🇧🇲","🇧🇹","🇧🇴"] , color: .pink)]
    lazy var emojiThemes = Themes<String>(numberOfThemes: thems.count){index in
        return thems[index]
    }
    func getRundomTheme() -> Themes<String>.Theme {
        return emojiThemes.themes.shuffled().first ?? Themes<String>.Theme(name: "faces", emojies:["😀","😁","😂","🤣","😃","😄","😅","😆","😉","😊","😋","😎","😍","😘","🥰","😗","😙","😚","☺️","🙂","🤗","🤩","🤔","🤨"] , color: .blue)
    }
    func addTheme(name:String, emojies:[String], color:Color) {
        emojiThemes.addTheme(theme: Themes<String>.Theme(name: name, emojies: emojies, color: color))
    }
}


