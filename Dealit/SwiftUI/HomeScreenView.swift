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
            
        }.onAppear(perform: {
           getSampleUserDetailsFromAPI()
        })
        
        List() {
            ForEach(users) { (user) in
                if let user = user.userDetails?.decoded(as: UserDetailsAPIModel.self) as? UserDetailsAPIModel {
                    let name = user.userDetails.personalDetails.name
                    Text(name).sheet(isPresented: $showingSheet, content: {
                        HomeScreenDetailView()
                    }).onTapGesture {
                        showingSheet.toggle()
                    }
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

    func getSampleUserDetailsFromAPI() {
        guard let url = URL(string: "https://dummyjson.com/c/98f8-95ea-4014-8a23") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let userDetails = try decoder.decode(UserDetailsAPIModel.self, from: data)
                
                print(userDetails.userDetails.personalDetails.name)
                
                let newUser = UserEntity(context: context)
                newUser.id = UUID()
                newUser.name = userDetails.userDetails.personalDetails.name
                newUser.userDetails = CodableWrapper(userDetails)
                do {
                    try context.save()
                } catch {
                    print("Failed to save user: \(error)")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

#Preview {
    HomeScreenView()
}
