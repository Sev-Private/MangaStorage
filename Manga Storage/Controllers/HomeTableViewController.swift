//
//  ViewController.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 25/04/18.
//  Copyright © 2018 Thiago Augusto. All rights reserved.
//

import UIKit
import Firebase

class HomeTableViewController: UITableViewController {

    var mangas = [Manga]()
    var DocumentListener : ListenerRegistration?
    var firstLoad = true
    let jsonDecoder = JSONDecoder()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DocumentListener?.remove()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        DocumentListener = MangaStorage.sharedInstance.firestore.collection("Manga").addSnapshotListener { (mangaSnapshot, error) in
//            if let e = error{
//                print(e.localizedDescription)
//                return
//            }
//            
//            guard let snap = mangaSnapshot else { return }
//            
//            print("SEV: count: \(snap.documentChanges.count)")
//            
//            if self.firstLoad{
//                for mangaDocument in snap.documents{
//                    
//                    if let data =  try? JSONSerialization.data(withJSONObject: mangaDocument.data(), options: []){
//                        if let manga = try? self.jsonDecoder.decode(Manga.self, from: data){
//                                self.mangas.append( manga)
//                        }
//                        
//                    }
//                }
//                
//                self.tableView.reloadData()
//                self.firstLoad = false
//                
//            } else{
//                self.tableView.beginUpdates()
//            
//                
//                for mangaDocumentChange in snap.documentChanges{
//                    switch mangaDocumentChange.type{
//                    case .added:
//                        
//                        
//                        if let data =  try? JSONSerialization.data(withJSONObject: mangaDocumentChange.document.data(), options: []){
//                            if let manga = try? self.jsonDecoder.decode(Manga.self, from: data){
//                                self.mangas.append( manga)
//                                self.tableView.insertRows(at: [IndexPath(row: self.mangas.count - 1, section: 0)], with: .automatic)
//                            }
//                            
//                        }
//                        
//                        break
//                        
//                    case .modified:
//                        
//                        if let data =  try? JSONSerialization.data(withJSONObject: mangaDocumentChange.document.data(), options: []){
//                            if let manga = try? self.jsonDecoder.decode(Manga.self, from: data){
//                                
//                                if let edited =  self.mangas.index(where: { (m) -> Bool in
//                                    m.Id == manga.Id
//                                }){
//                                    self.mangas[edited] = manga
//                                    self.tableView.reloadRows(at: [IndexPath(row: edited, section: 0)], with: .automatic)
//                                }
//                            }
//                            
//                        }
//                        
//                        break
//                        
//                    case .removed:
//                        let id = mangaDocumentChange.document.data()["Id"] as! Int
//                        
//                        if let deleted = self.mangas.index(where: { (manga) -> Bool in
//                            manga.Id == id
//                        }){
//                            self.mangas.remove(at: deleted)
//                            self.tableView.deleteRows(at: [IndexPath(row: deleted, section: 0)], with: .automatic)
//                            
//                        }
//                        
//                        break
//                    }
//                }
//                
//                self.tableView.endUpdates()
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //bar button item
        let add = UIBarButtonItem(title: "vai", style: .plain, target: self, action: #selector(addPressed))
//        add.tintColor = .black
        self.navigationItem.rightBarButtonItem = add
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        let mangas = Firestore.firestore().collection("Manga")
//
//
//
//        mangas.addSnapshotListener { (mangasSnapshot, error) in
//            if let e = error{
//                print("erro: \(e.localizedDescription)")
//            }
//
//            guard let mangas = mangasSnapshot else { return }
//
//            for m in mangas.documents{
//                print(m.data()["Title"])
//            }
//        }
//
//        let item = mangas.document("One Piece")
//
//        item.getDocument { (snapshot, error) in
//            if let e = error{
//                print(e.localizedDescription)
//            }else{
//                if let snap = snapshot, snapshot!.exists{
//                    let data = snap.data()
//
//                    let title = data?["Title"] as? String ?? ""
//
//                    print(title)
//                }
//
//            }
//        }
//
//        let newData  : [String : Any] = ["Title" : "Naruto mudou", "Id": 1]
//
//        mangas.document("Naruto").setData(newData) { (error) in
//            if let e = error{
//                print(e.localizedDescription)
//            }
//        }
        
//        Firestore.firestore().collection("Manga").addDocument(data: ["teste" : 1, "Id" : 124, "Title" : "teste"])
        
        
    }

    @objc
    func addPressed(){
        let addEditViewController = instantiateViewController(withType: AddEditMangaViewController.self)
        self.navigationController?.pushViewController(addEditViewController, animated: true)
//        performSegue(withIdentifier: "addMangaSegue", sender: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mangas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mangaCell")
        
        
        (cell?.subviews[0].subviews[0] as! UILabel).text = mangas[indexPath.row].Title
        
        return cell!
    }

}










class HomeTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}




