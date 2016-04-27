//
//  ViewController.swift
//  Swift滑动视图隐藏导航栏
//
//  Created by zjwang on 4/27/16.
//  Copyright © 2016 夏天. All rights reserved.
//

import UIKit
let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenHeight = UIScreen.mainScreen().bounds.size.height
let cellIdentifier = "cellId"
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    var customView = UIView()
    var btn = UIButton()
    var recordDistance: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGrayColor()
        self.createSubviews()
        self.title = "我是一个测试页"
        self.createCustomView()
    }
    func createCustomView()
    {
        customView = UIView.init(frame: CGRectMake(0, 44, screenWidth, 30))
        customView.backgroundColor = UIColor.lightGrayColor()
        self.navigationController?.navigationBar.addSubview(customView)
        
        btn = UIButton.init(type: UIButtonType.Custom)
        btn.frame = CGRectMake(screenWidth - 70, 5, 40, 20)
        btn.backgroundColor = UIColor.greenColor()
        btn.setTitle("关注", forState: UIControlState.Normal)
        btn.titleLabel!.font = UIFont.systemFontOfSize(13)
        customView.addSubview(btn)
    }
    // 创建tableview
    func createSubviews()
    {
        let tableView = UITableView.init(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(tableView)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        cell?.textLabel?.text = "我是一个测试数据\(indexPath.row)"
        return cell!
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.recordDistance = scrollView.contentOffset.y
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollView.contentOffset.y > self.recordDistance ? scrollView.contentOffset.y < self.recordDistance ? self.navigationController?.setNavigationBarHidden(false, animated: true):self.navigationController?.setNavigationBarHidden(true, animated: true) : self.navigationController?.setNavigationBarHidden(false, animated: true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

