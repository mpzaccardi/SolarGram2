//
//  GridPhotoView.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import SwiftUI

struct GridPhotoView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var posts: [Post]
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:geo.size.width/4))]) {
                    ForEach(posts) { post in
                        SquareImage(Image(uiImage: (post.photoID)!))
                    }
                }
            }
        }

    }
}

struct GridPhotoView_Previews: PreviewProvider {
    static var post = ViewModel().publicPosts
    static var previews: some View {
        PhotoRow(post: post[1])
            .environmentObject(ViewModel())
    }
}
