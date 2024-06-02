//
//  PreviewSectionAdapter.swift
//  Homework17
//
//  Created by rendi on 20.04.2024.
//

import UIKit

protocol PreviewSectionAdapterOutput: AnyObject {
    func previewItemsCount() -> Int
    func previewItem(at indexPath: IndexPath) -> PreviewCellDisplayModel
}

class PreviewSectionAdapter {
    private weak var output: PreviewSectionAdapterOutput!
    
    required init(output: PreviewSectionAdapterOutput) {
        self.output = output
    }
}

// MARK: - SectionAdapterInput
extension PreviewSectionAdapter: SectionAdapterInput {
    func registerCells(in tableView: UITableView) {
        tableView.register(PreviewCell.self, forCellReuseIdentifier: PreviewCell.identifier)
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.previewItemsCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PreviewCell.identifier, for: indexPath) as? PreviewCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.previewItem(at: indexPath)
        cell.titleLabel.text = model.title
        cell.previewImageView.image = model.image
        cell.chevronImageView.image = model.chevronImage
        
        return cell
    }
    
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 60.0
    }
}


