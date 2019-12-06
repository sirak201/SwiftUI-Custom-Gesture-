//
//  LearnView.swift
//  Kuchi
//
//  Created by Sirak on 12/6/19.
//  Copyright © 2019 Omnijar. All rights reserved.
//

import SwiftUI
import Combine

struct LearnView: View {
    @ObservedObject private var learningStore = LearningStore()
    var body: some View {
        VStack {
            Spacer()
            Text("Swipe Left if you remembered"
                +
                "\n Swipe right if your didnt"
            )
            DeckView(onMemorized: {self.learningStore.score += 1}, deck: learningStore.deck)
                .font(.headline)
                Spacer()
            Text("Remembered \(self.learningStore.score)" + "/\(self.learningStore.deck.cards.count)")
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
