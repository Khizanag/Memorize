//
//  Theme.swift
//  Memorize
//
//  Created by Giga Khizanishvili on 31.01.22.
//

import Foundation

struct Theme<Content> {
    let name: String
    let contents: [Content]
    let numberOfPairs: Int
    let color: String

    init(name: String, contents: [Content], numberOfPairs: Int, color: String) {
        self.name = name
        self.contents = contents
        self.numberOfPairs = min(numberOfPairs, contents.count)
        self.color = color
    }

    var randomContentValues: [Content] {
        Array(contents.shuffled()[0..<numberOfPairs])
    }
}
