//
//  MainHederCell.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 12.02.2023.
//


import UIKit

class MainHederCell: UICollectionReusableView {
    
    static let identifier = "MainHederCell"
    
    // MARK: - Outlets
    
    private lazy var line: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray5
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
    lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Альбомы"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var buttonAll: UIButton = {
        let button = UIButton()
        button.setTitle("Все", for: .normal)
        //тень к кнопке
        button.tintColor = .systemBlue
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(mainTitle)
        addSubview(line)
        addSubview(title)
        addSubview(buttonAll)
    }
    
    private func setupLayout() {
        
        mainTitle.snp.makeConstraints { make in
            make.left.equalTo(self)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(10)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
        
        title.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        
        buttonAll.snp.makeConstraints { make in
                   make.bottom.equalTo(self)
                   make.right.equalTo(self)
               }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}


