//
//  CollectionViewController.swift
//  DogsCollection
//
//  Created by Yury on 27.01.23.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let dogs = Dog.getDetails()
    var cellsInRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    // MARK: - IB Outletd
    @IBOutlet var stepper: UIStepper!
    

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        stepper.minimumValue = 1
        stepper.maximumValue = 4
        stepper.value = 2
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        guard let index = collectionView.indexPathsForSelectedItems?.first?.item else { return }
        detailsVC.image = dogs[index].name
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dogs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let imageName = dogs[indexPath.item].name
        cell.imageView.image = UIImage(named: "\(imageName)")
        cell.imageView.contentMode = .scaleAspectFill
    
        return cell
    }
    
    // MARK: - IB Action
    @IBAction func stepperAction(_ sender: UIStepper) {
        cellsInRow = sender.value
        collectionView.reloadData()
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // Setting cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let availableWidth = collectionView.frame.width
        let cellSize: CGFloat = (availableWidth - sectionInsets.left * (cellsInRow + 1)) / cellsInRow
        let size = CGSize(width: cellSize, height: cellSize)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
}
