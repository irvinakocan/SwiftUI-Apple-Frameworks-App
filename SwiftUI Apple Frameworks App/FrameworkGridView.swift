//
//  FrameworkGridView.swift
//  SwiftUI Apple Frameworks App
//
//  Created by Macbook Air 2017 on 4. 7. 2024..
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
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

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(
                    width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                // You have the ability to shrink,
                .scaledToFit()
                // but you only can shrink this much
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
