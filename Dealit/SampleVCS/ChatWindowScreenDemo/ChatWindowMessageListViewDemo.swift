//
//  ChatWindowMessageListViewDemo.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 12/11/24.
//

import SwiftUI

struct ChatWindowMessageListViewDemo: View {
    let messages = ["Hello there", "How are you?", "Goodbye"]
    var body: some View {
        
        List(messages, id: \.self) { message in
            Text(message)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ChatWindowMessageListViewDemo()
}
