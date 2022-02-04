import UIKit



// Question1 :Frame vs Bound

// frame location and size uses parents views cordinate system
// bounds location and size uses own cordinat system .

//-----------------------------------------------

// Question2 : Why We Use Static Keyword ?

//Program çalıştırıldıgı andan itibaren çalışmasını istediğimiz obje yada fonksiyonlar için kullanırız.Misal  Bir class içi yarattgımız fonksiyon obje oluşturulmadan class çalışmayınca Error verir .Fakat static ile obje yaratılmadanda kullanılabilir .

/* ERROR
class Users {
    
    func getUsername(){
        
    }
}

let name = Users.getUsername()

*/

// WORKS
class Users1 {
    
    static func getUsername1(){
        
    }
    
}

let name1 = Users1.getUsername1()

//-----------------------------------------------

// Question 3 :

// Euler 9

var c = Int()

outer: for a in (1...1000) {
  for b in (1...1000) {
    c = 1000 - (a + b)
    if a*a + b*b == c*c {
      print (a * b * c)
      break outer
    }
  }
}
print(c)
