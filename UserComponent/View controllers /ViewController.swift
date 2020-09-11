//
//  ViewController.swift
//  UserComponent
//
//  Created by MohamedNouri on 01/09/2020.
//  Copyright © 2020 think-it. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    
    var collectionView:UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, UserDetailItem>! = nil
    
    enum Section: String, CaseIterable {
        case myAlbums = "My Albums"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting Up Collection View
        view.backgroundColor = .systemBackground
        configureCollectionView()
        configureDataSource()
    }
    
    
    
    
    
    
    
}

extension ViewController{
    
    
    private func configureCollectionView() {
        // Adjust width and height as needed
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Adjust height and item spacing as needed absolute 104
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Adjust group interItemSpacing
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 4, bottom: 12, trailing: 4)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        
        // setting Layout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        
        // cell register
        collectionView.register(UserComponent.self, forCellWithReuseIdentifier: UserComponent.reuseIdentifier)
        
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
    
    
    func configureDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource
            <Section, UserDetailItem>(collectionView: collectionView) {
                
                (collectionView: UICollectionView, indexPath: IndexPath, DataItem: UserDetailItem) -> UICollectionViewCell? in
                
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: UserComponent.reuseIdentifier,
                    for: indexPath) as? UserComponent else { fatalError("Could not create new cell for artist") }
                cell.data = DataItem
                return cell
        }
        
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    
    
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, UserDetailItem> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, UserDetailItem>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(UserDetailItem.GenerateMockData(), toSection: .myAlbums)
        return snapshot
    }
    
    
}
