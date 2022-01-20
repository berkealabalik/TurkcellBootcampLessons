import UIKit

//Array = dizi
//Aynı veri türünde olan değerleri tutar, ama istenirse farklı türlerde tutabilir .

var cars = ["Mercedes",3] as [Any]
cars.first


var City:[String] = [] // Boş String Array

var AnotherCities:Array<String> = Array() // Boş String Array
var AnotherCities2 = Array<String>()
var AnotherCities3 = [String]() // Boş String Array


//Array e Eleman Ekleme ve Indis Kavramı
City.append("Samsun")
City.append("Bursa")
City.append("Adana")
City.append("Antalya")

City.first
City[0]
City.endIndex // kaç tane eleman var
City.last
City[City.endIndex-1]


var stringArray = Array(repeating: "Balık", count: 3)
let matrix = [
["A","B",4],
[1,2,3]
]

matrix[0][2]
matrix.first?.last


//NUMERIC DİZİLER

var numberArray = [1,2,3]
numberArray.max()
numberArray.min()


//Tuples in Switch
let switchTuple = (firstCase : true,secondCase:false)

switch switchTuple {
case (true,true):
        print("Ikiside Doğru")
case(true,false):
    print("Ilki Doğru 2. Yanlış")
default:
    print("Yanlış durum")
}

//SET (Unordered)(Kümeler) -> Swift 5.4? ile Ordered Set Kavramı geldi
//Mülakat Sorusu : Array ile set arasındaki fark nedir ?
// - Set Mükerrer(tekrar eden) eleman bulunmaz ve unordered , Set Hashable Protkolü?
//neden array değilde set . Tek bir tane aynısından olabilecek durum ise set mantıklı . Ve set aramada daha performanslı.
var colors = Set<String>() // Elemanları String olan boş bir küme
var mycolors : Set<String> = ["Siyah","Beyaz","Sarı","Kırmızı"]
mycolors.count

var animals : Set<String> = ["ateş","Pars","Rahmetli Çiko","Pala","Sopa","Kartal","Doğan"]
var myCars : Set<String> = ["Kartal","Doğan","Audi","Passat","Mercedes","Cadillac","Bmw"]
var Anothercars : Set<String> = ["Anadol","Kartal"]
// Kümelerde kesişim (Intersection)
let intersection1 = animals.intersection(myCars)
let intersection2=myCars

//Birleşim (Union)

let union1 = myCars.union(Anothercars)
let mySet : Set<String> = ["Ali","Ali","Ahmet"]

//bir sınıfta en az bir yazılım dili bilenlerin sayısı 24 sadece swift bilenler 12 sadece kotlin bilenler 8 oldugun göre her iki dili bilen kaç kişi vardır sınıfta 24 kişi var? swift ile çözün

//fark ? Symmetric Difference
//alt Küme Subtracting


//DİCTİONARY
var hayvanlar3 : Dictionary<String,String> = Dictionary<String,String>() // UZUN VERSİYON
var hayvanlar1 = [String:String]() // Boş Dict
var hayvanlar2 : [String:String] = [:] // Boş dict

var hayvanlar : [String:String] = ["Ateş":"Kedi","Pars":"Köpek","Rahmetli Çiko":"Muhabbet Kuşu"]
hayvanlar["Ateş"] // ateş değerini bastı

for hayvan in hayvanlar.keys {
    print(hayvan) // Unordered basıyor sırası değişebilir
}
for tür in hayvanlar.values {
    print(tür) // Unordered basıyor sırası değişebilir
}

hayvanlar["Kedi"] = "osman" // kedi isimli osman türlü birşey ekledi
print(hayvanlar)

hayvanlar.updateValue("Jaguar", forKey: "Ateş") // Ateş Jaguar oldu
print(hayvanlar)

var plate : [Int:String] = [34:"Istanbul",16:"Bursa",06:"Ankara",42:"Konya",49:"Muş",48:"Muğla"]
var otherDictionary = [String:Any]() // any any yapabiliriz tpye hash konusu sonra


//Fonksiyonlar

func sayhi(){
    print("Merhaba")
}
sayhi()

//Num1
func sayhito(name: String){
    print("Merhaba \(name)")
}

sayhito(name: "berke")

//Num2
func greetings(name:String)-> String {
    return name + "Hello"
}

print(greetings(name: "Sultan"))

//Homework Num1 vs Num2 tarafını seç neden

func greeting(name:String,age:Int) -> String {
    return "Merhaba ben \(name), \(age) Yaşındayım"
}

print(greeting(name: "Kerim", age: 17))

