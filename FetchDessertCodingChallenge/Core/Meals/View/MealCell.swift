//
//  DessertCell.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import SwiftUI

struct MealCell: View {
    let meal: Meal
    let imageDimension: CGFloat = 60
    
    var body: some View {
        LazyHStack(spacing: 16) {
            AsyncImage(url: URL(string: meal.imageUri)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageDimension, height: imageDimension)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: imageDimension, height: imageDimension)
            }
            Text(meal.name)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .frame(width: 200, alignment: .leading)
        }
    }
}

#Preview {
    MealCell(dessert: Meal.sample)
}
