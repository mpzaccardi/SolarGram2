//
//  ViewModel.swift
//  SolarGram
//
//  Created by Lori Merone on 3/26/23.
//

import Foundation
import SwiftUI
import UIKit

final class ViewModel: ObservableObject {
    @Published var model: PublicPosts = PublicPosts()
    
    var publicPosts: [Post] {
        model.sampleData
    }
    
    func setFavorite(_ post: Post) {
        // set favorite
        model.toggleFavorite(post)
    }
    
    func addPostFrom(image: UIImage?) {

        // make sure the optional is an actual image
        guard let image else {return}
        
        // you must do this on main thread for UI to update properly
        DispatchQueue.main.async {
            // create a new post object, it might look like this, but you can adapt as needed in your project.
            let newPost = Post(photoID: image, description: "Something New", isFavorite: false, author: PublicPosts.currentUser)

            // call some function on the model to add the new post to the array of posts, you can do this how you like, but the logic should be in the model
            self.model.addPost(post: newPost)
        }
    }
    //delete post function
    func deletePost(_ post: Post) {
        model.deletePost(post)
    }
}
