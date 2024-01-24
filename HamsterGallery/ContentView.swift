//
//  ContentView.swift
//  HamsterGallery
//
//  Created by Ali alhasan on 2024-01-24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var images: [ImageResource] =
    [.hamster1, .hamster2 , .hamster3, .hamster4]
    
    private let columns = [GridItem(.flexible()), 
                           GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack (path: $path){
            ScrollView{
                LazyVGrid(columns:columns, content: {
                    ForEach(images, id: \.self){ image in
                        NavigationLink(value: image){
                            Image(image)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                })
            }
                .navigationTitle("Heros!")
                .navigationDestination(for: ImageResource.self) { image in
                    imagesDetail(image: image)
                    
                }
                .toolbar(content: {
                    Button(action: {
                       guard let randomHeros =
                        images.randomElement()  else {
                            return
                        }
                        path.append(randomHeros)
                    }, label: {
                        Label("Random", systemImage: "dice")
                        
                    })
                })
        }
    }
}

#Preview {
    ContentView()
}
