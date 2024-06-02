//
//  DataLoader.swift
//  Homework17
//
//  Created by rendi on 20.04.2024.
//

import UIKit

class DataLoader {
    func getPreviewData() -> [PreviewCellDisplayModel] {
        var models: [PreviewCellDisplayModel] = []
        
        let titles = ["Preview 1", "Preview 2", "Preview 3"]
        
        let chevronImage = UIImage(systemName: "chevron.right")!
        
        for title in titles {
            let systemImageName = "photo"
            guard let image = UIImage(systemName: systemImageName) else {
                fatalError("System image named \(systemImageName) not found")
            }
            let model = PreviewCellDisplayModel(image: image, title: title, chevronImage: chevronImage)
            models.append(model)
        }
        
        return models
    }

    func getSettingsData() -> [SettingsCellDisplayModel] {
        var models: [SettingsCellDisplayModel] = []
        
        for i in 0...4 {
            let newModel: SettingsCellDisplayModel = SettingsCellDisplayModel(
                title: "Settings \(i + 1)",
                isActive: i % 2 == 0
            )
            models.append(newModel)
        }
        
        return models
    }
    
    func getProductData() -> [ProductCellDisplayModel] {
        var models: [ProductCellDisplayModel] = []
        
        for i in 1...5 {
            let image = UIImage(systemName: "photo")!
            let title = "Product \(i)"
            let description = "Description for Product \(i)"
            let model = ProductCellDisplayModel(image: image, title: title, description: description)
            models.append(model)
        }
        
        return models
    }
}
