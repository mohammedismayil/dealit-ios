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
    var body: some View {
        HStack {
            Text("Home screen").padding(.leading)
            Spacer()
            Button("Add User") {
                print("Add user")
            }.padding(.trailing)
            
        }
        
        List(users) { (user) in
            Text(user.name ?? "")
        }
    }
}

#Preview {
    HomeScreenView()
}
