//
//  ScoreHomeView.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 28/01/25.
//

import SwiftUI

struct ScoreHomeView: View {
    @State var teamScore = 0
    var body: some View {
        VStack {
            Text("Score Home")
            Text("Team score \(teamScore)")
            Button("Team") {
                teamScore = teamScore + 1
            }
            PlayerScoreView(teamScoreModel: TeamScoreModel())
        }
       
    }
}

#Preview {
    ScoreHomeView()
}
class TeamScoreModel: ObservableObject {
    @Published var teamScore: Int = 0
    @Published var playerAScore: Int = 0
}
