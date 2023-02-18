//
//  File.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 12.02.2023.
//

import UIKit

class PeopleCell: UICollectionViewCell {
    
    static let identifier = "PeopleCell"

    
    var modelText: Model? {
        didSet {
            titleLabel.text = modelText?.title
            numbersLabel.text = modelText?.number
            imageFirst.image = UIImage(named: modelText?.images[0] ?? "")
            imageSecond.image = UIImage(named: modelText?.images[1] ?? "")
            imageThird.image = UIImage(named: modelText?.images[2] ?? "")
            imageFourth.image = UIImage(named: modelText?.images[3] ?? "")
        }
    }
    
    var cellCornerRadius: Int? {
        didSet {
            imageFirst.layer.cornerRadius = CGFloat(cellCornerRadius ?? 0)
            imageSecond.layer.cornerRadius = CGFloat(cellCornerRadius ?? 0)
            imageThird.layer.cornerRadius = CGFloat(cellCornerRadius ?? 0)
            imageFourth.layer.cornerRadius = CGFloat(cellCornerRadius ?? 0)
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
    
    private lazy var imagesStack: UIStackView = {
      let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution  = UIStackView.Distribution.equalSpacing
        return stack
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    
    
    private let imageFirst: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    private let imageSecond: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    private let imageThird: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    private let imageFourth: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(mainStack)
        mainStack.addArrangedSubview(imagesStack)
        imagesStack.addSubview(imageFirst)
        imagesStack.addSubview(imageSecond)
        imagesStack.addSubview(imageThird)
        imagesStack.addSubview(imageFourth)
        mainStack.addArrangedSubview(titleLabel)
        mainStack.addArrangedSubview(numbersLabel)
      }
      
      private func setupLayout() {
          
          
          mainStack.snp.makeConstraints { make in
              make.width.equalTo(contentView.frame.width)
              make.height.equalTo(contentView.frame.height)
          }
          
          imagesStack.snp.makeConstraints { make in
              make.top.right.left.equalTo(mainStack)
              make.bottom.equalTo(-38)
          }
          
          let imgWidth = Int(contentView.frame.width / 2)
          let imgHeight = Int((contentView.frame.height - 38) / 2)
          
          print(imgWidth)
          
          imageFirst.snp.makeConstraints { make in
              make.left.equalTo(imagesStack)
              make.width.equalTo(imgWidth)
              make.height.equalTo(imgHeight)
          }
          
          imageSecond.snp.makeConstraints { make in
              make.right.equalTo(imagesStack)
              make.width.equalTo(imgWidth)
              make.height.equalTo(imgHeight)
          }
          
          imageThird.snp.makeConstraints { make in
              make.bottom.equalTo(imagesStack)
              make.left.equalTo(imagesStack)
              make.width.equalTo(imgWidth)
              make.height.equalTo(imgHeight)
          }
          
          imageFourth.snp.makeConstraints { make in
              make.bottom.equalTo(imagesStack)
              make.right.equalTo(imagesStack)
              make.width.equalTo(imgWidth)
              make.height.equalTo(imgHeight)
          }
      }
      
      override func prepareForReuse() {
          super.prepareForReuse()
          self.image.image = nil
      }
      
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

