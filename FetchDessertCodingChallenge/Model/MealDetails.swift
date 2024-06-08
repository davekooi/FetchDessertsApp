//
//  MealDetails.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import Foundation

struct MealDetails: Decodable {
    let id: String
    let name: String
    let imageUri: String
    let instructions: String
    let ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions, strMealThumb
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    struct Ingredient: Codable, Hashable {
        let name: String
        let measure: String
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .idMeal)
        name = try container.decode(String.self, forKey: .strMeal)
        imageUri = try container.decode(String.self, forKey: .strMealThumb)
        instructions = try container.decode(String.self, forKey: .strInstructions)
        
        var ingredients = [Ingredient]()
        
        for index in 1...20 {
            let ingredientKey = CodingKeys(rawValue: "strIngredient\(index)")!
            let measureKey = CodingKeys(rawValue: "strMeasure\(index)")!
            
            if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey), !ingredient.isEmpty,
               let measure = try container.decodeIfPresent(String.self, forKey: measureKey), !measure.isEmpty {
                ingredients.append(Ingredient(name: ingredient, measure: measure))
            }
        }
        
        self.ingredients = ingredients
    }
}

struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]
}

