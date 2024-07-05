//
//  FrameworkTitleView.swift
//  SwiftUI Apple Frameworks App
//
//  Created by Macbook Air 2017 on 5. 7. 2024..
//

import SwiftUI

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

struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
