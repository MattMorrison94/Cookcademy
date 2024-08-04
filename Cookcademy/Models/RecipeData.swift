//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Matthew Morrison on 04/08/2024.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
