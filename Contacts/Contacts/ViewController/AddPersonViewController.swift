//
//  AddPersonViewController.swift
//  Contacts
//
//  Created by Lagarde Quentin on 17/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit
import CoreData

class AddPersonViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet var prenomsTextFields: [UITextField]!
    @IBOutlet weak var dateNaissancePicker: UIDatePicker!
    
    var image : UIImage?
    
    let pickerController = UIImagePickerController()
    
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.nomTextField.addTarget(self, action: #selector(onTextChange), for: .editingChanged)
        
        self.prenomsTextFields[0].addTarget(self, action: #selector(onTextChange), for:.editingChanged)
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(AddPersonViewController.onLongPressDetected(gesture:)));
        longPressGestureRecognizer.requiresExclusiveTouchType = true;
        self.view.addGestureRecognizer(longPressGestureRecognizer);
        
        self.title = "Ajouter une personne"
        
        pickerController.sourceType = .savedPhotosAlbum; // .photoLibrary | .savedPhotosAlbum 3.
        pickerController.delegate = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Segue management
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if(segue.identifier == "detailPersonSegue") {
        //            let newPerson = Personne();
        //            newPerson.nom = self.nomTextField.text!;
        //            newPerson.prenoms = [self.prenomsTextFields[0].text!,
        //                                 self.prenomsTextFields[1].text!,
        //                                 self.prenomsTextFields[2].text!
        //            ];
        //            newPerson.dateNaissance = self.dateNaissancePicker.date;
        //
        //            let personDetailViewController = segue.destination as! PersonneDetailViewController;
        //            personDetailViewController.personne = newPerson;
        //
        //        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //        if(identifier == "detailPersonSegue") {
        //            return self.validate();
        //        }
        return true;
    }
    
    
    func validate() -> Bool {
        var result = true;
        result = result && !(self.nomTextField.text!.isEmpty);
        result = result && !(self.prenomsTextFields[0].text!.isEmpty);
        return result;
    }
    
    func onTextChange()
    {
        self.validateButton.isEnabled = self.validate();
    }
    
    func onLongPressDetected(gesture: UILongPressGestureRecognizer) {
        if (gesture.state == .began){
            //in your case add your functionality over here
            displayResetView();
        }
        else if (gesture.state == .ended) {
            //if you want to add some more functionality when gesture got ended.
            
        }
        
    }
    
    @IBAction func onResetClick(_ sender: AnyObject) {
        self.displayResetView();
    }
    
    func displayResetView() {
        //1. Ajouter une vue blanche par dessus la vue du ViewController
        let whiteView = UIView(frame: .zero);
        whiteView.backgroundColor = UIColor.white;
        self.view.addSubview(whiteView);
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: whiteView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: whiteView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        let leftConstraint = NSLayoutConstraint(item: whiteView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: whiteView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0)
        
        self.view.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
        
        //2. Une fois ajoutée, réinitialiser tous les champs
        self.resetFields();
        
        //3. Appeler une méthode au bout de 0,5seconde qui supprime la vue ajoutée en 1.
        self.perform(#selector(AddPersonViewController.dismissView(view:)), with: whiteView, afterDelay: 0.0);
    }
    
    private func resetFields() {
        self.nomTextField.text = "";
        self.prenomsTextFields[0].text = "";
        self.prenomsTextFields[1].text = "";
        self.prenomsTextFields[2].text = "";
        self.dateNaissancePicker.date  = Date();
    }
    
    func dismissView(view: UIView) {
        UIView.animate(withDuration:0.5,
                       delay: 0.0,
                       animations: { () -> Void in
                        view.alpha = 0.0
            },
                       completion: { (finished: Bool) -> Void in
                        view.removeFromSuperview()
        })
        
    }
    
    @IBAction func onValidateButtonClicked(_ sender: AnyObject) {
        let isValid = self.validate();
        if(isValid) {
            // Ajouter l'objet personne à la liste de personnes de l'écran table view
            let newPerson = Personne.mr_createEntity()!;
            newPerson.nom = self.nomTextField.text!;
            newPerson.prenoms = [self.prenomsTextFields[0].text!,
                                 self.prenomsTextFields[1].text!,
                                 self.prenomsTextFields[2].text!
            ];
            newPerson.dateNaissance = self.dateNaissancePicker.date as NSDate;
            newPerson.imageProfil = UIImagePNGRepresentation(self.image!)! as NSData?
            let nationalite = Pays.mr_findFirst()!;
            newPerson.addToPays(nationalite);
            nationalite.addToPersonne(newPerson);
            
            
            NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait();
            
            self.navigationController!.popViewController(animated: true);
        }
        else {
            // Afficher une popup disant que la personne n'est pas valide
        }
        
    }
    
    @IBAction func onChoosePictureClick(_ sender: AnyObject) {
        self.present(self.pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.pickerController.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController.dismiss(animated: true, completion: nil)
    }
}
