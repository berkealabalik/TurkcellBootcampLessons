import UIKit


//Question 1 : Palindrome

func palindrome(x: String) -> Bool {
    let rev_str = String(x.reversed()).lowercased()
    
    if(x.lowercased() == rev_str){
        return true
    }
    else {
        return false
    }
}


palindrome(x: "Ey Edip adanada pide ye")

// Question 2 : Bir sayının asal sayı olup olmadığını anlamak için nasıl bir kod yazarsınız?(Karekök kullanın)


func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false }
    guard n != 2     else { return true  }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 } // 3 den itibaren check ediyor
}

isPrime(25)


//Question 3 : Bir sınıfta en az bir yazılım dili bilenlerin sayısı 24, sadece swift bilenler 12, sadece kotlin bilenler 8 olduğuna göre her iki dili bilen kaç kişi vardır. (Sınıfta 24 kişi var, sadece swift ve kotlin bilinmekte.)

var students = Set(1...24)
var swift = Set(1...12)
var kotlin  = Set(1...8)
var union1 = swift.union(kotlin)
print(union1)
union1 = students.intersection(union1)
print(union1.count)



//Question 4 : Değer döndürmeyip print ile çıktı veren fonksiyon ile return ile değer döndüren fonksiyon kullanım tercihinizi neye göre belirlersiniz.
// print sonrası fonksiyon içi variable bir daha gerekmeyecek ise print kullanırım fakat daha sonra kullanıcak isem return ile bir variable tutmak için çağırırım .


// Question 5: if let ve gurad let arasındaki farkı bir kaç cümle ile açıklayınız.

// guard fonksiyonun içlerine girmeden,loop yada kondsiyon fail olursa erken bir return sağlar. if let ise if benzer condisyon check ederek devam eder ve return sağlar .


// Question 6 : Fonksiyona parametre olarak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yaınız.
//Örneğin 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde olmalıdır

func printer (num : Int) {
    var print_text = ""
    for i in 1...num{
        if i % 2 == 0 {
            print_text.append("-")
        }else {
            print_text.append("+")
        }
    }
    print(print_text)
}

printer(num: 5)

/**
QUESTİON 7 : Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını yanına koyunuz.
Örneğin parametre 0 için çıktı 50 olmalıdır. Parametre 28 için 285, parametre 920 için 9520 olmalıdır
*/
