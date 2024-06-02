//
//  ProductCell.swift
//  Homework17
//
//  Created by rendi on 20.04.2024.
//

import UIKit

class ProductCell: UITableViewCell {
    static let identifier = "ProductCell"

    // UI Components
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy", for: .normal)
        
        // Set styles for the button
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.link
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add UI Components to contentView
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buyButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Product Image Constraints
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor),
            
            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -15),
            
            // Description Label Constraints
            descriptionLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -15),
            
            // Buy Button Constraints
            buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            buyButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

