//
//  ChatWindowScreenDemo.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 11/11/24.
//

import SwiftUI

struct ChatWindowScreenDemo: View {
    var body: some View {
        VStack(spacing: 0) {
            ChatWindowHeaderDemo().padding(.bottom, 5).padding(.horizontal,10)
            ScrollView {
                Text("Test")
            }.background(
                Image("profilepicture")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .bottom)
            ).frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ChatWindowScreenDemo()
}
