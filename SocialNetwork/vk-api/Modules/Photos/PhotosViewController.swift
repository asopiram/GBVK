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
    private var photosDB = PhotosDB()
    private var photos: Results<PhotosDAO>?
    private var token: NotificationToken?
    //private var photos: [PhotosDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //photosDB.deleteAll()
         
        photosAPI.getPhotos { [weak self] photos in
            guard let self = self else { return }
            
            self.photosDB.save(photos)
            self.photos = self.photosDB.fetch()
            //self.photos = photos
            //self.collectionView.reloadData()
            self.token = self.photos?.observe(on: .main, { [weak self] changes in
                guard let self = self else { return }
                
                switch changes {
                case .initial: self.collectionView.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    self.collectionView.performBatchUpdates({
                        self.collectionView.insertItems(at: insertions.map({IndexPath(row: $0, section: 0)}))
                        self.collectionView.deleteItems(at: deletions.map({IndexPath(row: $0, section: 0)}))
                        self.collectionView.reloadItems(at: modifications.map({IndexPath(row: $0, section: 0) }))
                    
                    }, completion: nil)
                    
                case .error(let error):
                    print("An error occurred: \(error)")
                }
            })
        }
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let photos = photos else { return 0 }
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewCell", for: indexPath) as! PhotosViewCell
        
        if let photo = photos?[indexPath.row] {
            
            if let photoSize = photo.sizes.last {
                
                if let url = URL(string: photoSize.url){
                    //print(url)
                    //cell.PhotoImageView.sd_setImage(with: URL.init(string: url), completed: nil)
                    cell.PhotoImageView?.sd_setImage(with: url, completed:  { image, _, _, _ in
                        collectionView.reloadItems(at: [indexPath])
                    })
                }
            }
        }
        return cell
    }
}
