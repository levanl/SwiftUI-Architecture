//
//  APODPageView.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 04.01.24.
//

import SwiftUI

struct APODPageView: View {
    
    @EnvironmentObject var story: ApplicationStory
    
    var body: some View {
        VStack {
            if story.state.APODInfo.isEmpty {
                Button(action: {
                    story.dispatch(action: FetchAPODAction())
                }) {
                    Text("Get APOD")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding()
            }
            
            if let firstAPOD = story.state.APODInfo.first {
                Text("Title: \(firstAPOD.title)")
                    .padding()
                
                if let imageUrl = URL(string: firstAPOD.url) {
                    AsyncImage(url: imageUrl) { phase in
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
                        @unknown default:
                            fatalError()
                        }
                    }
                    .padding()
                }
            }
            
        }
    }
}

#Preview {
    APODPageView()
        .environmentObject(story)
}
