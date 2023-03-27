//
//  PublicPosts.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import Foundation
import UIKit

struct PublicPosts {
    
    static let currentUser: User = User(name: "Douglas", photoID: "doug")
            
    var sampleData: [Post] = [
        Post(photoID: UIImage(named: "photo1"), description: "Something really great", author: PublicPosts.currentUser),
        Post(photoID: UIImage(named: "photo2"), description: "Something really great", author: User(name: "Joe", photoID: "joe")),
        Post(photoID: UIImage(named: "photo3"), description: "Something really great", author: User(name: "Sally", photoID: "sally")),
        Post(photoID: UIImage(named: "photo4"), description: "Something really great", author: User(name: "Jill", photoID: "jill")),
        Post(photoID: UIImage(named: "photo5"), description: "Something really great", author: PublicPosts.currentUser),
        Post(photoID: UIImage(named: "photo6"), description: "Something really great", author: PublicPosts.currentUser),
        Post(photoID: UIImage(named: "photo7"), description: "Something really great", author: PublicPosts.currentUser),
        Post(photoID: UIImage(named: "photo8"), description: "Something really great", author: PublicPosts.currentUser)

    ]
    
    mutating func toggleFavorite(_ post: Post) {
        let postIndex = sampleData.firstIndex { p in
            p.id == post.id
        }
        guard let actualIndex = postIndex else {return}
        
        sampleData[actualIndex].isFavorite.toggle()
    }
    
    mutating func deletePost(_ post: Post) {
        let postIndex = sampleData.firstIndex { p in
            p.id == post.id
        }
        guard let actualIndex = postIndex else {return}
        
        sampleData.remove(at: actualIndex)
    }
    
    mutating func addPost
    (post: Post) {
        sampleData.append(post)
    }
}
