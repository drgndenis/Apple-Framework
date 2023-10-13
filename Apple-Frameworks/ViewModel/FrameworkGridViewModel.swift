//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Denis DRAGAN on 11.10.2023.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    // There are 3 different data information in each column
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
}
