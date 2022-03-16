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
    
    lazy var genreLabel: UILabel = .init()
    
    lazy var scheduleTitle: UILabel = {
        let label = UILabel()
        label.text = "Schedule"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var scheduleLabel: UILabel = .init()
    
    lazy var summaryTitle: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var summaryLabel: UILabel = .init()
    
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
        let leadingSpacing: CGFloat = 4
        let verticalSpacing: CGFloat = 8
        
        showImageView
            .topToSuperview(4)
            .centerHorizontalToSuperView()
            .heightTo(200)
        
        genreTitle
            .topToBottom(of: showImageView, margin: verticalSpacing)
            .leadingToSuperview(leadingSpacing)
        
        genreLabel
            .topToBottom(of: genreTitle, margin: verticalSpacing)
            .horizontalToSuperview()
        
        scheduleTitle
            .topToBottom(of: genreLabel, margin: verticalSpacing)
            .leadingToSuperview(leadingSpacing)
        
        scheduleLabel
            .topToBottom(of: scheduleTitle, margin: verticalSpacing)
            .horizontalToSuperview()
        
        summaryTitle
            .topToBottom(of: scheduleLabel, margin: verticalSpacing)
            .leadingToSuperview(leadingSpacing)
        
        summaryLabel
            .topToBottom(of: summaryTitle, margin: verticalSpacing)
            .horizontalToSuperview()
        
        tableViewTitle
            .topToBottom(of: summaryLabel, margin: verticalSpacing)
            .bottomToSuperview()
            .leadingToSuperview(leadingSpacing)
    }
}
