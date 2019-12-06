//
//  FlashCard.swift
//  Kuchi
//
//  Created by Sirak on 12/6/19.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import Learning
import Foundation

struct FlashCard : Identifiable {
    
    var card : WordCard
    let id = UUID()
    var isActive = true
}

extension FlashCard : Equatable {

    static func == (lhs : FlashCard, rhs: FlashCard) -> Bool {
        return lhs.card.word.original == rhs.card.word.original
                    &&
            lhs.card.word.translation == rhs.card.word.translation
    }
    
    
}
