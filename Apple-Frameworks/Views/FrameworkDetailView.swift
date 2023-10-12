//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Denis DRAGAN on 11.10.2023.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @Binding var isShowingDetailView : Bool
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                
                // Close button
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(uiColor: .label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
                .padding()
            }
            
            Spacer()
            
            // Framework Detail
            FrameworksView(framework: framework)
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
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
}
