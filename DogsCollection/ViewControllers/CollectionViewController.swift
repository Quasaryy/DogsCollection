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
    let cellsInRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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

    // MARK: UICollectionViewDelegate

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
