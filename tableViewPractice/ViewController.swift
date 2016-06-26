//
//  ViewController.swift
//  tableViewPractice
//
//  Created by xionghuanxin on 6/24/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var labelText : [ String : [String] ] = Dictionary()
    lazy var tableView : UITableView = {
        let aView = UITableView(frame: UIScreen.mainScreen().bounds , style: UITableViewStyle.Plain )
        aView.center.y = aView.center.y + 100
        aView.delegate = self
        aView.dataSource = self
        aView.registerClass(CustomTableViewCell.classForCoder(), forCellReuseIdentifier: String(CustomTableViewCell))
        
        return aView
    }()
    
    var dataSource : [ String : [ String ]] = NSDictionary(contentsOfFile:NSBundle.mainBundle().pathForResource("Property List", ofType: "plist")!) as! [String : [String]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText = dataSource
        self.view.addSubview(tableView)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "添加", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(leftButtonTaped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: .Plain, target: self, action: #selector(rightButtonTaped))
        
        
    }
    func rightButtonTaped() {
        tableView.setEditing(!tableView.editing, animated: true)
        self.navigationItem.rightBarButtonItem?.title = tableView.editing ? "确定":"编辑"
    }
    func leftButtonTaped() {
        labelText["label1"]?.append(dataSource["label1"]![(labelText["label1"]!.count + 1)%4])
        labelText["label2"]?.append(dataSource["label2"]![(labelText["label2"]!.count + 1)%4])
        labelText["imageName"]?.append(dataSource["imageName"]![(labelText["imageName"]!.count + 1)%4])
        self.tableView.reloadData()
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelText["label1"]!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier(String(CustomTableViewCell), forIndexPath: indexPath) as! CustomTableViewCell
        cell.titleLabel.text = labelText["label1"]![indexPath.row]
        cell.discribe.text = labelText["label2"]![indexPath.row]
//        cell.headImage.image  = UIImage(contentsOfFile: "SettingImages/appmodule_Flashlight@2x.png")
//        cell.headImage.image = UIImage(named: "appmodule_Flashlight@2x.png")
        print(labelText["imageName"]![indexPath.row])
//        let a = NSBundle.mainBundle().pathForResource(labelText["imageName"]![indexPath.row], ofType: "png",inDirectory: "SettingImages/")
        print(NSBundle.mainBundle().pathForResource(labelText["imageName"]![indexPath.row], ofType: "png", inDirectory: "SettingImages"))
        
//        cell.headImage.image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(labelText["imageName"]![indexPath.row], ofType: "png",inDirectory: "/SettingImages")!)
        return cell
        
    }
}

extension ViewController: UITableViewDelegate {
    //    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    //        return true
    //    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            labelText["label1"]!.removeAtIndex(indexPath.row)
            labelText["label2"]!.removeAtIndex(indexPath.row)
            labelText["imageName"]!.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
}

