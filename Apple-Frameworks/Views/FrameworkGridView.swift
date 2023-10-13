//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Denis DRAGAN on 9.10.2023.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
        var body: some View {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        // Fetch data from Framework.swift and loop through frameworks.
                        ForEach(MockData.frameworks) { framework in
                            // Display each framework using the FrameworksView.
                            NavigationLink(value: framework) {
                                FrameworkTitleView(framework: framework)
                            }
                        }
                    }
                }
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                FrameworkDetailView(framework: framework)
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}
