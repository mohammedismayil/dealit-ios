//
//  PlayerScoreView.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 28/01/25.
//

import SwiftUI

struct PlayerScoreView: View {
    @ObservedObject var teamScoreModelA: TeamScoreModel
    @StateObject var teamScoreModelB: TeamScoreModel
    var body: some View {
        Text("Player A score \(teamScoreModelA.playerAScore)")
        Button("Player A") {
            teamScoreModelA.playerAScore = teamScoreModelA.playerAScore + 1
        }
        Text("Player B score \(teamScoreModelB.playerAScore)")
        Button("Player B") {
            teamScoreModelB.playerAScore = teamScoreModelB.playerAScore + 1
        }
    }
}

#Preview {
    PlayerScoreView(teamScoreModelA: TeamScoreModel(), teamScoreModelB: TeamScoreModel())
}