//Think about , bir fonksiyonun kaç parametre dönüşü olabilir -> Cevap 1 değil
//farklı türden istediğimiz kadar döndürebiliriz .

func anything()-> (a:Int,b:Int,c:Int) {
    return (1,2,3) // Tuple istediğimiz kadar döndürebiliriz.
}

//Variadic Funciton .
func sumVariadicFunction(numbers :Int ... , y:String) {
    print("\(y): \(numbers)")
}

sumVariadicFunction(numbers: 1,2,3,4,5,6,7,9, y: "Sayılarımız")



//FUNCTİON LET PROBLEMİ
func value(x: inout Int) { // let olacagı için x den sonra inout ekleriz let davranmaktan vazgeçer int.
    x = 5
    x = x+1
    print(x)
}
var x = 4
value(x: &x)

// CLOSURES :: Block - Lambda - Arrow Function
// İsmi olmayan , parametre alıp , geriye değer döndürebilen , bir değişkene atanabilen , bir fonksiyona parametre olarak verilebilen kod bloğuna denir .

// () -> [] // () -> Void

let selamVer: () -> () = { // bu herhangi bir parametre almayacagını ve geriye bir değer döndürmeyeceğini anlatıyor .
    
    print("Merhaba")
}
selamVer()

// isim parametresi alan bir closure

let selamVer2: (String) -> () = { name in
    print("Merhaba \(name)")
}

selamVer2("Sedat")

//birden fazla parametre alabilen ve dönüş tipi olan bir closure

let compare: (Int,Int) -> Bool = {  (x,y) in
    return x<y
}

compare(10,5)

//(Int,Int) tipinde parametre alıp geriye int dönen bir closure

let compare2: (Int,Int) -> Int = { (x,y) in
    return x+y
}
compare2(5,10)

// name örneği

let names = ["Mert","Bahattin","Zeynep","Humeyra","Berke","Ali Can"]

let sortedNames = names.sorted {( x: String, y:String )-> Bool in
    
    return x<y
}
sortedNames

let sortedNames2 = names.sorted { (x,y) -> Bool in
    return x<y
}
sortedNames2

let sortedNames3 = names.sorted { (x,y) in
    return x<y
}

sortedNames3

let sortedNames4 = names.sorted {
    $0 < $1  // iki parametre al birbiri ile karşılaştır
}
sortedNames4

let sortedNames5 = names.sorted(by: <) // Tercihim budur .
sortedNames5


// CLOAURE BİR FONKSİYONA PARAMETRE OLARAK VERİLMESİ

func myFunction(myClosure: () -> Void) { // birşey almayan ve döndürmeyen closure
    print("My func started")
    myClosure()
    print("My func end..")
}

let exampleClosure = {
    print("myClosure Run..")
}
myFunction(myClosure: exampleClosure) // tanımladıgımız closurları farklı yerde kullanabilicez .

// RETURN TİPİNDE Closure Kullanımı

func buy() -> (String)-> Void {
    return {
        print("\($0) Satın aldım.") // parametre almadan parametre kullandık .
    }
}
func sell(price : Int) -> (Int) -> Void {
    return {
        print("\($0-price) Sattım.")
    }
}
let result = buy() //
result("Zeytin")
let sellResult = sell(price:15)
sellResult(3)


//ÖNEMLİ : Completion Handler
/**
 closure tipi en fazla kullanacagımız closure türü . http gibi uzun işlem yapmak istiyor . İşlem tamamlanmasından hemen sonra bir şeyler
 yapmak isteyelim .Ancak Sürecin devam edip etmedğini sürekli kontrolu maliyetli oluyor . Bu durumda Completion handler işi çözecektir
 
 Uzun işlem tamamlanır tamamlanmaz geri çağırılan bir closure dır .
 */

let handler: (Data?,URLResponse?,Error?) -> () = { (data,response,error) in
    //print(String(data: data!, encoding: .utf8)!) // kesinlikle data var diyorsam ünlem koydum . Force demek.Encode noktaya bastım utf8
    
}
let url = "https://gelecegiyazanlar.turkcell.com.tr"
let myURL = URL(string: url) // url çevirdim Stringi .
/**let task = URLSession.shared.dataTask(with: myURL!)  { (data,response,error) in
    print(String(data: data!, encoding: .utf8)!)
};task.resume()  // ÜNLEM KESİNLİK , SORU İŞARETİ BELKİ .
*/

let task = URLSession.shared.dataTask(with: myURL!,completionHandler : handler)
task.resume()

