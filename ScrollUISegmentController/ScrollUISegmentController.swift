//
//  ScrollUISegmentController.swift
//  ScrollUISegmentController
//
//  Created by Ali Adam on 8/3/17.
//  Copyright © 2017 Ali Adam. All rights reserved.
//

import UIKit

protocol ScrollUISegmentControllerDelegate: class {
    func selectItemAt(index :Int, onScrollUISegmentController scrollUISegmentController:ScrollUISegmentController)
}


@IBDesignable
class ScrollUISegmentController: UIScrollView  {
   private var segmentedControl: UISegmentedControl = UISegmentedControl()
    
    weak var segmentDelegate: ScrollUISegmentControllerDelegate?
    

    @IBInspectable
    public var segmentTintColor: UIColor = .black {
        didSet {
            self.segmentedControl.tintColor = self.segmentTintColor
        }
    }
    
    
    @IBInspectable
    public var itemWidth: CGFloat = 100 {
        didSet {
        }
    }

    public var segmentFont: UIFont = UIFont.systemFont(ofSize: 13) {
        didSet {
            self.segmentedControl.setTitleTextAttributes([NSFontAttributeName: self.segmentFont],for: UIControlState())
        }
    }
    public var itemsCount: Int = 3
    public var segmentheight : CGFloat = 29.0

    
    public var segmentItems: Array = ["1","2","3"] {
        didSet {
            self.itemsCount = segmentItems.count
            self.createSegment()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createSegment()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSegment()
        
    }
    
    init(frame: CGRect , andItems items:[String]) {
        super.init(frame: frame)
        self.segmentItems = items
        self.itemsCount = segmentItems.count
        self.createSegment()
    }
    func createSegment() {
        self.segmentedControl.removeFromSuperview()
        segmentheight =  self.frame.height
        var width = CGFloat(self.itemWidth * CGFloat(self.itemsCount))
        if width < self.frame.width {
            itemWidth =  CGFloat(self.frame.width) / CGFloat(itemsCount)
             width = CGFloat(self.itemWidth * CGFloat(self.itemsCount))
        }
        self.segmentedControl = UISegmentedControl(frame: CGRect(x: 0 , y: 0, width: width , height: segmentheight))
        self.addSubview(self.segmentedControl)
        self.backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        NSLayoutConstraint(item: self.segmentedControl, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.segmentedControl, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
        let contentHeight =  self.frame.height
        self.contentSize = CGSize (width: width, height: contentHeight)
        self.segmentedControl.setTitleTextAttributes([NSFontAttributeName: self.segmentFont],for: UIControlState())
        self.segmentedControl.tintColor = self.segmentTintColor
        self.segmentedControl.selectedSegmentIndex = 0;
        insertItems()
        self.segmentedControl.addTarget(self, action: #selector(self.segmentChangeSelectedIndex(_:)), for: .valueChanged)
        
    }
    
    func insertItems(){
        for item in segmentItems {
        self.segmentedControl.insertSegment(withTitle: item, at: (segmentItems.index(of: item))!, animated: true)
               }
    }
    
    func segmentChangeSelectedIndex(_ sender: AnyObject) {
     segmentDelegate?.selectItemAt(index: self.segmentedControl.selectedSegmentIndex, onScrollUISegmentController: self)
        print("\(self.segmentedControl.selectedSegmentIndex)")
        }
}


