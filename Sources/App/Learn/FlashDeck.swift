//
//  FlashDeck.swift
//  Kuchi
//
//  Created by Sirak on 12/6/19.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import Foundation
import Learning
import Combine

final internal class FlashDeck {
    
    @Published var cards : [FlashCard]
    
    init(from words : [WordCard]) {
        self.cards = words.map{
            FlashCard(card: $0)
        }
    }
    
}

extension FlashDeck : ObservableObject {
    
}
