//
//  PhotosViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/20/21.
//

import UIKit
import SDWebImage

class PhotosViewController: UICollectionViewController {
    
    private var photoAPI = PhotoAPI()
    private var photos: [PhotoDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        
        
        photoAPI.getPhotos{ [weak self] photos in
            guard let self = self else {return}
            self.photos = photos
            self.collectionView.reloadData()
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewCell", for: indexPath) as! PhotosViewCell
        
        //cell.PhotoImageView.backgroundColor = .yellow //покрасил для того, чтобы увидеть, что создаются ячейки
        
        let photoPath: PhotoDTO = photos[indexPath.item]
        let photoSize = photoPath.sizes.last
        let url = photoSize!.url
        
        cell.PhotoImageView.sd_setImage(with: URL.init(string: url), completed: nil)
        
    
        return cell
    }


}
