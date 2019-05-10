//
//  ViewController.swift
//  PrimeiroApp
//
//  Created by Anderson Oliveira on 07/05/19.
//  Copyright © 2019 andersonOliveira. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var objectLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(LendingService.shared.lendings.count)
    }

    private func setupStyle() {
        baseView.layer.cornerRadius = 5
        saveButton.layer.cornerRadius = 5
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let name = nameLabel.text,
            !name.isEmpty,
            let object = objectLabel.text,
            !object.isEmpty
        else {
            return
        }
        let lending = Lending(name: name, object: object, date: datePicker.date)

        var lendings = LendingService.shared.lendings
        lendings.append(lending)
        LendingService.shared.lendings = lendings
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
