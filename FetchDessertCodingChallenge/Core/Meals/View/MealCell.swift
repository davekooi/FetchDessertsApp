//
//  DessertCell.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import SwiftUI

// Displays the meal image and name. Used for
// showing the meals in a list.
struct MealCell: View {
    let meal: Meal
    
    var body: some View {
        LazyHStack(spacing: 16) {
            SquareImageView(imageDimension: 60, urlString: meal.imageUri)
            Text(meal.name)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .frame(width: 200, alignment: .leading)
        }
    }
}

#Preview {
    MealCell(meal: Meal.sample)
}
