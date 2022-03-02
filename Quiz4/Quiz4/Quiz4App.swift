//
//  Quiz4App.swift
//  Quiz4
//
//  Created by Jaisika Singh on 2022-03-02.
//

import SwiftUI

@main
struct Quiz4App: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
