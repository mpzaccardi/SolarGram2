//
//  ContentView.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State private var selection: Tab = .photos
    
    enum Tab {
           case photos
           case profile
       }
    
    var body: some View {
        TabView(selection: $selection) {
            PhotoList()
                .tabItem {
                    Label("Photos", systemImage: "photo.stack")
                }
                .tag(Tab.photos)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(Tab.profile)
            
        }.environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
