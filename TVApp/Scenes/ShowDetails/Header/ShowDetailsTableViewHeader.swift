//
//  ShowDetailsTableViewHeader.swift
//  TVApp
//
//  Created by Ivo Dutra on 15/03/22.
//

import UIKit

class ShowDetailsTableViewHeader: UIView {
    // MARK: - UI Elements
    
    private lazy var showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var tableViewTitle: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    // MARK: - Init
    
    init(details: ShowDetails) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 500))
        viewSetup()
        setup(with: details)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Public Function
    func setup(with details: ShowDetails) {
        showImageView.from(url: details.image, placeholder: UIImage(named: "imagePlaceholder"))
        print(details)
    }
}

// MARK: - ViewConfiguration
extension ShowDetailsTableViewHeader: ViewConfiguration {
    func setupHierarchy() {
        addSubviews([showImageView, tableViewTitle])
    }
    
    func setupConstraints() {
        showImageView
            .topToSuperview(4)
            .centerHorizontalToSuperView()
            .heightTo(200)
        
        tableViewTitle
            .topToBottom(of: showImageView)
            .bottomToSuperview(4)
            .leadingToSuperview(4)
    }
}
