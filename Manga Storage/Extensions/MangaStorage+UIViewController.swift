//
//  MangaStorage+UIViewController.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 21/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import UIKit
import MaterialComponents.MDCAppBarNavigationController

extension UIViewController{
    
    func removeBackButtonTitle(){
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    var mainStoryboard : UIStoryboard{
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class var storyboardId : String{
        return String(describing: self)
    }
//    
//    var homeNavigationController : HomeNavigationController?{
//        return (self.navigationController as? HomeNavigationController)
//    }
//    
}
