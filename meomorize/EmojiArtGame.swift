//
//  EmojiCardGame.swift
//  meomorize
//
//  Created by MAC on 6/20/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

class EmojiCardGame:ObservableObject{
    static private let maxCardPairsNumber = 10
    @Published private var cardGame:CardGame<String>
    static private var emojiThemes = EmohiThemes()
    init() {
        cardGame = EmojiCardGame.startGame()
    }
    private static func startGame () -> CardGame<String>{
        let theme = emojiThemes.getRundomTheme()
        let emojies = theme.emojies.shuffled()
        
        return  CardGame<String>(numberOfCards: Int.random(in: 2...maxCardPairsNumber), theme: theme , contents: {index in
            return emojies[index]
        })
    }
    var cards :Array<CardGame<String>.Card>{
        cardGame.cards
    }
    var theme:Themes<String>.Theme{
        cardGame.theme
    }
    var score:Int{
        return cardGame.score
    }
    
    // MARK: - Intents
    func choos(card:CardGame<String>.Card) {
        cardGame.choose(card: card)
    }
    func newGame() {
        cardGame = EmojiCardGame.startGame()
    }
    
}
