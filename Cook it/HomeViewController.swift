//
//  ViewController.swift
//  Cook it
//
//  Created by mobile dev3 on 7/19/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit



struct ItemToDisplay {
    
    var Name: String
}
class HomeViewController: BaseViewController , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var itemsToDisplay: [ItemToDisplay] = []
    
     let gridFlowLayout = GridFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setNaviationBar()
        setupDatasource()
        collectionView.collectionViewLayout = gridFlowLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setNaviationBar(){
        self.navigationItem.title = "DESSERT"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Futura-Medium", size: 16)!,
            NSForegroundColorAttributeName: UIColor.red
        ]
    }
    func setupDatasource() {
        itemsToDisplay = [ItemToDisplay(Name: "1"), ItemToDisplay(Name: "2"), ItemToDisplay(Name: "3"), ItemToDisplay(Name: "4"),
                          ItemToDisplay(Name: "5"), ItemToDisplay(Name: "6"), ItemToDisplay(Name: "7"), ItemToDisplay(Name: "8"),
                          ItemToDisplay(Name: "9"), ItemToDisplay(Name: "10"),ItemToDisplay(Name: "1"), ItemToDisplay(Name: "2"), ItemToDisplay(Name: "3"), ItemToDisplay(Name: "4"),
                          ItemToDisplay(Name: "5"), ItemToDisplay(Name: "6"), ItemToDisplay(Name: "7"), ItemToDisplay(Name: "8"),
                          ItemToDisplay(Name: "9"), ItemToDisplay(Name: "10")]
        
        collectionView.reloadData()
        
        
    }

    
    
    // MARK: collectionView methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
   
        
        cell.imageviewItem.layer.borderWidth = 1
        cell.imageviewItem.layer.masksToBounds = false
        cell.imageviewItem.layer.borderColor = UIColor.black.cgColor
        cell.imageviewItem.layer.cornerRadius = cell.imageviewItem.frame.height/2
        cell.imageviewItem.clipsToBounds = true
        return cell
    }
    
    // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //    return CGSize(width: self.view.frame.width/2, height: 120);
    //  }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsToDisplay.count
    }

}

