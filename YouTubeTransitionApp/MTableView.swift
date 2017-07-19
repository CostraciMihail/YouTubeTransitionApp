//
//  MTableView.swift
//  YouTubeTransitionApp
//
//  Created by winify on 7/19/17.
//  Copyright © 2017 com.iOSDeveloper. All rights reserved.
//

import UIKit

class MTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(withFrame frame: CGRect, style: UITableViewStyle, onView view: UIView) {
        
        self.tableView = UITableView(frame: frame, style: style)
        super.init(frame: frame)
        
        view.addSubview(self)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addSubview(tableView)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    public func tableView(_ tableViewZ: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nib = UINib(nibName: "MSimpleCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MSimpleCellTableViewCell")
        
        let cell = tableViewZ.dequeueReusableCell(withIdentifier: "MSimpleCellTableViewCell", for: indexPath) as! MSimpleCellTableViewCell
        cell.bigImage.image = UIImage(named: "img\(indexPath.row)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
