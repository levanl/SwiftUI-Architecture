//
//  ContentView.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 02.01.24.
//

import SwiftUI
import AVKit

struct MainPageView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: MainPageViewModel
    @SwiftUI.State private var searchText = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(searchText: $searchText, onSearch: {
                    viewModel.getNasaData(query: searchText)
                })
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 10) {
                        ForEach(viewModel.mediaData) { item in
                            VStack {
                                if item.data.first?.mediaType == "video" {
                                    VideoPlayer(player: AVPlayer(url: URL(string: item.href )!)) {
                                    }
                                    .scaledToFit()
                                }
                                Text(item.data.first?.title ?? "siba")
                                if let imageURLString = item.links.first(where: { $0.rel == "preview" })?.href,
                                   let imageURL = URL(string: imageURLString) {
                                    AsyncImage(url: imageURL) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.gray)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(width: 150, height: 100)
                                }
                                
                            }
                            .padding()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(searchText)
        }
    }
    
    
    
}

#Preview {
    MainPageView()
        .environmentObject(MainPageViewModel())
}







