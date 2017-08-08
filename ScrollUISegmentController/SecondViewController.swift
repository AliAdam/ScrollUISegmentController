//
//  SecondViewController.swift
//  ScrollUISegmentController
//
//  Created by Ali Adam on 8/3/17.
//  Copyright © 2017 Ali Adam. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController ,ScrollUISegmentControllerDelegate{
    
    @IBOutlet weak var segment: ScrollUISegmentController!
    override func viewDidLoad() {
        super.viewDidLoad()
        addScrollUISegmentController()
    }
    
    func addScrollUISegmentController() {
        let segmentItems = ["1","2","3","4","5","6","7","8","9","10"]
        let segment = ScrollUISegmentController.init(frame: CGRect(x:10 ,y:30,width:self.view.frame.width - 20,height: 50), andItems: segmentItems)
        segment.segmentDelegate = self
        segment.tag = 2
        segment.itemWidth = 50
        segment.segmentTintColor = .blue
        self.view.addSubview(segment)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func selectItemAt(index: Int, onScrollUISegmentController scrollUISegmentController: ScrollUISegmentController) {
        print("select Item At\(index) in scrollUISegmentController with tag  \(scrollUISegmentController.tag) ")
    }
    
}
