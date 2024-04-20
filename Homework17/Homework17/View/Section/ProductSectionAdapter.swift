//
//  ProductSectionAdapter.swift
//  Homework17
//
//  Created by rendi on 20.04.2024.
//

import UIKit

protocol ProductSectionAdapterOutput: AnyObject {
    func productItemsCount() -> Int
    func productItem(at indexPath: IndexPath) -> ProductCellDisplayModel
}

class ProductSectionAdapter {
    private weak var output: ProductSectionAdapterOutput!
    
    required init(output: ProductSectionAdapterOutput) {
        self.output = output
    }
}

// MARK: - SectionAdapterInput
extension ProductSectionAdapter: SectionAdapterInput {
    func registerCells(in tableView: UITableView) {
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.productItemsCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.productItem(at: indexPath)
        cell.titleLabel.text = model.title
        cell.descriptionLabel.text = model.description
        cell.productImageView.image = model.image

        return cell
    }
    
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 70.0
    }
}
