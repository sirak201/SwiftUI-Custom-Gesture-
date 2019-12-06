//
//  DeckView.swift
//  Kuchi
//
//  Created by Sirak on 12/6/19.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import SwiftUI

struct DeckView: View {
    @ObservedObject private var deck: FlashDeck
    private let onMemorized: () -> Void
    
    var body: some View {
        ZStack {
                ForEach(deck.cards.filter {$0.isActive}) {
                    card in
                    self.getCardView(for: card)
                }
            }
    }
    
    
    private func getCardView(for card : FlashCard) -> CardView {
        let activatCards = deck.cards.filter{
            $0.isActive == true
        }
        if let lastCard = activatCards.last {
            if lastCard == card {
               return createCardView(for: card)
            }
  
        }
        let view = createCardView(for: card)
        return view
        
        
    }
    private func createCardView(for card: FlashCard) -> CardView {
        let view = CardView(card, onDrag : {card , direction in
            if direction == .left {
                self.onMemorized()
            }
        })

      return view
    }
    
    init(onMemorized : @escaping () -> Void , deck: FlashDeck) {
        self.onMemorized = onMemorized
        self.deck = deck
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(onMemorized: {}, deck: LearningStore().deck)
    }
}
