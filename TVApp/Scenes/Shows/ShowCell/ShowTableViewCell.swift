//
//  ShowTableViewCell.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import UIKit

class ShowTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private lazy var showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
//            .topToSuperview(4)
//            .bottomToSuperview(4)
        
        titleLabel
            .leadingToTrailing(of: showImageView, margin: 16)
            .topToSuperview()
            .bottomToSuperview()
    }
}
