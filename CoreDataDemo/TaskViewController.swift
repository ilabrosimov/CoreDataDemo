//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by ilabrosimov on 06.07.2021.
//

import UIKit

final  class TaskViewController: UITableViewController {
    let cellIdentifier = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
       setupNavigationBar()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "# \(indexPath.row)"
        return cell
    }
    
    private func  setupNavigationBar() {
        title = "Task"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationBarAppeareance = UINavigationBarAppearance()
        navigationBarAppeareance.configureWithOpaqueBackground()
        
        navigationBarAppeareance.titleTextAttributes =  [.foregroundColor: UIColor.white]
        navigationBarAppeareance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationBarAppeareance.backgroundColor = UIColor(red: 21/255, green: 101/255, blue: 192/255, alpha: 194/255)
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppeareance
        navigationController?.navigationBar.scrollEdgeAppearance =  navigationBarAppeareance
        
        //addButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    @objc func addTask () {
        let newTaskController = NewTaskViewController()
        newTaskController.modalPresentationStyle = .fullScreen
        present(newTaskController, animated: true, completion: nil)
        
        
    }

}

