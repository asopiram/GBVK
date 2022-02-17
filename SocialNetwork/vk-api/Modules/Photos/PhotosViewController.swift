//
//  PhotosViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/20/21.
//

import UIKit
import SDWebImage
import RealmSwift

class PhotosViewController: UICollectionViewController {
    
    private var photosAPI = PhotosAPI()
    //private var photosDB = PhotosDB()
    //private var photos: Results<PhotosDAO>?
    private var photos: [PhotosDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //photosDB.deleteAll()
         
        photosAPI.getPhotos { [weak self] photos in
            guard let self = self else { return }
            
            //self.photosDB.save(photos)
            //self.photos = self.photosDB.fetch()
            self.photos = photos
            self.collectionView.reloadData()
        }
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //guard let photos = photos else { return 0 }
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewCell", for: indexPath) as! PhotosViewCell
        
        //cell.PhotoImageView.backgroundColor = .yellow //покрасил для того, чтобы увидеть, что создаются ячейки
        
        //для PhotoDB
        /*
        if let photo = photos?[indexPath.row] {
            print(photo.sizes.first?.url)
        
            if let url = URL(string: photo.sizes.first!.url) {
            
            cell.PhotoImageView.sd_setImage(with: url) { (image, _, _, _) in
                collectionView.reloadItems(at: [indexPath])
                }
            } else {
                print("error")
            }
        }
        */
        
        //для PhotoDTO
        let photoPath: PhotosDTO = photos[indexPath.item]
        
        if let photoSize = photoPath.sizes.last {
            
            let url = photoSize.url
            print(url)
            cell.PhotoImageView.sd_setImage(with: URL.init(string: url), completed: nil)
        }
        
        return cell
    }
}
