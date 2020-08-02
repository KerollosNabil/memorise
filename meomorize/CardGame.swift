//
//  CardGame.swift
//  meomorize
//
//  Created by MAC on 6/20/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation


struct CardGame <CardContentType> {
    var cards:Array<Card>
    var theme:Themes<CardContentType>.Theme
    var score = 0
    
    var indexOfTheOneAndOnlyFaceUpCard:Int?{
        get{
            cards.indices.filter{cards[$0].isFaceUp}.only
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfCards:Int, theme:Themes<CardContentType>.Theme, contents:(Int) -> CardContentType) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfCards {
            let content = contents(pairIndex)
            cards.append(Card(content: content,contentId: pairIndex , id: pairIndex*2))
            cards.append(Card(content: content,contentId: pairIndex , id: pairIndex*2+1))
            
        }
        self.theme = theme
        cards.shuffle()
    }
    
    mutating func choose(card:Card)  {
        print(card)
        if let cardIndex = cards.firstIndex(matching: card), !cards[cardIndex].isMatched, !cards[cardIndex].isFaceUp{
            
            if let theOnlyCard = indexOfTheOneAndOnlyFaceUpCard{
                if cards[cardIndex].contentId == cards[theOnlyCard].contentId {
                    cards[theOnlyCard].isMatched = true
                    cards[cardIndex].isMatched = true
                    score+=2
                }else if card.isVisited{
                    score -= 1
                }
                cards[cardIndex].isFaceUp = true
                
            }else{
                if card.isVisited{
                    score -= 1
                }
                indexOfTheOneAndOnlyFaceUpCard = cardIndex
            }
            cards[cardIndex].isVisited = true
            print(score)
        }
        
    }
    private func index(of card:Card) -> Int{
        for cardIndex in 0..<self.cards.count {
            if cards[cardIndex].id == card.id{
                return cardIndex
            }
        }
        return -1
    }
    
    struct Card:Identifiable  {
        
        
        var isFaceUp = false
        var isMatched = false
        var content:CardContentType
        var contentId:Int
        var isVisited = false
        let id:Int
    }
}
