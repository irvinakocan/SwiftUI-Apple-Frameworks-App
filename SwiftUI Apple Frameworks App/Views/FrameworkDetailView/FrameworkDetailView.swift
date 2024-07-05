//
//  FrameworkDetailView.swift
//  SwiftUI Apple Frameworks App
//
//  Created by Macbook Air 2017 on 5. 7. 2024..
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @Binding var isShowingDetailView: Bool
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            XDismissButton(isShowingDetailView: $isShowingSafariView)
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "More Details")
            }
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            if let url = URL(string: framework.urlString) {
                SafariView(url: url)
            }
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .previewDevice("iPhone 14")
            .preferredColorScheme(.dark)
    }
}
