//
//  EpisodeDetailsViewController.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/03/22.
//

import UIKit
import ChainedConstraints

protocol EpisodeDetailsViewControllerProtocol: AnyObject {
    func display(episode: EpisodeDetails)
}

final class EpisodeDetailsViewController: UIViewController {
    // MARK: - Properties
    
    var viewModel: EpisodeDetailsViewModelProtocol?
    private lazy var tableViewDataSource: ShowDetailsDataSource = .init()
    
    // MARK: - UI Elements
    
    private lazy var scrollView: UIScrollView = .init()
    
    private lazy var contentView: UIView = .init()
    
    private lazy var showImageView: ImageView = .init(frame: .zero)
    
    lazy var seasonTitle: UILabel = {
        let label = UILabel()
        label.text = "Season"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var seasonLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var numberTitle: UILabel = {
        let label = UILabel()
        label.text = "Number"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var numberLabel: UILabel = {
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
    }
}

// MARK: - ViewConfiguration
extension EpisodeDetailsViewController: ViewConfiguration {
    func setupHierarchy() {
        view.addSubviews([scrollView])
        scrollView.addSubviews([contentView])
        contentView.addSubviews([showImageView,
                                 seasonTitle,
                                 seasonLabel,
                                 numberTitle,
                                 numberLabel,
                                 summaryTitle,
                                 summaryLabel])
    }
    
    func setupConstraints() {
        let leadingSpacing: CGFloat = 12
        let verticalSpacing: CGFloat = 8
        let verticalTitleSpacing: CGFloat = 16
        
        scrollView
            .edgesToSuperView(toSafeArea: true)
        
        contentView
            .edgesToSuperView()
            .widthOf(view)
        
        showImageView
            .topToSuperview(4, toSafeArea: true)
            .centerHorizontalToSuperView()
            .heightTo(300)
        
        seasonTitle
            .topToBottom(of: showImageView, margin: verticalTitleSpacing)
            .centerHorizontalToSuperView(multiplier: 0.5)
        
        seasonLabel
            .topToBottom(of: seasonTitle, margin: verticalSpacing)
            .centerHorizontal(to: seasonTitle)
        
        numberTitle
            .topToTop(of: seasonTitle)
            .centerHorizontalToSuperView(multiplier: 1.5)
        
        numberLabel
            .topToBottom(of: numberTitle, margin: verticalSpacing)
            .centerHorizontal(to: numberTitle)
        
        summaryTitle
            .topToBottom(of: numberLabel, margin: verticalTitleSpacing)
            .leadingToSuperview(leadingSpacing)
        
        summaryLabel
            .topToBottom(of: summaryTitle, margin: verticalSpacing)
            .horizontalToSuperview(leadingSpacing)
            .bottomToSuperview(verticalTitleSpacing)
    }
}

// MARK: - ShowDetailsDisplaying
extension EpisodeDetailsViewController: EpisodeDetailsViewControllerProtocol {
    func display(episode: EpisodeDetails) {
        title = episode.name
        showImageView.from(url: episode.image, placeholder: UIImage(named: "imagePlaceholder"))
        seasonLabel.text = episode.number
        numberLabel.text = episode.season
        summaryLabel.attributedText = episode.summary
    }
}
