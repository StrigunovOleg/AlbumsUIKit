//
//  PlacesCell.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 07.02.2023.
//
import UIKit

class PlacesCell: UICollectionViewCell {
    
    static let identifier = "PlacesCell"
    
    var modelText: Model? {
        didSet {
            titleLabel.text = modelText?.title
            numbersLabel.text = modelText?.number
            LastCoordinatesImg.image = UIImage(named: modelText?.image ?? "")
        }
    }
    
    //MARK: - Outlets
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var numbersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
      let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.distribution  = UIStackView.Distribution.equalSpacing
        return stack
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.image = UIImage(named: "kirkjufell")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var LastCoordinatesImg: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        
        addSubview(mainStack)
        mainStack.addArrangedSubview(image)
        mainStack.addArrangedSubview(titleLabel)
        mainStack.addArrangedSubview(numbersLabel)
        image.addSubview(LastCoordinatesImg)

      }
      
      private func setupLayout() {
          
          mainStack.snp.makeConstraints { make in
              make.width.equalTo(contentView.frame.width)
              make.height.equalTo(contentView.frame.height)
          }

          LastCoordinatesImg.snp.makeConstraints { make in
              make.width.equalTo(50)
              make.height.equalTo(50)
              make.centerX.equalTo(image)
              make.centerY.equalTo(image)
          }
          
    
      }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

