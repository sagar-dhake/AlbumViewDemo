//
//  AlbumListViewController.swift
//  AlbumViewDemoApp
//
//  Created by Sagar Dhake on 22/08/20.
//  Copyright © 2020 Sagar Dhake. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController {
    
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    var albumList:[Album] = []
    let albumListViewModel = AlbumListViewModel()
    
    let alertView = UIAlertController(title: nil, message: NSLocalizedString("Please_Wait", comment: ""), preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("Album_List", comment: "")
        
        self.albumCollectionView.register(UINib(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumCollectionViewCell")
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 60, height: 60))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        self.alertView.view.addSubview(loadingIndicator)
        
        if !CheckNetwork.Connection()
        {
            self.view.makeToast(NSLocalizedString("No_Internet_Alert", comment: ""))
        }
        else
        {
            present(self.alertView, animated: true, completion: nil)
            self.fetchAlbumList()
        }
    }
    
    //MARK: Fetch Album List
    
    func fetchAlbumList()
    {
        self.albumListViewModel.fetchAlbumList(success: { (albumList) in
            self.albumList = albumList
            DispatchQueue.main.async {
                self.alertView.dismiss(animated: true, completion: nil)
                self.albumCollectionView.reloadData()
            }
        }) { (error) in
            self.alertView.dismiss(animated: true, completion: nil)
            self.view.makeToast("Error occured in fetching data:- \(error)")
        }
    }
}

extension AlbumListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        
        let album = self.albumList[indexPath.item]
        
        cell.authorNameLbl.text = album.author
        
        cell.albumImageView.image = UIImage(named: "dummyAlbumImage")
        let imageName = String(format: Apis.getImageUrl, String(album.id))
        let albumImageUrl = URL(string: imageName)
        cell.tag = indexPath.item
        
        if(albumImageUrl != nil)
        {
            DispatchQueue.global().async {
                let task = URLSession.shared.dataTask(with: albumImageUrl!) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async() {
                        if cell.tag == indexPath.row{
                            cell.albumImageView.image = UIImage(data: data)
                        }
                    }
                }
                task.resume()
            }
        }
        
        return cell
    }
}

extension AlbumListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.frame.size.width
        
        var orientation: UIInterfaceOrientation? {
            get {
                guard let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation else {
                    #if DEBUG
                    fatalError("Could not obtain UIInterfaceOrientation from a valid windowScene")
                    #else
                    return nil
                    #endif
                }
                return orientation
            }
        }
        
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            return CGSize(width: (collectionViewWidth-20)/4, height: (collectionViewWidth-20)/4)
        }
        else{
            return CGSize(width: (collectionViewWidth-10)/2, height: (collectionViewWidth-10)/2)
        }
    }
}
