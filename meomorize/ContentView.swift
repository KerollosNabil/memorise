//
//  ContentView.swift
//  meomorize
//
//  Created by MAC on 6/18/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//     var emojiCardGame = EmojiCardGame()
//
//    var body: some View {
//        //Text("koko")
//        ZStack{
//        Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all)
//            HorizontalStackOfCards(emojiCardGame: emojiCardGame)
//        }
//
//    }
//}

// struct HorizontalStackOfCards: View
struct ContentView: View{
    
   
    
    @ObservedObject var emojiCardGame = EmojiCardGame ()
    var body: some View {
        
        VStack{
            
            Grid(emojiCardGame.cards){card in
                CardView(card: card).onTapGesture {
                    self.emojiCardGame.choos(card: card)
                }
            }
            .foregroundColor(emojiCardGame.theme.color)
            
        }
        
           
            
    }
    
}

struct CardView: View{
    var card : CardGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(size: geometry.size)
        }
    }
    private func body(size:CGSize)-> some View{
        print(size)
        return ZStack{
            
            if card.isFaceUp
            {
                RoundedRectangle(cornerRadius: cornerRedus).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRedus).stroke(lineWidth: lineWidth)
                Text(card.content)
            }else if(card.isMatched==false){
                RoundedRectangle(cornerRadius: cornerRedus).fill()
            }
        }.font(Font.system(size: min(size.width, size.height) * fontRatio))
            .padding(min(size.width, size.height) * paddingRatio)
    }
    let cornerRedus:CGFloat = 10.0
    let lineWidth:CGFloat = 3.0
    let fontRatio:CGFloat = 0.75
    let paddingRatio:CGFloat = 0.02
}







#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
       Group {
        
            ContentView().background(Color(UIColor.systemBackground)).colorScheme(.light)
        
        
            ContentView().background(Color(UIColor.systemBackground)).colorScheme(.dark)
            
        }
    }
}
#endif
