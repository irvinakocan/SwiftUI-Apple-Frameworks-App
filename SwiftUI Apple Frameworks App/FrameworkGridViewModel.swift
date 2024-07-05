//
//  FrameworkGridViewModel.swift
//  SwiftUI Apple Frameworks App
//
//  Created by Macbook Air 2017 on 5. 7. 2024..
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
}
