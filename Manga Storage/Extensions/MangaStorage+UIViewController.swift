//
//  MangaStorage+UIViewController.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 21/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func removeBackButtonTitle(){
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func instantiateViewController<T>(withType type: T.Type) -> T where T: UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: T.storyboardId) as! T
    }
    
    class var storyboardId : String{
        return String(describing: self)
    }

}
