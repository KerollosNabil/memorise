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
                    withAnimation(.easeInOut(duration: 1), {
                        self.emojiCardGame.choos(card: card)
                    })
                    
                }
            }
            .foregroundColor(emojiCardGame.theme.primaryColor)
            HStack{
                
                Button(action: {
                    withAnimation(.easeInOut(duration:1), {
                        self.emojiCardGame.newGame()
                    })
                    
                    
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
    @State private var animationBonusRemaining:Double = 0
    private func startBonusTimeAnimation(){
        print(card.bonusRemaining)
        animationBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining), {
            animationBonusRemaining = 0
        })
    }
    @ViewBuilder
    private func body(size:CGSize)-> some View{
        if card.isFaceUp || !card.isMatched{
            ZStack{
                Group{
                    if(card.isConsumingBonusTime){
                        
                        Pie(startAngle: Angle(degrees: -90), endAnlge: Angle(degrees: -90 - (animationBonusRemaining*360.0) ),clockWise: true)
                            .onAppear(){
                                self.startBonusTimeAnimation()
                            }
                    }else{
                        Pie(startAngle: Angle(degrees: -90), endAnlge: Angle(degrees: -90 - card.bonusRemaining*360.0 ),clockWise: true)
                    }
                }.padding(min(size.width, size.height) * paddingRatioForThePie)
                .opacity(0.4)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false): .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .font(Font.system(size: min(size.width, size.height) * fontRatio))
            .padding(min(size.width, size.height) * paddingRatio)
            .transition(.scale)
        }
        
        
        
        

    }
    private let cornerRedus:CGFloat = 10.0
    private let fontRatio:CGFloat = 0.7
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
