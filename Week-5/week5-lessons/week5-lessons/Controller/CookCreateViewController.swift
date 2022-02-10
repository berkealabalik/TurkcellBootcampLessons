//
//  CookCreateViewController.swift
//  week5-lessons
//
//  Created by Berke Alabalik on 5.02.2022.
//

import UIKit
import CoreData

class CookCreateViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var cookImage: UIImageView!
    @IBOutlet weak var cookName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cookImage.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        cookImage.addGestureRecognizer(tapRecognizer)
    }
   @objc func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil) // completion seçtikten sonra özel birşey istiyorsak .
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cookImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func insertCook(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let newCook = NSEntityDescription.insertNewObject(forEntityName: "Cooks", into: context) // bu 3 her uygulam aynı entity name değişir .
        
        newCook.setValue(cookName.text, forKey: "name") // datada yazdıgımız name forkey
        let imageData = cookImage.image?.jpegData(compressionQuality: 0.5)
        newCook.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
        } catch  {
            print("Veri Kaydedilemedi")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
  

}

