//
//  AddEditMangaViewController.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 21/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import UIKit
import Material
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialTextFields_ColorThemer


class AddEditMangaViewController: UIViewController {

    @IBOutlet weak var mainScrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIStackView!
    
    private var nameInput: MDCTextInputControllerOutlined?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        removeBackButtonTitle()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        setupLayout()
    }
    
//    MDCTextField *textFieldName = [[MDCTextField alloc] init];
//    textFieldName.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.scrollView addSubview:textFieldName];
//
//    textFieldName.delegate = self;
//    textFieldName.clearButtonMode = UITextFieldViewModeUnlessEditing;
//    textFieldName.backgroundColor = [UIColor whiteColor];
//
//    UIImage *leadingImage = [UIImage
//    imageNamed:@"ic_search"
//    inBundle:[NSBundle
//    bundleForClass:[TextFieldOutlinedObjectiveCExample class]]
//    compatibleWithTraitCollection:nil];
//    textFieldName.leadingView = [[UIImageView alloc] initWithImage:leadingImage];
//    textFieldName.leadingViewMode = UITextFieldViewModeAlways;
//
//    UIImage *trailingImage = [UIImage
//    imageNamed:@"ic_done"
//    inBundle:[NSBundle
//    bundleForClass:[TextFieldOutlinedObjectiveCExample class]]
//    compatibleWithTraitCollection:nil];
//    textFieldName.trailingView = [[UIImageView alloc] initWithImage:trailingImage];
//    textFieldName.trailingViewMode = UITextFieldViewModeAlways;
//
//    self.nameController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:textFieldName];
//    self.nameController.placeholderText = @"Full Name";
//    [self styleTextInputController:self.nameController];
//
//    MDCTextField *textFieldAddress = [[MDCTextField alloc] init];
//    textFieldAddress.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.scrollView addSubview:textFieldAddress];
    
    func setupLayout(){
        var nameTextField = MDCTextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.addArrangedSubview(nameTextField)
        
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.backgroundColor = .white
        
        
        var nameIcon = UILabel()
        nameIcon.text = "bla bla bla"
//        nameIcon.GMDIcon = .gmdError
        nameTextField.leadingView = UIImageView(image: Icon.audio)
        nameTextField.leadingViewMode = .always
        
        self.nameInput = MDCTextInputControllerOutlined(textInput: nameTextField)
        nameInput?.placeholderText = "Nome"
        styleInputController(nameInput)
        
    }
    
    func styleInputController(_ controller: MDCTextInputController?){
        
        MDCTextFieldColorThemer.applySemanticColorScheme(ColorScheme, to: controller!)
    }
    
    
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        mainScrollViewBottomConstraint.constant = keyboardSize.height
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {
        mainScrollViewBottomConstraint.constant = 0
    }

    


}
