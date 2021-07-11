//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by ilabrosimov on 06.07.2021.
//

import UIKit


final  class TaskViewController: UITableViewController {
    
    private let cellIdentifier = "Cell"
    private var tasks: [Task] = CoreDataManager.shared.fetchTasks()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        setupNavigationBar()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
      tasks = CoreDataManager.shared.fetchTasks()
        tableView.reloadData()
    }
 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        CoreDataManager.shared.deleteTask(task: tasks[indexPath.row])
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
      
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

