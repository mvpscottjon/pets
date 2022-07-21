//
//  PhotoAndTitleInfoView.swift
//  Pets
//
//  Created by Seven on 2022/7/19.
//

import UIKit
import Kingfisher

class PhotoAndTitleInfoView: UIView {

    private enum Constants {
        static let stackViewSpacing = 7.0
        static let titleStackViewSpacing = 5.0
        static let imageBackgroundColor = UIColor.lightGray
        static let imageSize = CGSize(width: 30.0, height: 30.0)
        static let titleFont = UIFont.boldSystemFont(ofSize: 17.0)
        static let subtitleFont = UIFont.systemFont(ofSize: 10.0)
    }
    
    // MARK: - Properties
    
    private let info: PhotoAndTitleInfo
    
    // MARK: - Views
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Constants.imageBackgroundColor
        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true

        imageView.snp.makeConstraints {
            $0.size.equalTo(Constants.imageSize)
        }
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.titleFont
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.subtitleFont
        return label
    }()
    
    init(photoAndTitleInfo info: PhotoAndTitleInfo) {
        self.info = info
        super.init(frame: .zero)
        
        setupViews()
        updateUI()
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError("init?(coder: NSCoder) should not be implement")
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) should not be implement")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
    }
    
    // MARK: - Setups
    
    private func setupViews() {
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        titleStackView.axis = .vertical
        titleStackView.spacing = Constants.titleStackViewSpacing
        
        let stackView = UIStackView(arrangedSubviews: [photoImageView, titleStackView])
        stackView.spacing = Constants.stackViewSpacing
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func updateUI() {
        titleLabel.text = info.title
        subtitleLabel.text = info.subtitle
        photoImageView.image = info.image
    }
}
