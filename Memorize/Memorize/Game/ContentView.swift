//
//  ContentView.swift
//  Memorize
//
//  Created by Giga Khizanishvili on 28.10.21.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var color: Color {
        Self.stringToColor(viewModel.cardColor)
    }

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(model: card, color: color)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                    }
                }
                .padding(.all, 5)
                .foregroundColor(color)
            }
            HStack {
                Button("Start New Game") {
                    viewModel.startNewGame()
                }
                .padding()
                Spacer()
                Text("Score: \(viewModel.score)")
                    .padding()

            }
        }
    }

    static func stringToColor(_ stringValue: String) -> Color{
        switch stringValue.lowercased() {
        case "red":     return .red
        case "blue":    return .blue
        case "yellow":  return .yellow
        case "green":   return .green
        default:        return .cyan
        }
    }
}

// MARK: - CardView

struct CardView: View {
    let model: Model<ViewModel.CardContent>.Card
    let color: Color

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 10)
        
        ZStack {
            if model.isFaceUp {
                shape
                    .stroke(lineWidth: 3)
                shape
                    .fill()
                    .foregroundColor(.white)
                Text(model.content)
                    .font(.largeTitle)
            } else if model.isMatched {
                shape
                    .opacity(0)
            } else {
                shape
                    .fill(color)
            }

        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
