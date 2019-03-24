//
//  HomeNavigationController.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 22/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import UIKit
import MaterialComponents

class HomeNavigationController : MDCAppBarNavigationController{
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        self.pushViewController(HomeTableViewController(), animated: true)
    }
    
    
//    override init(rootViewController: UIViewController) {
//        super.init(rootViewController: rootViewController)
//
//        commonInit()
//    }
//
//    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
//        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
//
//        commonInit()
//    }
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        commonInit()
//    }
//
//    private func commonInit(){
//        MDCAppBarColorThemer.applySemanticColorScheme(ColorScheme, to: self)
//
//
//    }
}
