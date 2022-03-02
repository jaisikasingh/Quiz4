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
            Text("All comments")
                .font(.title)
                .bold()

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 10){
                    ForEach(network.comments) { comment in
                        VStack(alignment: .leading) {
                            Text("\(comment.id)")
                            Text(comment.name)
                                .bold()
                            Text(comment.email.lowercased())
                            Text(comment.body)
                        }
                    }
                    .frame(width: 300,  height: 300,alignment: .leading)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                }
            }
            VStack(alignment: .leading){
                if network.comments.count > 0,
                   let comments = network.comments[10]{
                    Text("\(comments.id)")
                    Text(comments.name)
                        .bold()
                    Text(comments.email.lowercased())
                    Text(comments.body)
                    
                }
                
            }
            .frame(width: 300,  height: 300,alignment: .leading)
            .padding()
            .background(Color.green)
            .cornerRadius(20)
        }
      
        .padding(.vertical)
        .onAppear {
            network.getComments()
        }
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
