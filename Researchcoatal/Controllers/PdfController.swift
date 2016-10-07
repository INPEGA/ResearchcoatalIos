//
//  PdfController.swift
//  Researchcoatal
//
//  Created by Peerapun Sangpun on 7/14/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//


import UIKit

class PdfController: UIViewController {
    
    
    
    @IBOutlet weak var webView: UIWebView!
    var filename:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        let url : NSURL! = NSURL(string:filename)
        webView.scalesPageToFit = true
        webView.loadRequest(NSURLRequest(URL: url))
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
