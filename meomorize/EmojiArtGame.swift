//
//  EmojiCardGame.swift
//  meomorize
//
//  Created by MAC on 6/20/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class EmojiCardGame:ObservableObject{
    private let maxCardPairsNumber = 10
    @Published private var cardGame:CardGame<String>
    private let emojiThemes:EmohiThemes
    init() {
        emojiThemes = EmohiThemes()
        let theme = emojiThemes.getRundomTheme()
        let emojies = theme.emojies.shuffled()
        
        cardGame =  CardGame<String>(numberOfCards: Int.random(in: 2...maxCardPairsNumber), theme: theme , contents: {index in
            return emojies[index]
        })
    }
    var cards :Array<CardGame<String>.Card>{
        cardGame.cards
    }
    var theme:Themes<String>.Theme{
        cardGame.theme
    }
    // MARK: - Intents
    func choos(card:CardGame<String>.Card) {
        cardGame.choose(card: card)
    }
    
}
