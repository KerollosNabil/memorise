//
//  CardGame.swift
//  meomorize
//
//  Created by MAC on 6/20/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation


struct CardGame <CardContentType> {
    private(set) var cards:Array<Card>
    private(set) var theme:Themes<CardContentType>.Theme
    private(set) var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard:Int?{
        get{
            cards.indices.filter{cards[$0].isFaceUp}.only
        }
        set{
            cards.indices.forEach({index in cards[index].isFaceUp = index == newValue})
//            for index in cards.indices{
//
//                if cards[index].isMatched == false {
//                    cards[index].isFaceUp = index == newValue
//                }
//
//            }
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
        }
        
        
    }
    
    
    struct Card:Identifiable  {
        
        
        var isFaceUp = false {
            didSet{
                if isFaceUp {
                    startUsingBonusTime()
                }else{
                    stopUsingBonusTime()
                }
            }
        }
        var isMatched = false{
            didSet{stopUsingBonusTime()}
        }
        var content:CardContentType
        var contentId:Int
        var isVisited = false
        let id:Int
        
        
        
        
        var bonusTimeLimit : TimeInterval = 6
        private var faceUpTime:TimeInterval{
            if let lastFaceUpDate = self.lastFaceUpDate{
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            }
            else{
                return pastFaceUpTime
            }
        }
        var lastFaceUpDate : Date?
        var pastFaceUpTime : TimeInterval = 0
        var bonusTimeRemaining : TimeInterval{
            max(0, bonusTimeLimit-faceUpTime)
        }
        var bonusRemaining :Double{
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        var hasEarnedBonus:Bool{
            isMatched && bonusTimeRemaining > 0
        }
        var isConsumingBonusTime:Bool{
            isFaceUp && !isMatched && bonusTimeRemaining>0
        }
        private mutating func startUsingBonusTime (){
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        private mutating func stopUsingBonusTime (){
            pastFaceUpTime = faceUpTime
            lastFaceUpDate = nil 
        }
    }
    
    
}
