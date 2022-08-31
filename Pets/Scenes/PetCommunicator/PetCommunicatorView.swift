//
//  PetCommunicatorView.swift
//  Pets
//
//  Created by Seven on 2022/8/5.
//

import UIKit

class PetCommunicatorView: UIView {
    
    private enum Constants {
        static let imageSize = CGSize(size: 30.0)
        static let containerStackViewBackgroundColor = UIColor.white
        static let containerStackViewInsets = UIEdgeInsets(horizontalInsets: 0.0, verticalInsets: 2.0)
        static let containerStackViewRadius = 5.0
        static let profileStackViewSpacing = 10.0
        static let detailStackViewSpacing = 5.0
        static let detailStackViewBottomSpacing = 15.0
        static let containerStackViewMarginInsets = UIEdgeInsets(horizontalInsets: 10.0, verticalInsets: 7.0)
    }
    
    private let communicator: Communicator
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.imageSize.width / 2
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(Constants.imageSize)
        }
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = communicator.name
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = communicator.title
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var chargeLabel: UILabel = {
        let label = UILabel()
        label.text = communicator.charge
        label.numberOfLines = 2
        return label
    }()
    
    init(wisperer: Communicator) {
        self.communicator = wisperer
        super.init(frame: .zero)
        
        setupViews()
        updateUI()
    }
    
    @available(*, unavailable)
    init() {
        fatalError("init() has not been implemented")
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let nameStackView = UIStackView(arrangedSubviews: [nameLabel, titleLabel])
        nameStackView.axis = .vertical
        
        let profileStackView = UIStackView(arrangedSubviews: [photoImageView, nameStackView, UIView()])
        profileStackView.spacing = Constants.profileStackViewSpacing
        profileStackView.alignment = .center
        
        photoImageView.snp.makeConstraints {
            $0.top.greaterThanOrEqualToSuperview()
        }
        
        nameStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        let containerStackView = UIStackView(arrangedSubviews: [profileStackView, chargeLabel])
        containerStackView.axis = .vertical
        containerStackView.backgroundColor = Constants.containerStackViewBackgroundColor
        containerStackView.layer.cornerRadius = Constants.containerStackViewRadius
        containerStackView.layoutMargins = Constants.containerStackViewMarginInsets
        containerStackView.isLayoutMarginsRelativeArrangement = true
        
        addSubview(containerStackView)
        containerStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Constants.containerStackViewInsets)
        }
        
        containerStackView.setCustomSpacing(Constants.detailStackViewBottomSpacing, after: profileStackView)
    }
    
    private func updateUI() {
        photoImageView.kf.setImage(with: communicator.imageUrl)
        nameLabel.text = communicator.name
        titleLabel.text = communicator.title
        chargeLabel.text = communicator.charge
    }
}
