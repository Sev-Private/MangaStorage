//
//  UITableView+.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 21/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import UIKit
import Material
import MaterialControls
import MaterialComponents
import HS_Google_Material_Design_Icons


extension UITableView{
    
    private func resetTableViewSets(){
        self.backgroundView = nil
        self.isScrollEnabled = true
    }
    
    private func setTableViewBackground(withViews views: [UIView]){
        
        let stack = UIStackView()
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(view)
        }
        
        if self.tableFooterView == nil{
            tableFooterView = UIView()
        }
        
        self.backgroundView = stack;
        
        if #available(iOS 11, *) {
            let guide = self.safeAreaLayoutGuide
            stack.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            stack.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            stack.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        } else {
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }
        
        self.isScrollEnabled = false
    }
    
    func show(loading: Bool){
        if loading{
            
            let activityIndicator = MDCActivityIndicator()
            activityIndicator.sizeToFit()
            activityIndicator.startAnimating()
            
            MDCActivityIndicatorColorThemer.applySemanticColorScheme(ColorScheme, to: activityIndicator)
        
            setTableViewBackground(withViews: [activityIndicator])
            
        }else{
           resetTableViewSets()
        }
    }
    
    func show(empty: Bool){
        if empty{
            let iconLabel = UILabel()
            iconLabel.GMDIcon = .gmdWarning //.gmdErrorOutline
            iconLabel.textAlignment = .center
            iconLabel.font = iconLabel.font.withSize(50)
            iconLabel.textColor = Constants.Colors.PrimaryTextColor
            
            let messageLabel = UILabel()
            messageLabel.text = "Não existem resultados"
            messageLabel.textColor = Constants.Colors.PrimaryTextColor
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "TrebuchetMS", size: 20)
            
            setTableViewBackground(withViews: [iconLabel, messageLabel])
            
        }else{
            resetTableViewSets()
        }
    }
    
    func show(error: Bool, withMessage message : String? = nil, andRetryAction retry: (() -> Void)? = nil){
        if error{
            let iconLabel = UILabel()
            iconLabel.GMDIcon = .gmdErrorOutline
            iconLabel.textAlignment = .center
            iconLabel.numberOfLines = 0
            iconLabel.font = iconLabel.font.withSize(50)
            iconLabel.textColor = Constants.Colors.ErrorColor
            
            let messageLabel = UILabel()
            messageLabel.text = message ?? "Ocorreu um erro"
            messageLabel.textColor = Constants.Colors.ErrorColor
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "TrebuchetMS", size: 20)
            
            var views: [UIView] = [iconLabel, messageLabel]
            
            if let retry = retry{
                let button = MDCButton()
                button.setTitle("Tentar novamente", for: .normal)
                button.actionHandle(controlEvents: .touchUpInside, ForAction: retry)
                
                let buttonScheme = MDCButtonScheme()
                MDCContainedButtonThemer.applyScheme(buttonScheme, to: button)
                MDCContainedButtonColorThemer.applySemanticColorScheme(ColorScheme, to: button)
                
                button.contentEdgeInsets = UIEdgeInsetsMake(10,10,10,10)
                
                
                views.append(button)
            }
            
            setTableViewBackground(withViews: views)
            
        }else{
            resetTableViewSets()
        }
    }
}
