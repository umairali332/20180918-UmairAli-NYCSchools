//
//  MediaAPIRouters.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation
import AlamofireNetworkLayer

struct MediaAPIRouter : BaseUrlRouter {
    
    struct School : Readable {
        
        var route: String {
            
            get{
                return MediaAPIRouter.basePath + APIURLs.Paths.schoolSearch
            }
            set{
                
            }
        }
    }
    
    struct SchoolDetails : Readable {
        
        var route: String {
            
            get{
                return MediaAPIRouter.basePath + APIURLs.Paths.schoolDetailSearch
            }
            set{
                
            }
        }
    }
}
