//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Matthew Morrison on 04/08/2024.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    var favoriteRecipes: [Recipe] {
        recipes.filter { $0.isFavorite }
    }
    
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
    }
    
    func index(of recipe: Recipe) -> Int? {
        for i in recipes.indices {
            if recipes[i].id == recipe.id {
                return i
            }
        }
        return nil
    }
    
    // Saves recipes to document directory
    func saveRecipes() {
        do {
            let encodedData = try JSONEncoder().encode(recipes)
            try encodedData.write(to: recipeFilesURL)
        }
        catch {
            fatalError("An error occured while saving recipes: \(error)")
        }
    }
    
    // Loads saved recipes when the app re-launches
    func loadRecipes() {
        guard let data = try? Data(contentsOf: recipeFilesURL) else { return }
        do {
            let savedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
            recipes = savedRecipes
        }
        catch {
            fatalError("An error occured while loading recipes: \(error)")
        }
    }
    
    // Returns URL of where data is stored.
    private var recipeFilesURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
        } catch {
            fatalError("An error occured while getting the url: \(error)")
        }
    }
    
    
}
