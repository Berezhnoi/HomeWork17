//
//  PreviewCell.swift
//  Homework17
//
//  Created by rendi on 20.04.2024.
//

import UIKit

class PreviewCell: UITableViewCell {
    static let identifier = "PreviewCell"

    // UI Components
    let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add UI Components to contentView
        contentView.addSubview(previewImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(chevronImageView)
        
        // Constraints
         NSLayoutConstraint.activate([
             // Preview Image Constraints
             previewImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
             previewImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
             previewImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
             previewImageView.widthAnchor.constraint(equalTo: previewImageView.heightAnchor),
             
             // Title Label Constraints
             titleLabel.leadingAnchor.constraint(equalTo: previewImageView.trailingAnchor, constant: 10),
             titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             titleLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -10),
             
             // Chevron Image Constraints
             chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
             chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             chevronImageView.widthAnchor.constraint(equalToConstant: 20),
             chevronImageView.heightAnchor.constraint(equalToConstant: 20)
         ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
