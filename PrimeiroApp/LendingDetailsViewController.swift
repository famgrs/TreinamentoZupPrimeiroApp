//
//  LendingDetailsViewController.swift
//  PrimeiroApp
//
//  Created by TI Corporativa on 21/05/19.
//  Copyright © 2019 andersonOliveira. All rights reserved.
//

import UIKit

class LendingDetailsViewController: UIViewController {

    @IBOutlet weak var objectField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var updateButton: UIButton!
    
    var lending: Lending?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fill(lending)
    }
    
    private func fill(_ lending: Lending?) {
        guard let lending = lending else { return }
        objectField.text = lending.object
        nameField.text = lending.name
        datePicker.setDate(lending.date, animated: true)
    }
    

    @IBAction func updateTapped(_ sender: Any) {
        guard let name = nameField.text,
            !name.isEmpty,
            let object = objectField.text,
            !object.isEmpty
        else { return }
        let updatedLending = Lending(name: name, object: object, date: datePicker.date)

//        LendingService.shared.lendings
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
