//
//  GeneralHeader.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 18.02.2023.
//

import UIKit

class GeneralHeader: UICollectionReusableView {
    
    static let identifier = "generalHeader"
    
    // MARK: - Outlets
    
    private lazy var line: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray5
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
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
        addSubview(line)
        addSubview(title)
    }
    
    private func setupLayout() {
        
        line.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
        
        title.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}

