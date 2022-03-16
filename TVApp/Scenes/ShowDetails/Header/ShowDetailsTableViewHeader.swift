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
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var genreTitle: UILabel = {
        let label = UILabel()
        label.text = "Genres"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
        
    lazy var scheduleTitle: UILabel = {
        let label = UILabel()
        label.text = "Schedule"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var scheduleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var summaryTitle: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tableViewTitle: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    // MARK: - Init
    
    init(details: ShowDetails) {
        super.init(frame: .zero)
        viewSetup()
        setup(with: details)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Public Function
    func setup(with details: ShowDetails) {
        showImageView.from(url: details.image, placeholder: UIImage(named: "imagePlaceholder"))
        genreLabel.text = details.genres.joined(separator: ", ")
        scheduleLabel.text = details.days.joined(separator: ", ") // FIXME: aqui
        summaryLabel.text = details.summary
    }
}

// MARK: - ViewConfiguration
extension ShowDetailsTableViewHeader: ViewConfiguration {
    func setupHierarchy() {
        addSubviews([showImageView,
                     genreTitle,
                     genreLabel,
                     scheduleTitle,
                     scheduleLabel,
                     summaryTitle,
                     summaryLabel,
                     tableViewTitle])
    }
    
    func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        let leadingSpacing: CGFloat = 12
        let verticalSpacing: CGFloat = 8
        let verticalPlusSpacing: CGFloat = 16
        
        showImageView
            .topToSuperview(4)
            .centerHorizontalToSuperView()
            .heightTo(200)
        
        genreTitle
            .topToBottom(of: showImageView, margin: verticalPlusSpacing)
            .leadingToSuperview(leadingSpacing)
        
        genreLabel
            .topToBottom(of: genreTitle, margin: verticalSpacing)
            .horizontalToSuperview(leadingSpacing)
        
        scheduleTitle
            .topToBottom(of: genreLabel, margin: verticalPlusSpacing)
            .leadingToSuperview(leadingSpacing)
        
        scheduleLabel
            .topToBottom(of: scheduleTitle, margin: verticalSpacing)
            .horizontalToSuperview(leadingSpacing)
        
        summaryTitle
            .topToBottom(of: scheduleLabel, margin: verticalPlusSpacing)
            .leadingToSuperview(leadingSpacing)
        
        summaryLabel
            .topToBottom(of: summaryTitle, margin: verticalSpacing)
            .horizontalToSuperview(leadingSpacing)
        
        tableViewTitle
            .topToBottom(of: summaryLabel, margin: verticalPlusSpacing)
            .leadingToSuperview(leadingSpacing)
            .bottomToSuperview()
    }
}
