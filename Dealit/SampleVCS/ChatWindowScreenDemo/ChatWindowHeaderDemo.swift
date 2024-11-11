//
//  ChatWindowHeaderDemo.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 11/11/24.
//

import SwiftUI

struct ChatWindowHeaderDemo: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.left")
                    .scaleEffect(0.7)
                    .font(Font.title.weight(.bold))
            }
            Image(uiImage: UIImage(resource: ImageResource(name: "profilepicture", bundle: .main))).resizable().frame(height: 40).frame(width: 40).clipShape(.circle)
            Text("John peter").bold()
            Spacer()
            Button(action: {}) {
                Image(systemName: "phone.fill")
                    .scaleEffect(0.7)
                    .font(Font.title.weight(.medium))
            }
            Button(action: {}) {
                Image(systemName: "video.fill")
                    .scaleEffect(0.7)
                    .font(Font.title.weight(.medium))
            }
            Button(action: {}) {
                Image(systemName: "ellipsis")
                    .scaleEffect(0.7)
                    .font(Font.title.weight(.medium))
            }
        }
    }
}

#Preview {
    ChatWindowHeaderDemo()
}
