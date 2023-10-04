
import Foundation

//Automatic Reference Counting

class Resolution {

    var height: Int
    var width: Int
    
    init(height: Int, width: Int) {
        self.height = height
        self.width = width
    }
}

var hd: Resolution? = Resolution(height: 1080, width: 1920)  // ARC +1

//
var cinema = hd  //Arc +1

hd = nil // ARC -1
cinema = nil // ARC -1

//Resolution is free -- Liberada de memoria



