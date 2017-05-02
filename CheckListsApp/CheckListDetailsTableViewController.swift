//
//  CheckListDetailsTableViewController.swift
//  CheckListsApp
//
//  Created by LinuxPlus on 5/1/17.
//  Copyright © 2017 Ayman. All rights reserved.
//

import UIKit

class CheckListDetailsTableViewController: UITableViewController, CheckListDetailItemViewControllerDelegate {
    
    public static var itemindex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems.count)

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    func addItemViewController(_ controller: AddCheckListDetailItemTableViewController, didfinishAdding item: CheckListItem) {
        let newRowIndex = CheckListsTableViewController.checkLists.count
        
        CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)

    }
    
    func addItemViewController(_ controller: AddCheckListDetailItemTableViewController, didFinishEditing item: CheckListItem) {
        let newRowIndex = CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems.index(of: item)
        
        let indexPath = IndexPath(row: newRowIndex!, section: 0)
        let indexPaths = [indexPath]
        
        tableView.reloadRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        
    }
    
    func addItemViewControllerDidCancel(_ controller: AddCheckListDetailItemTableViewController) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListDetailsItemIdentifier", for: indexPath) as! CheckListDetailItemCell
        
        let item = CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems[indexPath.row]
        cell.textLabel?.text = item.text
        
        configureCheckmark(for: cell,checked: item.checked)
        
        return cell
    }
    
    func configureCheckmark(for cell:CheckListDetailItemCell,checked:Bool) {
        cell.itemChecked.text = checked ? "✔︎" : " "
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let checkListItem = CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems[indexPath.row]

        checkListItem.toggleCheck()
        
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckmark(for: cell as! CheckListDetailItemCell, checked: checkListItem.checked)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDetailItemIdentifier" {
            if let navigationController = segue.destination as? UINavigationController {
                let controller = navigationController.topViewController! as! AddCheckListDetailItemTableViewController
                controller.delegate = self as? CheckListDetailItemViewControllerDelegate
            }
        } else if segue.identifier == "editDetailItemIdentifier" {
            if let navigationController = segue.destination as? UINavigationController {
                let controller = navigationController.topViewController! as! AddCheckListDetailItemTableViewController
                controller.delegate = self as? CheckListDetailItemViewControllerDelegate
                
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                    controller.itemToEdit = CheckListsTableViewController.checkLists[CheckListDetailsTableViewController.itemindex].checkListItems[indexPath.row] as CheckListItem
                }
            }
        }
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


