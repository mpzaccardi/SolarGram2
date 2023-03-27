//
//  SquareImage.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//

import SwiftUI

struct SquareImage: View {
    
    var image: Image
    
    init(_ image: Image) {
        self.image = image
    }
    
    var body: some View {
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                image
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
        
        // MARK: other approach with ZStack shown for demonstration
        //        ZStack {
        //            Rectangle()
        //                .aspectRatio(1, contentMode: .fit)
        //
        //            image
        //                .resizable()
        //                .scaledToFill()
        //                .layoutPriority(-1)
        //        }
        //        .clipped()
    }
}

struct SquareImage_Previews: PreviewProvider {
    static var previews: some View {
        SquareImage(Image("joe"))
    }
}
