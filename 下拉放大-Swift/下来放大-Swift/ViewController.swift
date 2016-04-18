//
//  ViewController.swift
//  下来放大-Swift
//
//  Created by zjwang on 16/4/18.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
let iconMargin: CGFloat = 10.0
let iconW: CGFloat = 80.0
let iconH: CGFloat = 80.0
let cellIdientifier = "cellIdentifier"
let screenHeight = UIScreen.mainScreen().bounds.size.height
let screenWidth = UIScreen.mainScreen().bounds.size.width
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    var imageTopView = UIImageView()
    var imageIcon = UIImageView()
    var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createSubviews()
        // 调整tableview的位置
        self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        // 把图片设置到对应位置上
        imageTopView = UIImageView.init(frame: CGRectMake(0, 0, screenWidth, 200))
        // 把加载的图片设置需要的大小
        let oldImage = UIImage.init(named: "1111")
        imageTopView.image = self.originImagescaleToSize(oldImage!, size: CGSizeMake(screenWidth, 200))
        // 这里是为了让图片宽度随着高度的拉伸而拉伸
        imageTopView.contentMode = UIViewContentMode.ScaleAspectFill;
        self.view.addSubview(imageTopView)
        imageIcon = UIImageView.init(frame: CGRectMake(iconMargin, 200 - (iconMargin + iconH), iconW, iconH))
        imageIcon.layer.cornerRadius = 7.5;
        imageIcon.image = UIImage.init(named: "01")
        imageIcon.clipsToBounds = true;
        //自动布局，自适应顶部
        imageIcon.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin
        imageTopView.addSubview(imageIcon)
        
    }
    // 设置图片的大小
    func originImagescaleToSize(image: UIImage, size: CGSize)->UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let scaleImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaleImage
    }
    func createSubviews()
    {
        tableView = UITableView.init(frame: CGRectMake(0, 0, screenWidth, screenHeight), style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdientifier)
        self.view.addSubview(tableView)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdientifier)
        cell?.textLabel?.text = "\(indexPath.row): cell 测试"
        return cell!
    }
    // 监听滚动
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // 偏移量y的变化
        let y: CGFloat = scrollView.contentOffset.y;
        print("y ------ \(y)")
        if y < -200 {
            var frame: CGRect = self.imageTopView.frame;
            frame.size.height = -y;
            self.imageTopView.frame = frame;
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

