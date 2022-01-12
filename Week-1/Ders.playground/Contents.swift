import UIKit

var greeting = "Hello, playground"
let merhaba = "Merhaba turkcell" // ikisi arasındaki fark
greeting = "Hello , Berke"
//merhaba = "Hello , merhaba"  // bu bir constan değişken LET .

let çağlar = "Çağlar Türkçe karaktr tanımlatıyor"


//let x : String = "2" // 2 yi string olmaya zorladım .
let x = 2 // ama bunu swift anlıyor . int oldugunu

var y: Int = 2

let a: Double = 5
print(a)

let b: Int = Int(3.9) // tamsayı değerini aldı .
print(b)
let c: Int = Int(-3.9) // tamsayı değerini aldı .
print(c)

let version = 12
print("Swift \(version) Versiyonunu Kullanıyorum ")

let f: Character = "f"


let new_name: String?
//new_name = nil     --- boşu verir
new_name = "nil"
print(new_name ?? "Boş") //

new_name?.count // karakter countu

for item in new_name! { // ünlem varmı yokmu name kesin var garantisi .
    print(item)
}

if version > 13 {
    print("Swift ui Yazabiliriz.")
} else if version == 12 {
    print("1 Sürüm Arttırmalısınız")
} else {
    print("İphone kull eminmisin ?")
}


//TERNARY İF

version > 13 ? print("Swift ui Yazabiliriz.") :print("İphone kull eminmisin ?")

//tuples
let tuples = ("1",2) // ilk strin tanımladım ikincisi int aynı olmak zorund değil

print(tuples.0)

var nameTuples = (first:1,middle:2,last:3)
nameTuples.first

var numberTuples : (optionalFirst:Int?,midle:String,last:Int)?
numberTuples = (nil,"Berke",last:3)
numberTuples?.last

//Soru : Merkezi (0.0) olan yarıçapı 1 olan bir çember tanımlayınız
let center = (x:0,y:0)
typealias Circle = (center: (x:CGFloat ,y: CGFloat ), radius : CGFloat)

let unitCircle: Circle = ((0.0,0.0),1)

var a1=3
var b1=4

(a1,b1) = (b1,a1)

/*
 ÖDEVLER
 
 1- Elimizde sadece harflerden oluşan(noktalama veya sayılar yok) uzun stringler olsun bu stringler içinde bazı ifadelerin tekrar ettiğini düşün . Misal "a" harfi 20 farklı yerde geçiyor .Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfleri siliniz. Sonra geriye kalan stringi consola yazdırınız .
 
 örnek : string = "aaba kouq bux"
 tekrar sayısı : 2 verdiliğinde çıktımız = a,b,u silinmeli ve ekrana "koq x" yazılmalı .
 Tekrar sayısı : 3 verildiğinde a silinmleş, ve ekrana "b kouq bux"
 tekrar sayısı : 4 olurssa hiçbir harf silinmeyecek .
 
 
 
 2- Elimizde uzun bir cümle olsun bazı kelimeler tekrar edecek bir cümle .İstediğimiz ise aynı kelimeden kaç tane kullanıldıgını bulmak .
 String = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
 merhaba 1 kez , nasılsınız 2 kez iyiyim 2 kez geçmiş gibi ...
 
 3- Cuma akşamı yaptıgımız script örneğinin isimlerin hepsini büyük harfle yazdırıp verdiğimiz isimleri büyük yazdırıcaz Sonra Z ' den a ya sıralicaz .
 
 4- Euler project sitesinden problems arcihve ilk 3 soruyu swift çözücez .
 */
