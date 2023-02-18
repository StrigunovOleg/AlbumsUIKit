//
//  TapBarController.swift
//  HW14CollectionView
//
//  Created by Олег Стригунов on 29.01.2023.
//
import UIKit

class TabBarConteller: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
           super.viewDidLoad()
           delegate = self
           setupTabBarConteller()
           setupTabBarViewContellers()
       }
    
    
    func setupTabBarConteller() {
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .systemGray6
    }
    
    func setupTabBarViewContellers() {
        // media VC
        let mediaVC = MediaViewController()
        let mediaVCIcon = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.filll"))
        mediaVCIcon.badgeColor = .systemBlue
        mediaVC.tabBarItem = mediaVCIcon
        
        // ForYou VC
        let forYouVC = ForYouViewController()
        let forYouVCIcon = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        forYouVCIcon.badgeColor = .systemBlue
        forYouVC.tabBarItem = forYouVCIcon
        
        // Albums VC
        let albumsVC = AlbumsViewController()
        let albumsVCIcon = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albumsVCIcon.badgeColor = .systemBlue
        albumsVC.tabBarItem = albumsVCIcon
        
        // Search VC
        let searchVC = SearchViewController()
        let searchVCIcon = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        searchVCIcon.badgeColor = .systemBlue
        searchVC.tabBarItem = searchVCIcon
        
        let controllers = [mediaVC, forYouVC, albumsVC, searchVC]
        self.setViewControllers(controllers, animated: true)
    }
}
