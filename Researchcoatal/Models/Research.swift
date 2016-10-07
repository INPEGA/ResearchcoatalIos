//
//  Research.swift
//  Researchcoatal
//
//  Created by Peerapun Sangpun on 7/9/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import Foundation
import RealmSwift
class Research: Object { // [2]
    dynamic var register_code = ""
    dynamic var page_th = ""
    dynamic var page_en = ""
    dynamic var name_th = ""
    dynamic var name_en = ""
    dynamic var researcher_th = ""
    dynamic var researcher_en = ""
    dynamic var unit_th = ""
    dynamic var unit_en = ""
    dynamic var section_th = ""
    dynamic var section_en = ""
    dynamic var department_th = ""
    dynamic var department_en = ""
    dynamic var ministry_th = ""
    dynamic var ministry_en = ""
    dynamic var keyword_th = ""
    dynamic var keyword_en = ""
    dynamic var address_th = ""
    dynamic var address_en = ""
    
    dynamic var sub_district_th = ""
    dynamic var sub_district_en = ""
    dynamic var district_th = ""
    dynamic var district_en = ""
    dynamic var province_th = ""
    dynamic var province_en = ""
    dynamic var zipcode = ""
    dynamic var zipcode2 = ""
    dynamic var telephone = ""
    dynamic var telephone2 = ""
    
    
    dynamic var fax = ""
    dynamic var fax2 = ""
    dynamic var year = ""
    dynamic var year2 = ""
    dynamic var year3 = ""
    
    dynamic var filename_small_th = ""
    dynamic var filename_small_en = ""
    dynamic var filename_full = ""
    dynamic var path_small_th = ""
    dynamic var path_small_en = ""
    dynamic var path_full = ""
    
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    dynamic var distance = ""
    
}