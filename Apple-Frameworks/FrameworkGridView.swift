//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by Denis DRAGAN on 9.10.2023.
//

import SwiftUI

struct FrameworkGridView: View {
    
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
                    // Get data in Framework.swift
                    ForEach(MockData.frameworks) { framework in
                        FrameworksView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
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
