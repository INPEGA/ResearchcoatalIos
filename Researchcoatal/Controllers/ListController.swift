//
//  NearByController.swift
//  Swift-Base
//
//  Created by Peerapun Sangpun on 5/15/2559 BE.
//  Copyright © 2559 Flatstack. All rights reserved.
//

import UIKit
import RealmSwift

class PropertyCell: UITableViewCell {
   
 
    
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



class ListController  :  UITableViewController,UISearchResultsUpdating , UISearchBarDelegate{
    var imageCache = [String:UIImage]()
    var researchs:Results<Research>?
    var filtered:Results<Research>?
    var data: NSArray?
    var searchActive : Bool = false
    
    var resultSearchController =  UISearchController()
  
    //@IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideKeyboardWhenTappedAround()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "งานวิจัยด้านการประมงชายฝั่ง"
        //let tempImageView = UIImageView(image: UIImage(named: "background"))
        //tempImageView.frame = self.tableView.frame
        //self.tableView.backgroundView = tempImageView;
        //self.tableView.separatorColor = UIColor.clearColor()
        //UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchController.self]).textColor = UIColor.whiteColor()

        tableView.estimatedRowHeight = 89
        tableView.rowHeight = UITableViewAutomaticDimension
        //searchBar.delegate = self
        
        do {
            let realm = try Realm()
            
            
            researchs = realm.objects(Research)
        } catch _ as NSError {
            // handle error
        }

        if #available(iOS 9.0, *) {
            self.resultSearchController.loadViewIfNeeded()// iOS 9
        } else {
            // Fallback on earlier versions
            let _ = self.resultSearchController.view          // iOS 8
        }
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.hidesNavigationBarDuringPresentation = true
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.delegate = self
            //controller.searchBar.tintColor = UIColor.whiteColor()
            //controller.searchBar.barTintColor = UIColor.whiteColor()
            controller.searchBar.searchBarStyle = .Prominent
            controller.searchBar.sizeToFit()
            controller.searchResultsUpdater = self
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        
        self.tableView.reloadData()
        
    }
 
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        if searchController.searchBar.text?.characters.count > 0 {
            
            let predicate = NSPredicate(format: "name_th+register_code CONTAINS [c]%@", searchController.searchBar.text!);
            do {
                filtered = try Realm().objects(Research).filter(predicate).sorted("name_th", ascending: true)
            } catch {
                
            }
            
        }
        else {
              filtered = researchs
        }
       self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
 
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            return filtered!.count
        }
        return (researchs?.count)!;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("PropertyCell", forIndexPath: indexPath) as! PropertyCell
         let research: Research
        if(self.resultSearchController.active){
            research = filtered![indexPath.row] as Research
        } else {
            research = researchs![indexPath.row] as Research
        }
        
        //let contact: Contact = self.data![indexPath.row] as! Contact
        cell.labelText?.text =   "\(research.name_th)#\(research.register_code)"
        cell.labelDetail?.text = "ผู้วิจัย:"+research.researcher_th.stringByReplacingOccurrencesOfString("<br>", withString: ",")
      
        
        return cell
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "researchDetail" {
            let destination = segue.destinationViewController as? DetailController
            let research: Research?
            let  index = tableView.indexPathForSelectedRow?.row
            if(self.resultSearchController.active){
                research = filtered![index!] as Research
            } else {
                research = researchs![index!] as Research
            }
            destination?.research = research
        }
    }
    
}

