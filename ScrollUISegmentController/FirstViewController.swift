//
//  FirstViewController.swift
//  ScrollUISegmentController
//
//  Created by Ali Adam on 8/3/17.
//  Copyright © 2017 Ali Adam. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,ScrollUISegmentControllerDelegate{

    @IBOutlet weak var segment: ScrollUISegmentController!
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.segmentDelegate = self
        segment.tag = 1
        segment.segmentItems = ["1","2","3","4","5","6","7","8","9","10"]
    }
 
    func selectItemAt(index: Int, onScrollUISegmentController scrollUISegmentController: ScrollUISegmentController) {
        print("select Item At\(index) in scrollUISegmentController with tag  \(scrollUISegmentController.tag) ")
    }

}

