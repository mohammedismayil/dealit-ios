//
//  ChatWindowScreenDemo.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 11/11/24.
//

import SwiftUI

struct ChatWindowScreenDemo: View {
    var body: some View {
        ScrollView {
            ChatWindowHeaderDemo().padding(.horizontal, 20)
        }
    }
}

#Preview {
    ChatWindowScreenDemo()
}
