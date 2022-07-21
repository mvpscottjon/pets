//
//  NewsFeedTableCell.swift
//  Pets
//
//  Created by Seven on 2022/7/19.
//

import UIKit

class NewsFeedTableCell: UITableViewCell {
    
    private enum Constants {
        static let cardViewInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        static let cardViewBorderColor = UIColor.black.cgColor
        static let cardViewBorderWidth = 2.0
        static let cardViewRadius = 5.0

        static let stackViewInsets = UIEdgeInsets(top: 5.0, left: 0.0, bottom: 5.0, right: 0.0)
        static let stackViewMarginInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)

        static let spacing = 10.0
        static let imageSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 3 / 4)
    }
    
    // MARK: - Views
        
    private lazy var cardView: UIView = {
        let view = UIView()
        view.layer.borderColor = Constants.cardViewBorderColor
        view.layer.borderWidth = Constants.cardViewBorderWidth
        view.layer.cornerRadius = Constants.cardViewRadius
        
        return view
    }()
    
    private lazy var articleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(Constants.imageSize)
        }
        
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        updateUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) should not be implement")
    }
    
    @available(*, unavailable)
    init() {
        fatalError("init() should not be implement")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        cardView.backgroundColor = isSelected ? .mainColor : .white
    }
    
    private func setupViews() {
        selectionStyle = .none

        contentView.addSubview(cardView)
        cardView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.cardViewInsets)
        }
        
        let mockInfo = PhotoAndTitleInfo(
            image: UIImage(systemName: "person.fill"),
            title: "TITLE", subtitle: "SUBTITLE"
        )
        
        let infoView = PhotoAndTitleInfoView(photoAndTitleInfo: mockInfo)
        
        let stackView = UIStackView(arrangedSubviews: [infoView, articleLabel, contentImageView])
        stackView.axis = .vertical
        stackView.spacing = Constants.spacing
        stackView.layoutMargins = Constants.stackViewMarginInsets
        stackView.isLayoutMarginsRelativeArrangement = true
        
        cardView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.stackViewInsets)
        }
    }
    
    private func updateUI() {
        articleLabel.text = "TEST ARTICLE"
        contentImageView.image = UIImage(systemName: "tornado")
    }
}
