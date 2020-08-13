//
//  emojiTheme.swift
//  meomorize
//
//  Created by MAC on 7/31/20.
//  Copyright © 2020 MAC. All rights reserved.
//
import SwiftUI

class EmohiThemes{
    private let thems = [Themes<String>.Theme(name: "faces", emojies:["😀","😁","😂","🤣","😃","😄","😅","😆","😉","😊","😋","😎","😍","😘","🥰","😗","😙","😚","☺️","🙂","🤗","🤩","🤔","🤨"] , primaryColor: .blue, secondaryColor: .secondary)
        ,Themes<String>.Theme(name: "animals", emojies:["🐶","🐱","🐭","🐹","🐰","🦊","🦝","🐻","🐼","🦘","🦡","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦"], primaryColor: .red, secondaryColor: .secondary)
    ,Themes<String>.Theme(name: "sports", emojies: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🥅","🥊","🎽","🛹","⛷","🪂","🏋️‍♀️","🤸‍♀️","⛹️‍♀️","🤺","🏌️‍♀️","🏇","🧘‍♀️","🏄‍♀️"] , primaryColor: .green, secondaryColor: .secondary)
    ,Themes<String>.Theme(name: "ftuits", emojies: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🍈","🍒","🍑","🥭","🍍","🥝","🍅","🍆","🥑","🥦","🥬","🥒","🌶","🌽","🥕","🧄","🧅","🥔","🍠"] , primaryColor: .yellow, secondaryColor: .secondary)
    ,Themes<String>.Theme(name: "viacles", emojies: ["🚗","🚙","🚕","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🚚","🚛","🚜","🛴","🚲","🛵","🏍","🛺","🚔","🚍","🚘","🚖","🚡","🚠","🚟","🚝","🚄","🚅","✈️","🛬","💺"] , primaryColor: .orange, secondaryColor: .secondary)
    ,Themes<String>.Theme(name: "flags", emojies: ["🏳️","🏴","🏁","🚩","🏳️‍🌈","🏴‍☠️","🇦🇫","🇦🇽","🇦🇱","🇩🇿","🇦🇸","🇦🇩","🇦🇴","🇦🇮","🇦🇶","🇦🇬","🇦🇷","🇦🇲","🇦🇼","🇦🇺","🇦🇹","🇦🇿","🇧🇸","🇧🇭","🇧🇩","🇧🇧","🇧🇾","🇧🇪","🇧🇿","🇧🇯","🇧🇲","🇧🇹","🇧🇴"] , primaryColor: .pink, secondaryColor: .secondary)]
    private lazy var emojiThemes = Themes<String>(numberOfThemes: thems.count){index in
        return thems[index]
    }
    func getRundomTheme() -> Themes<String>.Theme {
        return emojiThemes.themes.shuffled().first ?? Themes<String>.Theme(name: "faces", emojies:["😀","😁","😂","🤣","😃","😄","😅","😆","😉","😊","😋","😎","😍","😘","🥰","😗","😙","😚","☺️","🙂","🤗","🤩","🤔","🤨"] , primaryColor: .blue, secondaryColor: .secondary)
    }
    func addTheme(name:String, emojies:[String], primaryColor:Color, secondaryColor:Color) {
        emojiThemes.addTheme(theme: Themes<String>.Theme(name: name, emojies: emojies, primaryColor: primaryColor, secondaryColor: secondaryColor))
    }
}


