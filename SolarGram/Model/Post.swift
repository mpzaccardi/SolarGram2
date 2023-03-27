//
//  Post.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import Foundation
import SwiftUI
import UIKit

struct Post: Identifiable {
    let id: UUID = UUID()
    let photoID: UIImage?
    let description: String
    var isFavorite: Bool = false
    let author: User
}
