//
//  DoctorView.swift
//  Pets
//
//  Created by Seven on 2022/8/5.
//

import UIKit
import Kingfisher

class DoctorView: UIView {
    
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
    
    private let doctor: Doctor
    
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
        label.text = doctor.name
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = doctor.title
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var skillLabel: UILabel = {
        let label = UILabel()
        label.text = doctor.skill
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.text = doctor.language
        label.numberOfLines = 2
        return label
    }()
    
    init(doctor: Doctor) {
        self.doctor = doctor
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
        
        let profileStackView = UIStackView(arrangedSubviews: [photoImageView, nameStackView])
        profileStackView.spacing = Constants.profileStackViewSpacing
        profileStackView.alignment = .center
        
        photoImageView.snp.makeConstraints {
            $0.top.greaterThanOrEqualToSuperview()
        }
        
        nameStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        let detailStackView = UIStackView(arrangedSubviews: [skillLabel, languageLabel])
        detailStackView.axis = .vertical
        detailStackView.spacing = Constants.detailStackViewSpacing
        
        let containerStackView = UIStackView(arrangedSubviews: [profileStackView, detailStackView])
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
        photoImageView.kf.setImage(with: doctor.imagUrl)
        nameLabel.text = doctor.name
        titleLabel.text = doctor.title
        skillLabel.text = doctor.skill
        languageLabel.text = doctor.language
    }
}
