//
//  User.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    let name: String
    let photoID: String
}
