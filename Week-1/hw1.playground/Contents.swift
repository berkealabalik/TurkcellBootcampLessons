import UIKit
import Foundation

//1.Question


func delete(d1 : String, n1 : Int) {
    var str = ""
    for x in d1 {
        let sensitiveCount = d1.filter { $0 == x }.count
        if( sensitiveCount < n1) {
                str = str + [x]
        }
    }
    print(str)
}

var s1 = "aaba kouq bux"
delete(d1: s1 , n1: 2)

//2.Question
print("---------------------------")
print("2. Soru")
var text = "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim"
let words = text.split { !$0.isLetter  }
var arr : [String : Int] = [:]
for i in words {
    let counts = 1
    if (arr[String(i)] != nil) {
        arr[String(i)]! += 1
    }
    else { arr[String(i)] = counts }
}
print(arr)
        

//3. Question
print("---------------------------")
print("3. Soru")
var names = ["Mert","Yusuf","Eren","Berke","Ali"]
names.sorted().reversed()
for name in names {
    print(name.uppercased())
}


//4. Question Euler Projects.
// a. Problem 1 : If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.Find the sum of all the multiples of 3 or 5 below 1000.
print("---------------------------")
print("4. Soru || A.")
var num = Array(0...9)
var sum1 = 0
for i in num {
    if (((i%3) == 0) || (i%5) == 0 || (i%6) == 0  || (i%9) == 0  ) {
        sum1 = sum1 + i
    }
}
print(sum1)

print("---------------------------")
print("4. Soru || B.")

func fibonacci(n: Int) -> Array<Any> {
    var num1 = 0
    var num2 = 1
    var nextNum = Int()
    let i = 1
    var array = [Int]()
    array.append(num1)
    array.append(num2)

    for _ in i...n {
       nextNum = num1 + num2
       num1 = num2
       num2 = nextNum
       array.append(num2)
    }

   print("result = \(num2)")
    return array
 }
var arr2 = fibonacci(n: 32)
var countx = 0
for x in arr2{
    if (x as! Int % 2 == 0) {
        countx += x as! Int
    }
}
print("Sum of Even Numbers Up to 4 M : \(countx)")

print("---------------------------")
print("4. Soru || C.")

func primeFactors(_ n: Int) -> [Int] {
    var n = n
    var factors: [Int] = []

    var divisor = 2
    while divisor * divisor <= n {
        while n % divisor == 0 {
            factors.append(divisor)
            n /= divisor
        }
        divisor += divisor == 2 ? 1 : 2
    }
    if n > 1 {
        factors.append(n)
    }

    return factors
}

var prime = primeFactors(600851475143)
print(prime)
print("Largest Number of Number \(prime.last ?? 0)")
