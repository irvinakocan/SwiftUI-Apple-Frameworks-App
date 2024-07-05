//
//  FrameworkGridView.swift
//  SwiftUI Apple Frameworks App
//
//  Created by Macbook Air 2017 on 4. 7. 2024..
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks,
                            // We can remove id part because SwiftUI knows it through the data type
                            content: {
                        framework in
                        FrameworkTitleView(
                            framework: framework)
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                    })
                }
                .padding(.top, 20)
            }
            .navigationTitle("🍎 Frameworks")
            // fullScreenCover - for full screen coverage
            .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
            })
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 14")
    }
}
