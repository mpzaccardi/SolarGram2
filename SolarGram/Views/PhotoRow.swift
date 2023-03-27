//
//  PhotoRow.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import SwiftUI

struct PhotoRow: View {
    
    @EnvironmentObject var viewModel: ViewModel
    var post: Post
    
    private let authorImageHeight: CGFloat = 30
    
    var body: some View {
        VStack(alignment: .leading) {
            authorView
            SquareImage(Image(uiImage: (post.photoID)!))
            descriptionView
            actionView
            #if os(macOS)
            Divider()
                .padding(.vertical)
            #endif
        }
    }
    
    var authorView: some View {
        HStack {
            SquareImage(Image(post.author.photoID))
                .frame(height: authorImageHeight)
                .clipShape(Circle())
            Text(post.author.name)
                .font(.headline)
        }
        .padding(.leading, 8)
    }
    
    var actionView: some View {
        HStack {
            Button {
                viewModel.setFavorite(post)
            } label: {
                if post.isFavorite {
                    Image(systemName: "heart.fill")
                } else {
                    Image(systemName: "heart")
                }
            }.buttonStyle(.plain)
            Spacer()
            // tests for user before displaying button to delete
            if post.author.id == PublicPosts.currentUser.id {
                Button {
                    viewModel.deletePost(post)
                } label: {
                    Image(systemName: "trash")
                }.buttonStyle(.plain)
            }
        }
        .padding(.trailing, 8)
    }
    
    var descriptionView: some View {
        Text(post.description)
            .font(.caption)
            .padding(.leading, 8)
            .padding(.bottom, 8)

    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var post = ViewModel().publicPosts
    static var previews: some View {
        PhotoRow(post: post[1])
    }
}
