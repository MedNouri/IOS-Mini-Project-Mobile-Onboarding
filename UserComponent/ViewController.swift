//
//  ViewController.swift
//  UserComponent
//
//  Created by MohamedNouri on 01/09/2020.
//  Copyright © 2020 think-it. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    enum Section: String, CaseIterable {
        case myAlbums = "My Albums"
        case featuredAlbums = "My featuredAlbums"

    }
    
    
    
    
    var collectionView:UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, UserDetailItem>! = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Your Albums"
        configureCollectionView()
        configureDataSource()
    }
    
    
    func configureDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource
            <Section, UserDetailItem>(collectionView: collectionView) {
                
                (collectionView: UICollectionView, indexPath: IndexPath, DataItem: UserDetailItem) -> UICollectionViewCell? in
                
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: UserComponent.reuseIdentifier,
                    for: indexPath) as? UserComponent else { fatalError("Could not create new cell") }
                cell.data = DataItem
                return cell
        }
        // var snapshot = NSDiffableDataSourceSnapshot<Section, AlbumItem>()
        
        let snapshot = snapshotForCurrentState()
        
        
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, UserDetailItem> {
        
        
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, UserDetailItem>()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems([UserDetailItem(photoURL: "https://api.adorable.io/avatars/80/abott@adorable.png", artistName: "Mohamed", location : "Tunisa ",follwersNumber: "200", followed: true, currentlyLive: false)], toSection: .myAlbums)
        snapshot.appendItems([UserDetailItem(photoURL: "https://api.adorable.io/avatars/80/abott@adorzeable.iez", artistName: "Steve tom", location : "USA ",follwersNumber: "334", followed: false, currentlyLive: true)], toSection: .myAlbums)
        snapshot.appendItems([UserDetailItem(photoURL: "https://api.adorable.io/avatars/80/abott@adorables.png", artistName: "Steve job", location : "France ",follwersNumber: "3034", followed: true, currentlyLive: true)], toSection: .myAlbums)
           
        
        return snapshot
    }
    
    
    private func configureCollectionView() {
        // Adjust width and height as needed
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Adjust height and item spacing as needed
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 4, bottom: 12, trailing: 4)
        
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(UserComponent.self, forCellWithReuseIdentifier: UserComponent.reuseIdentifier)
        
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    

}

