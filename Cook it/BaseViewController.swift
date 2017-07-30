//
//  BaseViewController.swift
//  Cook it
//
//  Created by mobile dev3 on 7/19/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,SlideMenuDelegate {
    let btnShowMenu = UIButton()
    var objMenu : SideMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        self.addswipeGesture()
    }
    
    func addSlideMenuButton(){
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        btnShowMenu.alpha = 0
        btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState())
        btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState.highlighted)
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: navigationBarHeight, height: navigationBarHeight)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 27, height: 22), false, 0.0)
        UIColor.red.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 27, height: 2)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 27, height: 2)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 27, height: 2)).fill()
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return defaultMenuImage;
    }
    func onSlideMenuButtonPressed(_ sender : UIButton){
        
        print("Clicking ======>")
        print(sender.tag)
        if (sender.tag == 10)
        {   // Menu is already displayed, no need to display it twice, otherwise we hide the menu
            sender.tag = 0;
            //Remove Menu View Controller
            objMenu.animateWhenViewDisappear()
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        objMenu  = self.storyboard!.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        objMenu.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        objMenu.animateWhenViewAppear()
        objMenu.btnMenu = sender
        objMenu.delegate = self
        //self.view.addSubview(objMenu.view)
        UIApplication.shared.keyWindow?.addSubview(objMenu.view)
        //self.addChildViewController(objMenu)
        objMenu.view.layoutIfNeeded()
        sender.isEnabled = true
        
    }
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        print(index)
        if (index>=0) {
            
//            if(index == 0){
//                var homeVC : HomeViewController!
//                homeVC  = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                navigationController?.pushViewController(homeVC, animated: false)
//                self.navigationController?.navigationItem.title  = "Home"
//                
//            }            
        }
    }
    func addswipeGesture() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        //        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        //        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        //        self.view.addGestureRecognizer(swipeDown)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                btnShowMenu.sendActions(for: .touchUpInside)
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
}
