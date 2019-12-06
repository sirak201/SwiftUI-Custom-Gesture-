//
//  CardView.swift
//  Kuchi
//
//  Created by Sirak on 12/6/19.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import SwiftUI
import Learning
import Languages

struct CardView: View {
    private let flashcard : FlashCard
    @State private var revealed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 320, height: 210)
                .cornerRadius(12)
            VStack {
                Spacer()
                Text(flashcard.card.word.original)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                if self.revealed {
                    Text(flashcard.card.word.translation)
                        .font(.caption)
                        .foregroundColor(.white)
                }
          
                Spacer()
            }
        }
        .shadow(radius: 8)
        .frame(width: 320, height: 210)
        .animation(.spring())
        .gesture(TapGesture()
        .onEnded({
            withAnimation(.easeIn, {
                self.revealed = !self.revealed
            })
        })
        
        
        )
    }
    
    init(_ card: FlashCard) {
        self.flashcard = card
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = FlashCard(card: WordCard(from: TranslatedWord(from: "Apple", withPronunciation: "Apple", andTranslation: "Omena")))
        return CardView(card)
    }
}
