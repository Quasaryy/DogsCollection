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
        let shareController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        
        present(shareController, animated: true)
        
        shareController.completionWithItemsHandler = {_, bool, _, _ in
            if bool { print("Success!") }
        }
    }
    
}
