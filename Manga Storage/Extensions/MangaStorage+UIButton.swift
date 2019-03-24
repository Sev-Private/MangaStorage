//
//  MangaStorage+UIButton.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 21/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import UIKit

extension UIButton {
    private func actionHandleBlock(_ action:  (() -> Void)? = nil) {
        struct __ {
            static var action :(() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    
    @objc private func triggerActionHandleBlock() {
        self.actionHandleBlock()
    }
    
    func actionHandle(controlEvents control :UIControlEvents, ForAction action: @escaping () -> Void) {
        self.actionHandleBlock(action)
        self.addTarget(self, action: #selector(triggerActionHandleBlock), for: control)
    }
}
