//
//  DetailController.swift
//  Researchcoatal
//
//  Created by Peerapun Sangpun on 7/10/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit
class DetailCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


class DetailController: UITableViewController {

    var research: Research!
    var data = [DataInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("obj\(research)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        do {
           
 
            
            
            data = [
                DataInfo(title: "รหัสทะเบียนวิจัย", subtitle:  (research.register_code)),
                DataInfo(title: "ฉบับที่", subtitle:  research.page_th),
                DataInfo(title: "ชื่องานวิจัย", subtitle:  research.name_th),
                DataInfo(title: "ชื่อผู้วิจัย", subtitle:  research.researcher_th.stringByReplacingOccurrencesOfString("<br>", withString: ",")),
                DataInfo(title: "หน่วยงาน", subtitle:  research.unit_th),
                DataInfo(title: "สังกัดหน่วยงาน", subtitle:  research.section_th),
                DataInfo(title: "ชื่อกรม", subtitle:  research.department_th),
                DataInfo(title: "ชื่อกระทรวง", subtitle:  research.ministry_th),
                DataInfo(title: "เลขที่ตั้งหน่วยงาน", subtitle:  "\(research.address_th) ต.\(research.sub_district_th) อ.\(research.district_th) \(research.province_th) \(research.zipcode)"),
                DataInfo(title: "เบอร์โทรศัพท์ ", subtitle:  research.telephone),
                DataInfo(title: "เบอร์โทรสาร ", subtitle:  research.fax),
                DataInfo(title: "ปี พ.ศ.", subtitle: research.year ),
                DataInfo(title: "ไฟล์งานวิจัยฉบับย่อ", subtitle: research.filename_small_th ,value: research.path_small_en),
                DataInfo(title: "ไฟล์งานวิจัยฉบับเต็ม", subtitle: research.filename_full ,value: research.path_full)
            ]
            
        }
        catch let error as NSError {
            print("Error is: \(error)")
        }
        tableView.estimatedRowHeight = 89
        tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailCell
        cell.labelText.text=data[indexPath.row].title
        cell.labelDetail?.text = data[indexPath.row].subtitle
        cell.accessoryType = .None
        if indexPath.row == 12 || indexPath.row == 13 {
            cell.imageView!.image = UIImage(named:"marker")
            cell.accessoryType = .DisclosureIndicator;
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
         if indexPath.row == 12 || indexPath.row == 13 {
          
             let vc1:PdfController = self.storyboard!.instantiateViewControllerWithIdentifier("pdf") as! PdfController
             vc1.filename = data[indexPath.row].value
             self.navigationController!.pushViewController(vc1, animated: true)
         }
        
        
    }
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
  
}
