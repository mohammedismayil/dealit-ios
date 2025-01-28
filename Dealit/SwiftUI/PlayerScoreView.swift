//
//  PlayerScoreView.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 28/01/25.
//

import SwiftUI

struct PlayerScoreView: View {
    @ObservedObject var teamScoreModel: TeamScoreModel
    var body: some View {
        Text("Player A score \(teamScoreModel.playerAScore)")
        Button("Player A") {
            teamScoreModel.playerAScore = teamScoreModel.playerAScore + 1
        }
    }
}

#Preview {
    PlayerScoreView(teamScoreModel: TeamScoreModel())
}
