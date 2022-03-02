//
//  User.swift
//  Quiz4
//
//  Created by Jaisika Singh on 2022-03-02.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var email: String
    var body: String
    
}
