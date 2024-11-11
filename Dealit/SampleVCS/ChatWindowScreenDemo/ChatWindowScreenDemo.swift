//
//  ChatWindowScreenDemo.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 11/11/24.
//

import SwiftUI

struct ChatWindowScreenDemo: View {
    var body: some View {
        VStack {
            ChatWindowHeaderDemo().padding(.horizontal, 20)
            ZStack {
                Image("profilepicture")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                ScrollView {
                    Text("Hello")
                }.ignoresSafeArea()
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    ChatWindowScreenDemo()
}
