//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Denis DRAGAN on 9.10.2023.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    // There are 3 different data information in each column
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
        var body: some View {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        // Fetch data from Framework.swift and loop through frameworks.
                        ForEach(MockData.frameworks) { framework in
                            // Display each framework using the FrameworksView.
                            FrameworksView(framework: framework)
                                .onTapGesture {
                                    // Set the selectedFramework property in the view model when a framework is tapped.
                                    viewModel.selectedFramework = framework
                                }
                        }
                    }
                }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                /*
                 If viewModel.isShowingDetailView is true, the FrameworkDetailView screen is presented.
                 If viewModel.isShowingDetailView is false, this page is dismissed.
                 */
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView
                )
            }
        }
    }
}

#Preview {
    FrameworkGridView()
}

struct FrameworksView: View {
    
    let framework: Framework
    
    var body: some View {
        
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title3)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
