//
//  MealDetailsView.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import SwiftUI

// Display the meal recipe with name, image,
// ingredients, and instructions.
struct MealDetailsView: View {
    let mealId: String
    @StateObject var viewModel = MealDetailsViewModel()
    
    var body: some View {
        Group {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else if let mealDetails = viewModel.mealDetails {
                ScrollView {
                    VStack {
                        Text(mealDetails.name)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        SquareImageView(imageDimension: 300, urlString: mealDetails.imageUri)
                        Text("What you need")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                        ForEach(mealDetails.ingredients, id: \.self) { ingredient in
                            Text("\u{2022} \(ingredient.measure) \(ingredient.name)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                        }
                        Divider()
                        Text("Instructions")
                            .padding(.vertical)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text(mealDetails.instructions)
                            .padding(.horizontal)
                        
                    }
                }
            } else {
                ProgressView()
                    .onAppear {
                        Task {
                            try await viewModel.fetchMealDetails(mealId: mealId)
                        }
                    }
            }
        }
        
            
    }
}

#Preview {
    MealDetailsView(mealId: "53049")
}
