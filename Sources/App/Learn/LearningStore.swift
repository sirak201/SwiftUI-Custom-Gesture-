//
//  LearningStore.swift
//  Kuchi
//
//  Created by Sirak on 12/6/19.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import Foundation
import Languages
import Learning


final class LearningStore {
    
    @Published var deck : FlashDeck
    @Published var card : FlashCard
    @Published var score = 0
    
    
    func getNextCard() -> FlashCard? {
        if let nextCard = self.getLastCard() {
            self.card = nextCard
            self.deck.cards.removeLast()
        }
        return self.card
    }
    
    func getLastCard()  -> FlashCard? {
        if let lastCard = deck.cards.last {
            self.card = lastCard
            return self.card
        } else {
            return nil
        }
    }
    
    
    init() {
        let deck = FlashDeck(from: DeckBuilder.learning.build())
        self.deck = deck
        self.card = FlashCard(card: WordCard(from: TranslatedWord(from: "", withPronunciation: "", andTranslation: "")))
        
        if let nextCard = self.getNextCard() {
            self.card = nextCard
        }

    }
    
    
    
    
    
}

extension LearningStore : ObservableObject {
    
}
