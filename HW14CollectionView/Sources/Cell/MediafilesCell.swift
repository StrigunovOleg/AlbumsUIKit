//
//  MediafilesCell.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 09.02.2023.
//


import UIKit

class MediafilesCell: UICollectionViewCell {
    
    static let identifier = "MediafilesCell"
    
    var modelText: Model? {
        didSet {
            titleLabel.text = modelText?.title
            numbersLabel.text = modelText?.number
            image.image = UIImage(systemName: modelText?.image ?? "")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
            rightIcon.image = UIImage(systemName: modelText?.addIcon.rawValue ?? "")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        }
    }
    
    //MARK: - Outlets
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var numbersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var arrowLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.text = " ❯ "
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
      let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.vertical
        //stack.backgroundColor = .green
        stack.distribution  = UIStackView.Distribution.equalSpacing
        return stack
    }()
    
    private lazy var subMainStack: UIStackView = {
      let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        //stack.backgroundColor = .green
        stack.distribution  = UIStackView.Distribution.equalSpacing
        return stack
    }()
    
    private lazy var rightStack: UIStackView = {
      let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        //stack.backgroundColor = .green
        stack.distribution  = UIStackView.Distribution.equalSpacing
        return stack
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private let rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    
    private let wrapperImage: UIView = {
         let mainView = UIView()
         return mainView
     }()
    
    private lazy var line: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray5
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(wrapperImage)
        wrapperImage.addSubview(image)
        addSubview(mainStack)
        mainStack.addSubview(subMainStack)
        mainStack.addSubview(line)
        subMainStack.addArrangedSubview(titleLabel)
        subMainStack.addArrangedSubview(rightStack)
        rightStack.addArrangedSubview(rightIcon)
        rightStack.addArrangedSubview(numbersLabel)
        rightStack.addArrangedSubview(arrowLabel)
      }
      
      private func setupLayout() {
          
          wrapperImage.snp.makeConstraints { make in
              make.left.equalTo(self.snp.left).offset(10)
              make.centerY.equalTo(self.snp.centerY)
              make.height.equalTo(38)
              make.width.equalTo(38)
          }

          image.snp.makeConstraints { make in
              make.centerY.equalTo(wrapperImage.snp.centerY)
              make.centerX.equalTo(wrapperImage.snp.centerX)
              make.height.equalTo(32)
              make.width.equalTo(32)
          }
          
          
          rightIcon.snp.makeConstraints { make in
              make.height.width.equalTo(16)
          }
          
          mainStack.snp.makeConstraints { make in
              make.left.equalTo(wrapperImage.snp.right).offset(5)
              make.top.right.bottom.equalTo(contentView)
          }
          
          line.snp.makeConstraints { make in
              make.bottom.equalTo(self)
              make.width.equalTo(self)
              make.height.equalTo(1)
          }
          
   
          subMainStack.snp.makeConstraints { make in
              make.top.right.bottom.left.equalTo(mainStack)
          }
          
          arrowLabel.snp.makeConstraints { make in
              make.width.equalTo(26)
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

