import UIKit

var greeting = "Hello, playground"

//MEMORY LEAK == Hafızada kullanılmayan alanların oluşması .

//Struct(Stack) VS Class(Heap) == struct value type , Classes Referans Type . Referans Varolan bloktaki hücreleri yaparken , Struct kopyasını alıp yapar .

// Weak , unowned , Strong

protocol SwiftDelegate : AnyObject { // Any object memory leak önlemek için .
    func hatirla()
}

//struct ObjectiveC :Swift { // Structlarda Memory Leak Oluşmaz .Classlarda Oluşuruz .
    
//}

weak var delegate: SwiftDelegate? // Arabanın anahatarını evde , evin anahtarını arabada unuttum .Memory leak

//deinit


class Araba {
    var bmw : BMW?
    
    deinit {
        // clasın işi bitirilince çağrılır
        print("Deallocating Araba Class")
    }
}
// MUTLAKA UNUTMA : 2 Ayrı class içi birbirine çağırdıysak birini başını Weak Yapın ve DEİNİT UNUTMA!!!!! Yazdırmıyorsa deinit hala tutuyor demektir .
// İki nesne birbirini Strong Tutuyorsa : Retain Cycle
// Meomory leakler retainc cycler referans typlerda oluşuyor . Mutlaka birinde weak kullanmaya dikkat ediyor ve Deinit unutmamaya özen gösteriyorum .
// Unowned :
// weak self :
class BMW { // Araba deallocate oldu ama bmw arabayı çağırıyor .
    weak var Araba : Araba? // iki class birbirini çağırıyor ama birini weak yapmazsak ikiside nil olunca birbirini tutcak
    
}

var arac = Araba()
var m4 = BMW()
/*
arac = nil // Memory leak var ne yaparız . nil Çekmek iş görür .

[weak self] (data , response , error) in {// bu nesnelerden herhangi birinin hayatına devam etmemesi durumunda memory leak engelliyor .

    self?.data // self sonuna soru işareti koyar çünkü weak oldugu için var mı yokmu ona bakar .
    
    guard let self = self else { return } // döngümüz devam ediyormu yaşama devam edip etmemesine bakar .
}
 */
/////// LEAK OLANLAR
// Closure
// Class
// Delegate - Protocol
//Notification Center

// Xcode ÜZerinden Memory Leak İzi Sürülebilir ona bak 



// Liskov Presnibi :

protocol DBService{
    func connect()
    func query()
}



class SQLService : DBService {
    func connect() {
        print("Sql")
    }
    
    func query(){
        print("Select * From Customer")
    }
} // İkisininde ismi aynı . Protocol yaratıp

class OracleService :DBService {
    func connect() {
        print("Oracle")
    }
    
    func query(){
        print("Select * From User")
    }
}

class Connection {
    func connect(with service : DBService){
        service.connect()
        service.query()
    }
}

let sqlService = SQLService()
let oracleService = OracleService()
let connection = Connection()

connection.connect(with: sqlService ) // Burda bu protokole uyan herşeyi çağırabiliriz .liskov türetilen sınıfın yerine geçebilen .Connection


// Arayüzleri Ayırma Prensibi : Interface Segregation

// Arayüz denilen protokolleri ayırmak .1 sınıftaki protokol 1 özelliğini implement etmesine gerek olmayabilir . Hiç kullanılmayan özelliği istemek doğru olmaz .

protocol livingSpecific{
    func breath()
    func eat()
    func run()
}

protocol Flightable { // Fly üstten alta aldım .Birds yanına ekledim .
    func fly()
}

class Birds : livingSpecific , Flightable {
    func breath() {
        print("I Can ")
    }
    func eat() {
        print("I Can Eat")
    }
    func run() {
        print("I can run")
    }
    func fly() {
        print("I CAn fly")
    }
}

class Human : livingSpecific { // Insanlar uçamaz şimdi protocoldeki fly gereksiz .
    func eat() {
        print("I can")
    }
    //
    func breath() {
        print("I can breath")
    }
    func run() {
        print("I can")
    }
}

//Dependency Inversion Principle : Bağımlılıkları Tersine Çevirme
// Üst mertebeli sınıflar alt mertebili sınıflara doğrudan bağımlı olmamalı .

// Bir class içine protocol tanıtıyorsak classs bile en üste tanımlanmalı .

protocol Logger {
    func log()
}





//Yanlış Tasarım
class Filelogger : Logger{ // Loger eklendi düzeltmek için
    func log(){
        
    }
}
class DBLogger  : Logger{ // Logger eklendi düzeltmek için
    func log() {}
}


/*
class LogManager {
    var fileLogger : Filelogger! // BU İKİSİ BİRBİRİNE BAĞIMLI OLDU .
    var dblogger :DBLogger!
    
    init(fileLogger : Filelogger , dblogger : DBLogger) {
        self.fileLogger = fileLogger
        self.dblogger = dblogger
    }
}
*/

class LogManager {
    var logger :Logger!
    
    func log() {
        logger.log()
    }
}

let dbLogger = DBLogger()
let fileLogger = Filelogger()
let logManager = LogManager(logger :dbLogger)
