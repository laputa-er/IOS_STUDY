//
//  UserTableViewController.swift
//  L0201_创建使用CoreData的项目
//
//  Created by TonyEarth on 16/4/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import CoreData

class UserTableViewController: UITableViewController {
    // 存放数据库信息
    var dataArr:Array<AnyObject> = []
    // 数据库上下文
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 数据库上下文
        context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        // 2. 为 Users 表插入一行数据
        // 创建一行（字段为默认值）
        let row:AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext:context)
        // 设置 name 字段
        row.setValue("jikexueyuan", forKey:"name")
        // 设置 age 字段
        row.setValue(10, forKey: "age")
        
        //3. 持久化
        do {
            try context.save()
        }
        catch {
            print("insert Error")
        }
        
        refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArr.count
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let data = dataArr[indexPath.row] as! NSManagedObject
        let vc = storyboard?.instantiateViewControllerWithIdentifier("UserContent") as! UserContentViewController
        vc.data = data
        presentViewController(vc, animated: true, completion: nil)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)// storyboard 中 identifier设置为"cell"的cell

        // Configure the cell...
        let label = cell.viewWithTag(2) as! UILabel// storyboard 中 tag 设置为2的label
        let name:AnyObject! = dataArr[indexPath.row].valueForKey("name")
        let age:AnyObject! = dataArr[indexPath.row].valueForKey("age")
        label.text = "name:\(name), age:\(age)"
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // 删除 table 中的一个cell
        if editingStyle == .Delete {
            // 删除数据
            context.deleteObject(dataArr[indexPath.row] as! NSManagedObject)
            // 持久化
            do {
                try context.save()
            }
            catch {
                print("删除数据失败")
            }
            refreshData()
        }
        // 向 table 中插入一条 cell
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func refreshData() {
        let f = NSFetchRequest(entityName: "Users")
        do {
            try dataArr = context.executeFetchRequest(f)
            tableView.reloadData()
            print(dataArr)
        }
        catch {
            print("数据查询失败")
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        refreshData()
    }
}
