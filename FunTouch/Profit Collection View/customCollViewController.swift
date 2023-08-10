//
//  customCollViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 08.08.2023.
//

import UIKit

class CustomCollViewController: UIViewController {

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: GridCompositionalLayout.generateLayout()
    )
    private lazy var model = ColorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
        // Do any additional setup after loading the view.
    }
    
    private func prepareCollectionView() {
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(LetterCell.self, forCellWithReuseIdentifier: "letterCell")
        
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: SupplementaryElements.collectionHeader,
            withReuseIdentifier: SupplementaryElements.collectionHeader
        )
        
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: SupplementaryElements.sectionHeader,
            withReuseIdentifier: SupplementaryElements.sectionHeader
        )
        
        collectionView.register(
            Spacer.self,
            forSupplementaryViewOfKind: SupplementaryElements.sectionSpacer,
            withReuseIdentifier: SupplementaryElements.sectionSpacer
        )
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
       
    }
    
}

extension CustomCollViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section % 2 == 0 {
            return model.letters.count
        }
        return model.colors.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letterCell", for: indexPath) as! LetterCell
            cell.letterLabel.text = String(model.letters[indexPath.row])
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = model.colors[indexPath.row]
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kind, for: indexPath)
        if let header = cell as? HeaderView {
            header.label.text = kind
        }
        return cell
    }
    
    
}
