//
//  ViewController.swift
//  YouTubeTransitionApp
//
//  Created by winify on 7/19/17.
//  Copyright © 2017 com.iOSDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var customView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = MTableView(withFrame: self.view.bounds, style: .plain, onView: self.view)
        tableView.backgroundColor = UIColor.clear
        
        self.setUpCustomView()
    }
    
    func setUpCustomView() {
        
        customView = UIView(frame: CGRect.zero)
        
        if let customView = self.customView {
            
            customView.backgroundColor = UIColor.green
            customView.isUserInteractionEnabled = true
            
            self.open(customView: customView)
            self.addGestureToCustomView()
        }
    }
    
    func open(customView view: UIView) {
        self.view.addSubview(view)
        let frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height)
        
        UIView.animate(withDuration: 0.5) {
            view.frame = frame
        }
    }
    
    func addGestureToCustomView() {
        
        //SWIPE DOWN
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(minimizeCustomViewAction))
        swipeDownGesture.numberOfTouchesRequired = 1
        swipeDownGesture.direction = .down
        customView?.addGestureRecognizer(swipeDownGesture)
        
        //SWIPE UP
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(maximizeCustomViewAction))
        swipeUpGesture.numberOfTouchesRequired = 1
        swipeUpGesture.direction = .up
        customView?.addGestureRecognizer(swipeUpGesture)
    }
    
    func minimizeCustomViewAction(gesture: UIGestureRecognizer) {

        if let customView = customView {
            UIView.animate(withDuration: 0.2) {
                customView.frame = CGRect(x: self.view.bounds.width-200, y: self.view.bounds.height-100, width: 200, height: 100)
            }
        }
    }
    
    func maximizeCustomViewAction(gesture: UIGestureRecognizer) {
        if let customView = customView {
            UIView.animate(withDuration: 0.2) {
                customView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: self.view.bounds.height)
            }
        }
    }
    

    

    
}


