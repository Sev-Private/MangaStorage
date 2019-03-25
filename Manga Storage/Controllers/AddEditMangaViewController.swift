//
//  AddEditMangaViewController.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 21/03/19.
//  Copyright © 2019 Thiago Augusto. All rights reserved.
//

import UIKit
import Material
import SDWebImage
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialTextFields_ColorThemer


class AddEditMangaViewController: UIViewController {

    
    @IBOutlet weak var saveButton: MDCButton!
    
    private var nameTextFieldController: MDCTextInputControllerOutlined?
    private var urlTextFieldController: MDCTextInputControllerOutlined?
    
    
    private var embeddedTableViewController : AddEditMangaEmbedTableViewController{
        return self.childViewControllers.first(where: { (vc) -> Bool in
            return vc is AddEditMangaEmbedTableViewController
        }) as! AddEditMangaEmbedTableViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        removeBackButtonTitle()
        
        setupMainLayout()
        
        setupTextFieldsLayout()
    }
    
    func setupMainLayout(){
//        tableView.delegate = self
        embeddedTableViewController.tableView.separatorStyle = .none
        embeddedTableViewController.tableView.allowsSelection = false
     embeddedTableViewController.tableView.backgroundColor = .red
        
        saveButton.setTitle("Salvar", for: .normal)
        saveButton.isEnabled = false
//        saveButton.isHidden = true
        let buttonScheme = MDCButtonScheme()
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: saveButton)
        MDCContainedButtonColorThemer.applySemanticColorScheme(ColorScheme, to: saveButton)
        
        
        embeddedTableViewController.previewImageView.isHidden = true
    }
    
    
    func setupTextFieldsLayout(){
        
        embeddedTableViewController.nameTextField.clearButtonMode = .always
        embeddedTableViewController.nameTextField.delegate = self
//        nameIcon.GMDIcon = .gmdError
//        nameTextField.leadingView = UIImageView(image: Icon.cm.)
//        nameTextField.leadingViewMode = .always
        
        self.nameTextFieldController = MDCTextInputControllerOutlined(textInput: embeddedTableViewController.nameTextField)
        nameTextFieldController?.placeholderText = "Nome"
        nameTextFieldController?.helperText = "Nome do manga a ser adicionado"
        
        styleInputController(nameTextFieldController)
        
        embeddedTableViewController.urlTextField.clearButtonMode = .always
        embeddedTableViewController.urlTextField.delegate = self
        //        nameIcon.GMDIcon = .gmdError
        //        nameTextField.leadingView = UIImageView(image: Icon.cm.)
        //        nameTextField.leadingViewMode = .always
        
        self.urlTextFieldController = MDCTextInputControllerOutlined(textInput: embeddedTableViewController.urlTextField)
        urlTextFieldController?.placeholderText = "Url"
        urlTextFieldController?.helperText = "Url de imagem de preview"
        
        styleInputController(urlTextFieldController)
        
    }
    
    func styleInputController(_ controller: MDCTextInputController?){
        
        MDCTextFieldColorThemer.applySemanticColorScheme(ColorScheme, to: controller!)
    }
}

extension AddEditMangaViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == embeddedTableViewController.urlTextField{
            if let value = textField.text, let url = URL(string: value) {
                embeddedTableViewController.previewImageView.isHidden = false
                
                embeddedTableViewController.previewImageView.sd_setImage(with: url)
            }else{
                embeddedTableViewController.previewImageView.isHidden = true
            }
        }
    }
}

class AddEditMangaEmbedTableViewController : UITableViewController{
    @IBOutlet weak var nameTextField: MDCTextField!
    @IBOutlet weak var urlTextField: MDCTextField!
    @IBOutlet weak var previewImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}
