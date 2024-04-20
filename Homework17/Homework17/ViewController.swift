//
//  ViewController.swift
//  Homework17
//
//  Created by rendi on 20.04.2024.
//

import UIKit

class ViewController: UIViewController {

    private var tableView: UITableView!
    
    private var tableViewAdapter: TableViewAdapterInput!
    
    private var dataLoader: DataLoader = DataLoader()
    
    private var settingsCellDisplayModels: [SettingsCellDisplayModel] = []
    private var previewCellDisplayModels: [PreviewCellDisplayModel] = []
    private var productCellDisplayModels: [ProductCellDisplayModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 10
        view.addSubview(tableView)
        
        loadTableViewData()
        setupTableViewAdapter()
    }
    
    private func loadTableViewData() {
        settingsCellDisplayModels = dataLoader.getSettingsData()
        previewCellDisplayModels = dataLoader.getPreviewData()
        productCellDisplayModels = dataLoader.getProductData()
    }
    
    private func setupTableViewAdapter() {
        let adapter = TableViewAdapter()
        adapter.sections = [
            PreviewSectionAdapter(output: self),
            SettingsSectionAdapter(output: self),
            ProductSectionAdapter(output: self)
        ]
        tableViewAdapter = adapter
        tableViewAdapter.setup(with: tableView)
    }
}

// MARK: - PreviewSectionAdapterOutput
extension ViewController: PreviewSectionAdapterOutput {
    func previewItemsCount() -> Int {
        return previewCellDisplayModels.count
    }
    
    func previewItem(at indexPath: IndexPath) -> PreviewCellDisplayModel {
        return previewCellDisplayModels[indexPath.row]
    }
}

// MARK: - SettingsSectionAdapterOutput
extension ViewController: SettingsSectionAdapterOutput {
    func settingsItemsCount() -> Int {
        return settingsCellDisplayModels.count
    }
    
    func settingsItem(at indexPath: IndexPath) -> SettingsCellDisplayModel {
        return settingsCellDisplayModels[indexPath.row]
    }
}

// MARK: - ProductSectionAdapterOutput
extension ViewController: ProductSectionAdapterOutput {
    func productItemsCount() -> Int {
        return productCellDisplayModels.count
    }
    
    func productItem(at indexPath: IndexPath) -> ProductCellDisplayModel {
        return productCellDisplayModels[indexPath.row]
    }
}