// NON - Escaping vs @escaping
/**
 -non escaping: closures sadece kendi bloğunda çalışabilir . blok dışında çalışmaz
 non escaping kullanıyorsanız compiler bu closuren kod bloğu dışında çalıştırılmak istemediğini bilir .
 
 -Escaping : non escaping in tersi şeklinde . Başka yerde çağırmak istediğimiz zaman escaping kullanırız.Swift non escaping yazmasak bile
 default olarak tanımlıdır . Ancak başka yerde sonucunu kullanmak istiyorsak @escaping yazmalıyız .
 */

//ENUMS
/**
 hataları tanımlayabiliyoruz .
 */

enum Direction {
    case right
    case left
    case top
    case bottom
    
}

//Tek case altında toplama
enum Direction2 {
    case right,left,top,bottom
}

//kullanım örneği

let leftside = Direction.left

let downSide : Direction = .bottom

enum Numbers : Int {
    case first = 1, second,third,fourth,fifth
}
let besinci = Numbers.fifth

print(besinci.rawValue)


enum Hata: Error {
case sunucuHatası(sebep:String)
case kullanicihatasi(sebep:String)
}

let hata = Hata.kullanicihatasi(sebep: "Kullanıcı hatası meydana geldi ")
print(hata)

enum Cities : String {
    case İzmir = "Boyoz"
}

let city = Cities.İzmir
print(city) // Dersek izmir verir
print(city.rawValue) // Dersek boyoz

//bir fonksiyona parametre olarak enum verme .

func move(direction: Direction) {
    print("Oyuncu \(direction) yönüne hareket etti")
}
move(direction: .right)

let direct : Direction = .right


// NESTED ENUM

enum Orchestra {
    enum Strings {
        case guitar
        case baglama
    }
    enum Percussion {
        case drum
        case bell
    }
}

let inst1 = Orchestra.Percussion.bell
print(inst1)


// OPTİONALS
// Backend asla güvenme . Olurda bir veri gelmezse ? işaret ile crash engelleniyor .Değişkenleri optional tanımla
var number : Int?
number = 5
print(number)

//if-let kullanımı :::  Optional 5 yazdırdır kurtulmak için

if let sayi = number {
    print("Number : \(sayi)") // number tanımlanmış değilse else tanımlanmışssa optional kalktı .
}else {
    print("Number was not assigned")
    
}

var sehir:String?
sehir = "Ankara"
print(sehir ?? "Şehir Tanımlaması Yapılmamış")
print(sehir) // optional ankara verdi
print(sehir!)  // optionalsiz verdi ünlem kesinlik fakat dikkatlı kullanmalıyız .

if let il = sehir {
    print("Sehir: \(il)")
} else {
    print("Şehir Tanımlanmamış")
}


struct Member {
    var name:String?
    var password : String?
    var email : String?
}
var member = Member(name: "Kerim", password: "123", email: "kerim@gmail.com")

func getMember(member : Member) {
    if let name = member.name,let email = member.email, let password = member.password {
        print(name)
        print(email)
        print(password)
    } else {
        print("Veriler Okunamadı")
    }
}

getMember(member: member)


// Guard let .... else {}

func uyeGetir (uye : Member) {
    guard let name = uye.name,let email = uye.email , let password = uye.password else {
        print("Veriler Okunamadı")
        return
    }
    print(name)
    print(email)
    print(password)
}

let uye = Member(name: "Esin", password: nil, email: "esing@gmail") // passs nil dersek veriler okunamadı der .
uyeGetir(uye: uye)


//-------------------------
// ERRROR HANDLİNG
// try , try?, try!

enum NameError : Error {
    case tooLong
    case tooShort
}
func nameValidation(name : String) throws -> String {
    if name.count > 8 {
        throw NameError.tooLong
    } else if name.count < 2 {
        throw NameError.tooShort
    }else {
        return name
    }
}


// try : hata varsa ben ınu yakalarım , Do-try-catch yapasını severim

do {
    _ = try nameValidation(name: "a")
} catch NameError.tooLong {
    print("YOur name is long")
} catch NameError.tooShort {
    print("Your name is short")
}

// try? : Hata herkes yapabilir , Do catch kullanılmasına ihtiyaç yok


if let isim = try? nameValidation(name: "Hilal") {
    print("Name is valid: \(isim)")
} else {
    print("Name not valid")
}


//try! = hataları sevmez. hata yakalarsa bozulur. do or ide yaklaşımı

let result2 = try! nameValidation(name: "Hilal") // hilal yazar ama h dersek crash olcak error oluyor .




    

