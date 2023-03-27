//
//  PhotoList.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import SwiftUI

struct PhotoList: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var showImagePicker = false
    @State var showCameraPicker = false
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.publicPosts.reversed())
                {post in PhotoRow(post: post)
                        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                }
            }
            
            .listStyle(.plain)
            bar
        }
    }
    
    
    
    var bar: some View {
        HStack {
            Button {
                showImagePicker = true
            } label: {
                Image(systemName: "plus.app.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                    .padding(.all, 8)
                
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(viewModel: viewModel)
            }
            Button {
                showCameraPicker = true
            } label: {
                Image(systemName: "camera.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                    .padding(.all, 8)
                
            }
            .sheet(isPresented: $showCameraPicker) {
                CameraPicker(viewModel: viewModel)
            }
        }
    }
}

struct PhotoList_Previews: PreviewProvider {
    static var previews: some View {
        PhotoList()
            .environmentObject(ViewModel())
    }
}
