//
//  AFButton.swift
//  SwiftUI Apple Frameworks App
//
//  Created by Macbook Air 2017 on 5. 7. 2024..
//

import SwiftUI

struct AFButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "Test title")
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 14")
    }
}
