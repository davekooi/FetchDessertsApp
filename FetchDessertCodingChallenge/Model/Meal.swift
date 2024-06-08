//
//  Meal.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import Foundation

struct Meal: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let imageUri: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUri = "strMealThumb"
    }
}

extension Meal {
    static let sample = Meal(id: UUID().uuidString,
                                name: "Apple & Blackberry Crumble",
                                imageUri: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
}

struct MealsResponse: Decodable {
    let meals: [Meal]
}
