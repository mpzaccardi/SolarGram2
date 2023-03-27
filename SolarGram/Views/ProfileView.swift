//
//  ProfileView.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    

    
    private let headerHeight: CGFloat = 120
    
    
    var body: some View {
        let post = viewModel.publicPosts.reversed()
        let posts = post.filter { post in
            post.author.id == PublicPosts.currentUser.id
        }
        VStack {
            headerView
            GridPhotoView(posts: posts)
            
        }
    }
    
    var headerView: some View {
        VStack {
            SquareImage(Image(PublicPosts.currentUser.photoID))
                .clipShape(Circle())
            Text(PublicPosts.currentUser.name)
                .font(.title)
        }
        .frame(height: headerHeight)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ViewModel())
    }
}
