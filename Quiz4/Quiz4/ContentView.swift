//
//  Quiz4App.swift
//  Quiz4
//
//  Created by Jaisika Singh on 2022-03-02.
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        VStack {
            Text("All users")
                .font(.title)
                .bold()

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 10){
                    ForEach(network.users) { user in
                        VStack(alignment: .leading) {
                            Text("\(user.id)")
                            Text(user.name)
                                .bold()
                            Text(user.email.lowercased())
                            Text(user.body)
                        }
                    }
                    .frame(width: 300,  height: 300,alignment: .leading)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                }
            }
            
        }
        .padding(.vertical)
        .onAppear {
            network.getUsers()
        }
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
