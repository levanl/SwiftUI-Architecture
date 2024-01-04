//
//  MainPageViewModel.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 02.01.24.
//

import SwiftUI
import NetworkingPackageGeneric

final class MainPageViewModel: ObservableObject {
    
    @Published var mediaData: [Item] = []
    @Published var sources: [Sources] = []
    @Published var innerHref: String = ""
    
    func getNasaData(query: String) {
        let url = "https://images-api.nasa.gov/search?q=\(query)&page_size=5"
        
        NetworkManager.fetchData(from: url, modelType: Nasa.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.mediaData = data.collection.items
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    
    
    
    
}
