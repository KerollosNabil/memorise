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
            //Text("koko")
            Text("Score:\(emojiCardGame.score)").fontWeight(.semibold)
                .font(Font.italic(.title)())
                .padding()
            Grid(emojiCardGame.cards){card in
                CardView(card: card).onTapGesture {
                    self.emojiCardGame.choos(card: card)
                }
            }
            .foregroundColor(emojiCardGame.theme.primaryColor)
            HStack{
                
                Button(action: {
                    self.emojiCardGame.newGame()
                    
                }) {
                    Text("New Game").fontWeight(.semibold)
                    .font(.title)
                        .padding()
                    .foregroundColor(.white)
                        .background(emojiCardGame.theme.primaryColor)
                    .cornerRadius(40)

                }
                
            }
            
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
    @ViewBuilder
    private func body(size:CGSize)-> some View{
        if card.isFaceUp || !card.isMatched{
            ZStack{
                Pie(startAngle: Angle(degrees: -90), endAnlge: Angle(degrees: -340),clockWise: true)
                .padding(min(size.width, size.height) * paddingRatioForThePie)
                .opacity(0.4)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            }
            .cardify(isFaceUp: card.isFaceUp)
            .font(Font.system(size: min(size.width, size.height) * fontRatio))
            .padding(min(size.width, size.height) * paddingRatio)
        }
        
        
        
        

    }
    private let cornerRedus:CGFloat = 10.0
    private let fontRatio:CGFloat = 0.75
    private let paddingRatio:CGFloat = 0.02
    private let paddingRatioForThePie:CGFloat = 0.03
    
}







#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static let contView = ContentView()
    
    
    static var previews: some View {
    
        contView.emojiCardGame.choos(card: contView.emojiCardGame.cards[0])
       return Group {
             
            contView.background(Color(UIColor.systemBackground)).colorScheme(.light)
        
        
            contView.background(Color(UIColor.systemBackground)).colorScheme(.dark)
            
        }
    }
}
#endif
