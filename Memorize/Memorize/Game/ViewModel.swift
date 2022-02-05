//
//  ViewModel.swift
//  Memorize
//
//  Created by Giga Khizanishvili on 30.01.22.
//

import Foundation

final class ViewModel: ObservableObject {

    typealias CardContent = String

    @Published private var model: Model<CardContent>

    init() {
        self.model = .init(theme: Self.randomTheme)
    }

    var cards: [Model<CardContent>.Card] {
        model.cards
    }

    var cardColor: String {
        model.theme.color
    }

    var score: Int {
        model.score
    }

    func choose(card: Model<CardContent>.Card) {
        model.choose(card: card)
    }

    func startNewGame() {
        model.update(theme: Self.randomTheme)
    }

    // MARK: - Theme(s)

    private static var allThemes: [Theme<CardContent>] {
        [
            .init(name: "Animals", contents: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🙈", "🙉", "🙊", "🐒", "🐔", "🐧", "🐦", "🐤", "🐣", "🐥", "🦆", "🦅", "🦉", "🦇", "🐺", "🐗", "🐴", "🦄", "🐝", "🪱", "🐛", "🦋", "🐌", "🐞", "🐜", "🪰", "🪲", "🪳", "🦟", "🦗", "🕷", "🕸", "🦂"], numberOfPairs: 5, color: "red"),
            .init(name: "Sports", contents: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "", "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🏏", "🪃", "🥅", "⛳️", "🪁", "🎣", "🏹", "🤿", "🥊", "🥋", "🎽", "🛹", "🛼", "🛷", "⛸", "🥌", "🎿", "⛷", "🏂", "🪂", "🏋️‍♀️", "🏋️", "🏋️‍♂️", "🤼‍♀️", "🤼", "🤼‍♂️", "🤸‍♀️", "🤸", "🤸‍♂️", "⛹️‍♀️", "⛹️", "⛹️‍♂️", "🤺", "🤾‍♀️"], numberOfPairs: 19, color: "green"),
            .init(name: "Travel", contents: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇", "🚊", "🚉", "✈️", "🛫", "🛬", "🛩", "💺", "🛰", "🚀", "🛸"], numberOfPairs: 19, color: "blue"),
            .init(name: "Food (Part 1)", contents: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌶", "🫑"], numberOfPairs: 18, color: "yellow"),
            .init(name: "Food (Part 2)", contents: ["🌽", "🥕", "🫒", "🧄", "🧅", "🥔", "🍠", "🥐", "🥯", "🍞", "🥖", "🥨", "🧀", "🥚", "🍳", "🧈", "🥞", "🧇", "🥓", "🥩", "🍗", "🍖", "🦴", "🌭", "🍔"], numberOfPairs: 20, color: "yellow"),
            .init(name: "Flags (Part 1)", contents: ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲" ,"🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧"], numberOfPairs: 5, color: "pink"),
            .init(name: "Flags (Part 2)", contents: ["🇧🇪", "🇧🇿", "🇧🇯", "🇧🇲", "🇧🇹", "🇧🇴", "🇧🇦", "🇧🇼", "🇧🇷", "🇻🇬", "🇧🇳", "🇧🇬" ,"🇧🇫", "🇧🇮", "🇰🇭", "🇨🇲", "🇮🇨", "🇨🇦", "🇨🇻", "🇧🇶"], numberOfPairs: 5, color: "yellow"),
            .init(name: "Flags (Part 3)", contents: ["🇨🇫", "🇹🇩", "🇮🇴", "🇨🇱", "🇨🇳", "🇨🇽", "🇨🇨", "🇨🇴", "🇰🇲", "🇨🇬", "🇨🇩", "🇨🇰" ,"🇨🇷", "🇨🇮", "🇭🇷", "🇨🇺", "🇨🇼", "🇨🇾", "🇨🇿", "🇩🇰"], numberOfPairs: 5, color: "green")

        ]
    }

    private static var randomTheme: Theme<CardContent> {
        allThemes.randomElement()!
    }
}
