//
//  SquareImageView.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import SwiftUI

// An image component with a height and width of
// 'imageDimension' displaying the source image from 'urlString'.
struct SquareImageView: View {
    let imageDimension: CGFloat
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageDimension, height: imageDimension)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: imageDimension, height: imageDimension)
        }
    }
}

#Preview {
    SquareImageView(imageDimension: 200, urlString: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
}
