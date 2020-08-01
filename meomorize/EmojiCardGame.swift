//
//  EmojiCardGame.swift
//  meomorize
//
//  Created by MAC on 6/20/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class EmojiCardGame:ObservableObject{
    var theme:Theme
    @Published private var cardGame:CardGame<String> = {
        let emojies = theme
        return CardGame<String>(numberOfCards: Int.random(in: 2...emojies.count) , contents: {index in
            return emojies[index]
        })}()
    
    
//    static private(set) var emojiThemes: EmojiThemes = {
//        var thems = EmojiThemes(themes: [])
//        thems.addTheme(theme: EmojiThemes.Theme(name: "faces", emojies:Array(arrayLiteral: "😀😁😂🤣😃😄😅😆😉😊😋😎😍😘🥰😗😙😚☺️🙂🤗🤩🤔🤨") , color: .blue))
//        thems.addTheme(theme: EmojiThemes.Theme(name: "faces", emojies:Array(arrayLiteral: "🐶🐱🐭🐹🐰🦊🦝🐻🐼🦘🦡🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐒🐔🐧🐦") , color: .red))
//        thems.addTheme(theme: EmojiThemes.Theme(name: "faces", emojies:Array(arrayLiteral: "⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱🪀🏓🏸🏒🥅🥊🎽🛹⛷🪂🏋️‍♀️🤸‍♀️⛹️‍♀️🤺🏌️‍♀️🏇🧘‍♀️🏄‍♀️") , color: .green))
//        thems.addTheme(theme: EmojiThemes.Theme(name: "faces", emojies:Array(arrayLiteral: "🍏🍎🍐🍊🍋🍌🍉🍇🍓🍈🍒🍑🥭🍍🥝🍅🍆🥑🥦🥬🥒🌶🌽🥕🧄🧅🥔🍠") , color: .yellow))
//        thems.addTheme(theme: EmojiThemes.Theme(name: "faces", emojies:Array(arrayLiteral: "🚗🚙🚕🚌🚎🏎🚓🚑🚒🚐🚚🚛🚜🛴🚲🛵🏍🛺🚔🚍🚘🚖🚡🚠🚟🚝🚄🚅✈️🛬💺") , color: .orange))
//        thems.addTheme(theme: EmojiThemes.Theme(name: "faces", emojies:Array(arrayLiteral: "🏳️🏴🏁🚩🏳️‍🌈🏴‍☠️🇦🇫🇦🇽🇦🇱🇩🇿🇦🇸🇦🇩🇦🇴🇦🇮🇦🇶🇦🇬🇦🇷🇦🇲🇦🇼🇦🇺🇦🇹🇦🇿🇧🇸🇧🇭🇧🇩🇧🇧🇧🇾🇧🇪🇧🇿🇧🇯🇧🇲🇧🇹🇧🇴") , color: .pink))
//        return thems
//    }()
    
    
    var cards :Array<CardGame<String>.Card>{
        cardGame.cards
    }
    
    // MARK: - Intents
    func choos(card:CardGame<String>.Card) {
        cardGame.choose(card: card)
    }
    
}
