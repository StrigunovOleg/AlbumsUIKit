//
//  ViewController.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 29.01.2023.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    let modelData: [[Model]] = [
        [
            Model(title: "Недавние", image: "img1", number: "103", addIcon: .none, cellType: .none, images: []),
            Model(title: "Избранное", image: "img03", number: "273", addIcon: .heart, cellType: .none, images: []),
            Model(title: "VSCO", image: "img01", number: "112", addIcon: .none, cellType: .none, images: []),
            Model(title: "Snapseed", image: "img02", number: "13", addIcon: .none, cellType: .none, images: []),
            Model(title: "Layout", image: "img04", number: "2", addIcon: .none, cellType: .none, images: [])
        ],
        [
            Model(title: "Люди", image: "img1", number: "103", addIcon: .none, cellType: .people, images: datalPeopleImg),
            Model(title: "Места", image: "mountan", number: "273", addIcon: .none, cellType: .map, images: [])
        ],
        [
            Model(title: "Видео", image: "video", number: "103", addIcon: .none, cellType: .none, images: []),
            Model(title: "Селфи", image: "person.crop.square", number: "33", addIcon: .none, cellType: .none, images: []),
            Model(title: "Фото Live Photos", image: "livephoto", number: "43", addIcon: .none, cellType: .none, images: []),
            Model(title: "Портреты", image: "cube", number: "443", addIcon: .none, cellType: .none, images: []),
            Model(title: "Длинная выдержка", image: "livephoto", number: "76", addIcon: .none, cellType: .none, images: []),
            Model(title: "Панорамы", image: "pano", number: "34", addIcon: .none, cellType: .none, images: []),
            Model(title: "Таймлапс", image: "timelapse", number: "1", addIcon: .none, cellType: .none, images: []),
            Model(title: "Замедленно", image: "slowmo", number: "99", addIcon: .none, cellType: .none, images: []),
            Model(title: "Киноэффект", image: "camera.metering.center.weighted", number: "7", addIcon: .none, cellType: .none, images: []),
            Model(title: "Серии", image: "square.3.layers.3d.down.right", number: "222", addIcon: .none, cellType: .none, images: []),
            Model(title: "Снимки экрана", image: "camera.viewfinder", number: "999", addIcon: .none, cellType: .none, images: []),
            Model(title: "Записи экрана", image: "record.circle", number: "44", addIcon: .none, cellType: .none, images: []),
            Model(title: "Анимированные", image: "square.stack.3d.forward.dottedline", number: "11", addIcon: .none, cellType: .none, images: [])
        ],
        [
            Model(title: "Импортированные", image: "square.and.arrow.down", number: "123", addIcon: .none, cellType: .none, images: []),
            Model(title: "Дубликаты", image: "doc.on.doc", number: "44", addIcon: .none, cellType: .none, images: []),
            Model(title: "Скрытые", image: "eye.slash", number: "", addIcon: .lock, cellType: .none, images: []),
            Model(title: "Недавно удаленные", image: "trash", number: "", addIcon: .lock, cellType: .none, images: [])
        ]
    ]

    //MARK: - Outlets
    private lazy var hederView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .white
        return myView
    }()
    
    private lazy var addBtn: UIButton = {
        let button = UIButton()
        button.setTitle(" ", for: .normal)
        button.backgroundColor = UIColor.clear
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.systemBlue
        button.imageView?.layer.transform = CATransform3DMakeScale(1.2, 1.2, 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createlayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainHederCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainHederCell.identifier)
        collectionView.register(GeneralHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GeneralHeader.identifier)
        collectionView.register(AlbumsCell.self, forCellWithReuseIdentifier: AlbumsCell.identifier)
        collectionView.register(PeopleCell.self, forCellWithReuseIdentifier: PeopleCell.identifier)
        collectionView.register(PlacesCell.self, forCellWithReuseIdentifier: PlacesCell.identifier)
        collectionView.register(MediafilesCell.self, forCellWithReuseIdentifier: MediafilesCell.identifier)
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(hederView)
        hederView.addSubview(addBtn)
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        hederView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalTo(view)
            make.height.equalTo(30)
        }
        
        addBtn.snp.makeConstraints { make in
            make.left.equalTo(hederView).offset(12)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(hederView.snp.bottom)
            make.right.bottom.left.equalTo(view)
        }
    }
    
    
    private func createlayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.4))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2 ),
                                                       heightDimension: .estimated(530))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(80)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 0,
                                                                      trailing: 0)
                
                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.4))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2 ),
                                                       heightDimension: .estimated(530))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])

                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                // вот кто отвечает за листание слайдом =)))
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(36)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 20,
                                                                      trailing: 0)
                
                return layoutSection
            
            // MedifilesCell
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(50))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])

                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(36)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 0,
                                                                      bottom: 20,
                                                                      trailing: 0)
                
                return layoutSection
                
            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(50))
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])

                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(36)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 0,
                                                                      bottom: 20,
                                                                      trailing: 0)
                
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalWidth(0.2))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: layoutItem, count: 5)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                return sectionLayout
            }
            
        }
        
    }
    
}

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        modelData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return modelData[section].count
        case 1:
            return modelData[section].count
        case 2:
            return modelData[section].count
        case 3:
            return modelData[section].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let data = modelData[indexPath.section][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCell.identifier, for: indexPath) as! AlbumsCell
            cell.clipsToBounds = true
            cell.modelText = data
            return cell
        case 1:
            let data = modelData[indexPath.section][indexPath.item]
            switch data.cellType {
                case .people:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCell.identifier, for: indexPath) as! PeopleCell
                    cell.modelText = data
                    cell.cellCornerRadius = Int(cell.bounds.width / 4)
                    return cell
                case .map:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCell.identifier, for: indexPath) as! PlacesCell
                    cell.modelText = data
                    return cell
                default:
                    return UICollectionViewCell()
            }
        case 2:
            let data = modelData[indexPath.section][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediafilesCell.identifier, for: indexPath) as! MediafilesCell
            cell.modelText = data
            return cell
        case 3:
            let data = modelData[indexPath.section][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediafilesCell.identifier, for: indexPath) as! MediafilesCell
            cell.modelText = data
            return cell
        default:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCell.identifier, for: indexPath)
            cell.backgroundColor = .systemGreen

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainHederCell.identifier, for: indexPath) as! MainHederCell
            header.title.text = "Мои альбомы"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GeneralHeader.identifier, for: indexPath) as! GeneralHeader
            header.title.text = "Люди и места"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GeneralHeader.identifier, for: indexPath) as! GeneralHeader
            header.title.text = "Типы медиафайлов"
            return header
        case 3:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GeneralHeader.identifier, for: indexPath) as! GeneralHeader
            header.title.text = "Другое"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            return header
        }
    }
    
    
}
