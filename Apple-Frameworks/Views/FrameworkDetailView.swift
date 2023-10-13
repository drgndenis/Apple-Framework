//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Denis DRAGAN on 11.10.2023.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack() {
            
            // Framework Detail
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            // Learn More Button
            Button() {
                // Action to be taken when "Learn More" button is clicked
                openURL((URL(string: framework.urlString) ?? URL(string: "https://www.apple.com"))!)
            } label: {
                AFButton(title: "Learn More")
            }
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}

