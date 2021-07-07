//
//  CoreDataModel.swift
//  CoreDataDemo
//
//  Created by ilabrosimov on 07.07.2021.
//
import UIKit
import CoreData
// MARK: - Core Data stack
class CoreDataManager {
    static var shared = CoreDataManager()
    private init() {
        
    }
    
    func fetchTasks (complition: @escaping ([Task])->()) {
        
        guard let viewContext = getViewContext() else {return}
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            let tasks = try viewContext.fetch(fetchRequest)
            complition(tasks)
            
        } catch let error {
            print(error)
        }
        
    }
    
    func saveTasks (text: String) {
        
        guard let viewContext = getViewContext() else {return}
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: viewContext) else {return}
        guard let task = NSManagedObject(entity: entityDescription, insertInto: viewContext) as? Task else {return}
        task.title = text
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error {
                print(error)
            }
        }
    }
    
    func deleteTask (task: Task) {
        
        guard let viewContext = getViewContext() else {return}
        viewContext.delete(task)
        }
    
    
    
    private func getViewContext() -> NSManagedObjectContext? {
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext ?? nil
    }

}
