//
//  ShowTableViewCell.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import UIKit

class ShowTableViewCell: UITableViewCell {
    // MARK: - Properties
    var show: Show?
    
    // MARK: - UI Elements
    
    private lazy var showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewSetup()
    }

    required init?(coder: NSCoder) { nil }
    
    // MARK: - Public Function
    func setup(title: String, imagePath: String) {
        titleLabel.text = title
        // Improvement: This asset image could be in an script generated file, e.g. using SwiftGen
        showImageView.from(url: imagePath, placeholder: UIImage(named: "imagePlaceholder"))
    }
}

// MARK: - ViewConfiguration
extension ShowTableViewCell: ViewConfiguration {
    func setupHierarchy() {
        addSubviews([showImageView, titleLabel])
    }
    
    func setupConstraints() {
        showImageView
            .leadingToSuperview(8)
            .aspectRatio()
            .heightTo(200)
            .topToSuperview(4)
            .bottomToSuperview(4)
        
        titleLabel
            .leadingToTrailing(of: showImageView, margin: 8)
            .trailingToSuperview()
            .centerVerticalToSuperView()
    }
}
