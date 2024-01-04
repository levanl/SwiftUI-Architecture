//
//  SwiftUI_ArchitectureApp.swift
//  SwiftUI-Architecture
//
//  Created by Levan Loladze on 02.01.24.
//

import SwiftUI

@main
struct SwiftUI_ArchitectureApp: App {
    // MARK: - Properties
    @StateObject private var viewModel = MainPageViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            MainPageView()
                .environmentObject(viewModel)
        }
    }
}
