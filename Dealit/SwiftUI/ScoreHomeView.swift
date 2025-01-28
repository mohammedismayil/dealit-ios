//
//  ScoreHomeView.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 28/01/25.
//

import SwiftUI

struct ScoreHomeView: View {
    var teamScore: Int = 0
    var body: some View {
        Text("Score Home")
        Text("Team score \(teamScore)")
    }
}

#Preview {
    ScoreHomeView()
}
