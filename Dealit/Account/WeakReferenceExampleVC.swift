//
//  WeakReferenceExampleVC.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 27/07/22.
//

import UIKit

class WeakReferenceExampleVC: UIViewController {
    
    var studentJohn:Student?
    
    var markList:Marklist?
    
    
    var studentPeter:PrimaryStudent?
    
    var studentSymonds:SecondaryStudent?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        unownedReference()
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

    
    func strongReference(){
        studentJohn = Student(name: "John", age: 20, mark: Marklist(tamil: 90))
        
        markList = Marklist(tamil: 75)
        
        
        studentJohn?.markList = Marklist(tamil: 35)
        studentJohn?.markList = Marklist(tamil: 36)

        markList?.student = studentJohn


        studentJohn?.markList = markList
        
        studentJohn = nil
        markList = nil
    }
    func weakReference(){
        studentPeter = PrimaryStudent(name: "Peter", age: 22, mark: Marklist(tamil: 63))
        
        markList = Marklist(tamil: 75)
        
        
        studentPeter?.markList = Marklist(tamil: 35)
        studentPeter?.markList = Marklist(tamil: 36)

        markList?.primaryStudent = studentPeter


        studentPeter?.markList = markList
        
        studentPeter = nil
        markList = nil
    }
    func unownedReference(){
        studentSymonds = SecondaryStudent(name: "Symonds", age: 35, mark: Marklist(tamil: 72))
        
        markList = Marklist(tamil: 75)
        
        
        studentSymonds?.markList = Marklist(tamil: 35)
        studentSymonds?.markList = Marklist(tamil: 36)

//        markList?.secondayStudent = studentSymonds


        studentSymonds?.markList = markList
        
        studentSymonds = nil
        markList = nil
    }
}


class Student{
    var name:String?
    var age:Int?
    var markList:Marklist?
    init(name:String,age:Int,mark:Marklist){
        self.age = age
        self.name = name
        
        self.markList = mark
        
        print("Student \(name) initiated")
    }
    
    deinit{
        print("Student \(name ?? "") De-initiated")
    }
}

class PrimaryStudent{
    var name:String?
    var age:Int?
     var markList:Marklist?
    init(name:String,age:Int,mark:Marklist){
        self.age = age
        self.name = name
        
        self.markList = mark
        
        print("Student \(name) initiated")
    }
    
    deinit{
        print("Student \(name ?? "") De-initiated")
    }
}

class SecondaryStudent{
    var name:String?
    var age:Int?
     var markList:Marklist?
    init(name:String,age:Int,mark:Marklist){
        self.age = age
        self.name = name
        
        self.markList = mark
        
        print("Student \(name) initiated")
    }
    
    deinit{
        print("Student \(name ?? "") De-initiated")
    }
}
class Marklist{
    var tamil:Int?
    
    var student:Student?
    
    weak var primaryStudent:PrimaryStudent?
    
    
    unowned var secondayStudent:SecondaryStudent?
    
    
    init(tamil:Int){
        self.tamil = tamil
        print("Marklist \(tamil) initiated")
    }
    
    deinit{
        print("Marklist \(tamil ?? 0) De-initiated")
    }
    
}

