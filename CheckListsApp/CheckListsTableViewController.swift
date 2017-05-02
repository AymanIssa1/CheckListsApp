//
//  CheckListsTableViewController.swift
//  CheckListsApp
//
//  Created by LinuxPlus on 5/1/17.
//  Copyright © 2017 Ayman. All rights reserved.
//

import UIKit

class CheckListsTableViewController: UITableViewController, CheckListItemViewControllerDelegate {
    
    public static var checkLists :[CheckList] = []
    
    var selectedRow:Int?

    
    required init?(coder aDecoder: NSCoder) {
        CheckListsTableViewController.checkLists = []
        
        let row0item = CheckList(checkListName: "Play Tennis")
        let row1item = CheckList(checkListName: "Play Football")
        let row2item = CheckList(checkListName: "Learn iOS Development")
        
        CheckListsTableViewController.checkLists.append(row0item)
        CheckListsTableViewController.checkLists.append(row1item)
        CheckListsTableViewController.checkLists.append(row2item)
        
        let row0SubItem = CheckListItem(text: "test 1")
        let row1SubItem = CheckListItem(text: "test 2")
        let row2SubItem = CheckListItem(text: "test 3")
    
        CheckListsTableViewController.checkLists[0].checkListItems.append(row0SubItem)
        CheckListsTableViewController.checkLists[0].checkListItems.append(row1SubItem)
        CheckListsTableViewController.checkLists[0].checkListItems.append(row2SubItem)
    
        CheckListsTableViewController.checkLists[1].checkListItems.append(row0SubItem)
        CheckListsTableViewController.checkLists[1].checkListItems.append(row1SubItem)
        CheckListsTableViewController.checkLists[1].checkListItems.append(row2SubItem)
        
        CheckListsTableViewController.checkLists[2].checkListItems.append(row0SubItem)
        CheckListsTableViewController.checkLists[2].checkListItems.append(row1SubItem)
        CheckListsTableViewController.checkLists[2].checkListItems.append(row2SubItem)
        
        
        super.init(coder: aDecoder)
    }

    
    @IBAction func addCheckList(_ sender: Any) {
    
    }
    
    func addItemViewController(_ controller: AddCheckListTableViewController, didfinishAdding item: CheckList) {
        let newRowIndex = CheckListsTableViewController.checkLists.count
        
        CheckListsTableViewController.checkLists.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        print("addItemViewController")
    }
    
    func addItemViewControllerDidCancel(_ controller: AddCheckListTableViewController) {
        print("addItemViewControllerDidCancel")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CheckListsTableViewController.checkLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath) as! CheckListItemCell

        let item = CheckListsTableViewController.checkLists[indexPath.row]
        cell.checkListLabel.text = item.checkListName
        
        
        return cell
    }
    
    // swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        CheckListsTableViewController.checkLists.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CheckListDetailsTableViewController.itemindex = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemIdentifier" {
            if let navigationController = segue.destination as? UINavigationController {
                let controller = navigationController.topViewController! as! AddCheckListTableViewController
                controller.delegate = self as? CheckListItemViewControllerDelegate
            }
        } else if segue.identifier == "SubItemIdentifier" {
            if let navigationController = segue.destination as? UINavigationController {
                let controller = navigationController.topViewController! as! CheckListDetailsTableViewController

            
            }
        }

    }
 
    func configureText(for cell:CheckListItemCell,at indexPath: IndexPath) {
        let item = CheckListsTableViewController.checkLists[indexPath.row]
        cell.checkListLabel.text = item.checkListName
    }
    
}
