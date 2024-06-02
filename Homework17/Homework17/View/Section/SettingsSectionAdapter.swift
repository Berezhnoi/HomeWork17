//
//  SettingsSectionAdapter.swift
//  Homework17
//
//  Created by rendi on 20.04.2024.
//

import UIKit

protocol SettingsSectionAdapterOutput: AnyObject {
    func settingsItemsCount() -> Int
    func settingsItem(at indexPath: IndexPath) -> SettingsCellDisplayModel
}

class SettingsSectionAdapter {
    private weak var output: SettingsSectionAdapterOutput!
    
    required init(output: SettingsSectionAdapterOutput) {
        self.output = output
    }
}

// MARK: - SectionAdapterInput
extension SettingsSectionAdapter: SectionAdapterInput {
    func registerCells(in tableView: UITableView) {
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.settingsItemsCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as? SettingsCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let model = output.settingsItem(at: indexPath)
        cell.titleLabel.text = model.title
        cell.switchControl.isOn = model.isActive
        
        return cell
    }
    
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 50.0
    }
}

