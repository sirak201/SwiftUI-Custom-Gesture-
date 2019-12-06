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

internal enum DiscardDirection {
    case left
    case right
}

struct CardView: View {
    
    typealias  CardDrag = (_ card : FlashCard , _ direction: DiscardDirection) -> Void
    @State var offset : CGSize = .zero
    private let flashcard : FlashCard
    @State private var revealed = false
    @GestureState var isLongPressed = false
    private let dragged : CardDrag
    
    var body: some View {
        
        let drag = DragGesture()
            .onChanged{self.offset = $0.translation}
            .onEnded{
                if $0.translation.width < -100{
                    self.dragged(self.flashcard, .left)
                    self.offset = .init(width: -1000, height: 0)
                } else if $0.translation.width > 100 {
                    self.offset = .init(width: 1000, height: 0)
                    self.dragged(self.flashcard, .right)
                } else {
                    self.offset = .zero
                }
        }
        
        let longPress = LongPressGesture()
            .updating($isLongPressed) {
                value , state , transition in
                
                state = value
        }.simultaneously(with: drag)
        
        return ZStack {
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
        .offset(self.offset)
        .gesture(longPress)
        .scaleEffect(isLongPressed ? 1.1 : 1)
        .gesture(TapGesture()
        .onEnded({
            withAnimation(.easeIn, {
                self.revealed = !self.revealed
            })
        })
        
        
        )
    }
    
    init(_ card: FlashCard, onDrag dragged: @escaping CardDrag = {_,_ in }) {
        self.flashcard = card
        self.dragged = dragged
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = FlashCard(card: WordCard(from: TranslatedWord(from: "Apple", withPronunciation: "Apple", andTranslation: "Omena")))
        return CardView(card)
    }
}
