//
//  SideMenuViewController.swift
//  Cook it
//
//  Created by mobile dev3 on 7/19/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit
protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}
class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var delegate : SlideMenuDelegate?
    var btnMenu : UIButton!
    
    @IBOutlet weak var butnCloseMenu: UIButton!
    
    var arrayofData:[String] = ["NEW RECIPE","RECIPES","SAVED RECIPES", "SHOPPING LIST" , "SETTINGS"]
     @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Override point for customization after application launch.
        UINavigationBar.appearance().barTintColor = UIColor(hex: "4c1d12")
        UINavigationBar.appearance().tintColor = UIColor.white
        self.view.frame = CGRect(x: -self.view.bounds.size.width, y: 0, width: self.view.bounds.size.width,height: self.view.bounds.size.height)
        self.view.layoutIfNeeded()
        self.view.backgroundColor = UIColor.clear
        self.butnCloseMenu.alpha = 0.0
        self.butnCloseMenu.backgroundColor = UIColor.darkGray.withAlphaComponent(0.0)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Animations
    func animateWhenViewAppear(){
        self.butnCloseMenu.alpha = 0.0
        self.butnCloseMenu.backgroundColor = UIColor.darkGray.withAlphaComponent(0.0)
        self.view.backgroundColor = UIColor.clear
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width,height: self.view.bounds.size.height)
            
            self.view.layoutIfNeeded()
            print("Starting appear menu")
        }, completion: { (finished) -> Void in
            self.butnCloseMenu.backgroundColor = UIColor.darkGray.withAlphaComponent(0.4)
            self.butnCloseMenu.alpha = 0.3
            print("Ending appear menu")
            
        })    }
    
    func animateWhenViewDisappear(){
        self.butnCloseMenu.alpha = 0.0
        self.view.backgroundColor = UIColor.clear
        self.butnCloseMenu.backgroundColor = UIColor.darkGray.withAlphaComponent(0.0)
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            
            self.view.frame = CGRect(x: -self.view.bounds.size.width, y: 0, width: self.view.bounds.size.width,height: self.view.bounds.size.height)
            self.view.layoutIfNeeded()
            
            print("Starting dissappear menu")
            
        }, completion: { (finished) -> Void in
            self.willMove(toParentViewController: nil)
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            self.btnMenu.tag = 0
            self.view.backgroundColor = UIColor.clear
            self.butnCloseMenu.alpha = 0.0
            self.butnCloseMenu.backgroundColor = UIColor.darkGray.withAlphaComponent(0.0)
            print("ending dissappear menu")
            
        })
    }
    
    
    @IBAction func sidemenuCloseButton(_ sender: UIButton) {
        
        animateWhenViewDisappear()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath as IndexPath) as! SideMenuTableViewCell
       
        print("Your cell number: \(indexPath.row)!")
        print("Your cell number: \(arrayofData[indexPath.row])!")
        cell.title.text = arrayofData[indexPath.row]
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell number: \(indexPath.row)!")
        animateWhenViewDisappear()
        
        if (self.delegate != nil) {
            
            self.delegate?.slideMenuItemSelectedAtIndex(Int32(indexPath.row))
        }
        
        
    }

    
  }
