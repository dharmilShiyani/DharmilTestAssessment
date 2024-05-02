//
//  ModelData.swift
//  DharmilIOSTestAssessment
//
//  Created by Shiyani on 02/05/24.
//

import Foundation

class ModelData{

	var body : String
	var id : Int
	var title : String
	var userId : Int


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		body = dictionary["body"] as? String ?? ""
		id = dictionary["id"] as? Int ?? Int()
		title = dictionary["title"] as? String ?? ""
		userId = dictionary["userId"] as? Int ?? Int()
	}

}
