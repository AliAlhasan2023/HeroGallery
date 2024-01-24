//
//  imagesDetail.swift
//  HamsterGallery
//
//  Created by Ali alhasan on 2024-01-24.
//

import SwiftUI

struct imagesDetail: View {
    let image : ImageResource
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        imagesDetail(image: .hamster2)
    }
}
