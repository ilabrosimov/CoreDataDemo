//
//  File.swift
//  CoreDataDemo
//
//  Created by ilabrosimov on 06.07.2021.
//

import UIKit

final class NewTaskViewController:  UIViewController, UITextFieldDelegate {
   
    
    private lazy var textField: UITextField = {
        let textField = UITextField()

        textField.borderStyle = .roundedRect
        textField.placeholder = "Add new task"
        return textField
    }()
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor  = .blue
        button.setTitle("Save", for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor  = .white
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        return button
    }()
    
   
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor  = .systemPink
        button.setTitle("Cancel", for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor  = .white
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }()
  
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        addSubviews(with: [textField, saveButton, cancelButton])
        setConstraints()
        textField.becomeFirstResponder()
        textField.delegate = self
        
    }
}

extension NewTaskViewController {
    //MARK: - Add Subviews
    private func addSubviews(with views: [UIView]) {
        views.forEach { item in
            view.addSubview(item)
        }
    }
    
    
   
    //MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTapped()
        return true
    }
    //MARK: - Add Constraints
    private func setConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                                     textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                                     textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
                                     
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([saveButton.topAnchor.constraint(equalTo: textField.topAnchor, constant: 50),
                                     saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                                     saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cancelButton.topAnchor.constraint(equalTo: saveButton.topAnchor, constant: 50),
                                     cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                                     cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
  
    @objc func saveTapped () {
        guard let text = textField.text else {return}
        CoreDataManager.shared.saveTasks(text: text)
        
        dismiss(animated: true, completion: nil)
       }
       
    @objc func cancelTapped () {
        dismiss(animated: true, completion: nil)
    }
}
