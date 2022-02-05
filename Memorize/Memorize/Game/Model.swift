//
//  Model.swift
//  Memorize
//
//  Created by Giga Khizanishvili on 30.01.22.
//

import Foundation
import SwiftUI

struct Model<CardContent> where CardContent: Equatable {

    private let pointsForMatch = 2
    private let pointsForMismatchThatWasSeenBefore = -1

    // MARK: - Properties

    private(set) var cards: [Card]
    private(set) var theme: Theme<CardContent>
    private(set) var score: Int
    private var facedUpCardIndex: Int?

    // MARK: - Init

    init(theme: Theme<CardContent>) {
        self.cards = []
        self.theme = theme
        self.score = 0

        update(theme: theme)
    }

    // MARK: - Internal

    mutating func update(theme: Theme<CardContent>) {
        self.cards = []
        for (pairIndex, content) in theme.randomContentValues.enumerated() {
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        self.cards = cards.shuffled()
        self.theme = theme
        self.score = 0
        self.facedUpCardIndex = nil
    }

    mutating func choose(card: Card) {
        guard !card.isFaceUp else { return }
        guard !card.isMatched else { return }
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }

        if let facedUpCardIndex = facedUpCardIndex {
            if cards[facedUpCardIndex].content == cards[index].content { // is match
                cards[facedUpCardIndex].isMatched = true
                cards[index].isMatched = true
                score += pointsForMatch
            } else {
                if cards[facedUpCardIndex].isSeen { score -= 1 }
                if cards[index].isSeen            { score -= 1 }
            }
            self.facedUpCardIndex = nil
        } else {
            cards.indices.forEach{ index in
                if cards[index].isFaceUp {
                    cards[index].isSeen = true
                    cards[index].isFaceUp = false
                }
            }
            facedUpCardIndex = index
        }

        cards[index].isFaceUp.toggle()
    }

    // MARK: - Card

    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var isFaceUp = false
        var isMatched = false
        var isSeen = false

        init(id: Int, content: CardContent) {
            self.id = id
            self.content = content
        }
    }

}
