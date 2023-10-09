import UIKit


do {
    //Queremos almacenar el ph del agua en una variable ph. Es un valor entero entre 0 y 14
    struct Agua {
        //    var ph: Double { // 0 - 14
        //        willSet {
        //            if newValue < 0 {
        //                ph = 0
        //            } else if newValue > 14 {
        //                ph = 14
        //            }
        //        }
        //    }
        
        private(set) var ph: Double  //Cuando alguien quiera acceder al ph lo lleva a la función setPh
        
        mutating func setPh(_ ph: Double) {
            if ph < 0 {
                self.ph = 0
            } else if ph > 14 {
                self.ph = 14
            } else {
                self.ph = ph
            }
        }
    }
    
    var agua = Agua(ph: 7)
    
    print(agua.ph)
//    agua.ph = 11 <- Deseable
    agua.setPh(12)
    print(agua.ph)
    agua.setPh(20)
    print(agua.ph)
}

print("=============")

do {
    struct PH {
        private(set) var value: Double
        
        mutating func setValue(_ value: Double) {
            if value < 0 {
                self.value = 0
            } else if value > 14 {
                self.value = 14
            } else {
                self.value = value
            }
        }
    }
    
    struct Agua {
        var ph: PH
    }
    
    var agua = Agua(ph: PH(value: 6))
    
    print(agua.ph.value)
    agua.ph = PH(value: 3)
    print(agua.ph.value)
    agua.ph.setValue(8)
    print(agua.ph.value)
    agua.ph.setValue(-10)
    print(agua.ph.value)
}

print("=============")


do {
    @propertyWrapper
    struct PH {
        private var phValue: Double = 3
        
        init() { }
        
        init(_ phValue: Double) {       // podemos usar los init
            self.phValue = phValue
        }
        
        var wrappedValue: Double {
            get {
                return phValue
            }
            set {
                if newValue < 0 {
                    phValue = 0
                } else if newValue > 14 {
                    phValue = 14
                } else {
                    phValue = newValue
                }
            }
        }
         
        var projectedValue: PH {     // podemos acceder a la propiedad del phValue con el dólar -> $ como en la lína 116
            return self
        }
    }
    
    struct Agua {
        @PH(7) var ph: Double
//        var ph: PH    -> equivalente
    }
    var agua = Agua()
    print(agua.ph)
    agua.ph = 11
    print(agua.ph)
    agua.ph = 48
    print(agua.ph)
    print(agua.$ph.wrappedValue)
}
