//
//  AlbumsCell.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 29.01.2023.
//

import UIKit

class AlbumsCell: UICollectionViewCell {
    
    static let identifier = "AlbumsCell"
    
    var modelText: Model? {
        didSet {
            image.image = UIImage(named: modelText?.image ?? "")
            titleLabel.text = modelText?.title
            numbersLabel.text = modelText?.number
            iconImage.image = UIImage(systemName: modelText?.addIcon.rawValue ?? "")?.withTintColor(.white, renderingMode: .alwaysOriginal)
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
        stack.alignment = .top
        stack.distribution  = UIStackView.Distribution.equalSpacing
        return stack
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
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
        image.addSubview(iconImage)
        mainStack.addArrangedSubview(titleLabel)
        mainStack.addArrangedSubview(numbersLabel)

      }
      
      private func setupLayout() {
          
          mainStack.snp.makeConstraints { make in
              make.width.equalTo(contentView.frame.width)
              make.height.equalTo(contentView.frame.height)
              //make.left.top.right.bottom.equalTo(contentView)
          }
          
          iconImage.snp.makeConstraints { make in
              make.left.equalTo(image).offset(10)
              make.bottom.equalTo(image).offset(-10)
              make.height.width.equalTo(24)
          }
          
          titleLabel.snp.makeConstraints { make in
              make.left.right.equalTo(mainStack)
          }
          
          numbersLabel.snp.makeConstraints { make in
              make.left.right.equalTo(mainStack)
          }
   }
      
      override func prepareForReuse() {
          super.prepareForReuse()
          self.image.image = nil
          self.titleLabel.text = nil
          self.numbersLabel.text = nil
      }
      
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
