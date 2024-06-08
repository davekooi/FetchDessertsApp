//
//  DessertsView.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import SwiftUI

struct MealsView: View {
    @StateObject var viewModel = MealsViewModel()
    let imageDimension: CGFloat = 60
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.meals) { meal in
                    NavigationLink(value: meal) {
                        DessertCell(meal: meal)
                    }
                }
            }
            .navigationTitle("Desserts")
            .navigationDestination(for: Meal.self) { meal in
                Text(meal.name)
            }
            
        }
    }
}

#Preview {
    MealsView()
}
