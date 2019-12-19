//
//  LoaderController.swift
//  TheRealYou
//
//  Created by brady murphy on 12/16/19.
//  Copyright © 2019 Brady Murphy. All rights reserved.
//

import UIKit
import Foundation
import NVActivityIndicatorView

/**
 View controller encapsulating an activity indicator. Upon loading, the activity indicator will be launched and start animating
 as the view disappears, it will stop animating
 */
class ActivityIndicatorViewController: UIViewController, NVActivityIndicatorViewable {
    
    var activityIndicatorView: NVActivityIndicatorView!

    /**
     Create activity indicator and start the animation upon the view loading
     */
    override func viewDidLoad() {
        super.viewDidLoad()

        // create the activity
        activityIndicatorView = NVActivityIndicatorView(frame: .init(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 200, height: 200), type: .ballRotateChase, color: .white, padding: .none)
        activityIndicatorView.center = view.center
        self.view.addSubview(activityIndicatorView)
        
        activityIndicatorView.startAnimating()
    }
    
    /**
     When the view disappears, stop the activity indicator from animating
     */
    override func viewDidDisappear(_ animated: Bool) {
        activityIndicatorView.stopAnimating()
    }
}
