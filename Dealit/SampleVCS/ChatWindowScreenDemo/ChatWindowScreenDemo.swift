//
//  ChatWindowScreenDemo.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 11/11/24.
//

import SwiftUI

struct ChatWindowScreenDemo: View {
    var body: some View {
        ZStack (alignment: .center){
            Image("profilepicture")
                .resizable().padding(.top,45)
            VStack(spacing: 0) {
                ChatWindowHeaderDemo()
                ScrollView {
                    Text("Test")
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        
    }
}

#Preview {
    ChatWindowScreenDemo()
}
