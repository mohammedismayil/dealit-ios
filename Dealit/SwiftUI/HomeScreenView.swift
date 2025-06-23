//
//  HomeScreenView.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 17/06/25.
//

import SwiftUI
import CoreData

struct HomeScreenView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
            entity: UserEntity.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \UserEntity.name, ascending: true)]
        ) 
    var users: FetchedResults<UserEntity>
    @State private var showingSheet = false
    var body: some View {
        HStack {
            Text("Home screen").padding(.leading)
            Spacer()
            Button("Add User") {
                print("Add user")
                addUser(name: "John doe")
            }.padding(.trailing)
            
        }
        
        List() {
            ForEach(users) { (user) in
                Text(user.name ?? "").sheet(isPresented: $showingSheet, content: {
                    HomeScreenDetailView()
                }).onTapGesture {
                    showingSheet.toggle()
                }
            }.onDelete(perform: deleteUser)
        }.onAppear(perform: {
            print("re rendered")
        })
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
    
    private func deleteUser(index: IndexSet) {
        for index in index {
            let user = users[index]
            context.delete(user)
        }
        do {
            try context.save()
        } catch {
            print("Failed to delete user: \(error)")
        }
    }
}

#Preview {
    HomeScreenView()
}
