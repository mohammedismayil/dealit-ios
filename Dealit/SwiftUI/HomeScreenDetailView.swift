//
//  HomeScreenDetailView.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 23/06/25.
//

import SwiftUI

struct HomeScreenDetailView: View {
    @Environment(\.managedObjectContext) private var context
    var body: some View {
        VStack {
            Text("HomeScreen Detail View")
            Button("Add User") {
                print("Add user")
                addUser(name: "John doe")
            }.padding(.trailing)
        }
        
    }
    
    private func addUser(name: String) {
        let newUser = UserEntity(context: context)
        newUser.id = UUID()
        newUser.name = name
        do {
            try context.save()
        } catch {
            print("Failed to save user: \(error)")
        }
    }
}

#Preview {
    HomeScreenDetailView()
}
