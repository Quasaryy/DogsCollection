//
//  DetailsViewController.swift
//  DogsCollection
//
//  Created by Yury on 28.01.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var image: String!

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFill
    }

    @IBAction func shareButtonAction(_ sender: UIButton) {
    }
}
