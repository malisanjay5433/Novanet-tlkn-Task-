//
//  Model.swift
//  DemoApp
//
//  Created by Sanjay Mali on 07/08/16.
//  Copyright © 2016 Sanjay. All rights reserved.
//
import UIKit
import AVFoundation


class GroupViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,CollectionViewDelegateLayout{
    let model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        model.dataSource()
        if let patternImage = UIImage(named: "cool-pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView!.backgroundColor = UIColor.clearColor()
        collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
        setupCollectionView()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func setupCollectionView(){
        let layout = CollectionViewLayout()
        layout.minimumColumnSpacing = 16.0
        layout.minimumInteritemSpacing = 16.0
        
        self.collectionView!.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        self.collectionView!.alwaysBounceVertical = true
        self.collectionView!.collectionViewLayout = layout
    }
}

extension GroupViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.images.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GroupCell", forIndexPath: indexPath) as! GroupCell
        cell.layer.cornerRadius = 3.0
        cell.layer.masksToBounds = true
        cell.userImage.layer.borderWidth = 1
        cell.userImage.layer.masksToBounds = false
        cell.userImage.layer.borderColor = UIColor.grayColor().CGColor
        cell.userImage.layer.cornerRadius = cell.userImage.frame.height/2
        cell.userImage.clipsToBounds = true
        cell.userImage.image = model.images[indexPath.row]
        cell.userName.text =  model.name[indexPath.row]
        cell.userSatatus.text =  model.status[indexPath.row]
        return cell
    }
    //    func collectionView(collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    //        //device screen size
    //        let width = UIScreen.mainScreen().bounds.size.width
    //        //calculation of cell size
    //        return CGSize(width: ((width / 2) - 16)   , height: 200)
    //    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let imageSize = model.images[indexPath.row].size
        return imageSize
    }
}


