//
//  LanguageFileCleaningDemoViewController.swift
//  Dealit
//
//  Created by ismayil-16441 on 14/09/23.
//

import UIKit

class LanguageFileCleaningDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.deleteUnUsedLines()
    }
    
    
    func deleteUnUsedLines() {
        
        let originalFilePath = "/Users/ismayil-16441/Documents/demoprojects/dealit-ios/Dealit/DemoVCs/OriginalString.strings"
        guard let fileContents = try? String(contentsOfFile: originalFilePath, encoding: .utf8) else {
            print("Failed to read file at path: \(originalFilePath)")
            return
        }
        
        var lines = fileContents.components(separatedBy: .newlines)
        
        var unUsedStrings : Set<String> = []
        let fileContent = try! String(contentsOfFile: originalFilePath, encoding: .utf8)

        let totalLines = fileContent.components(separatedBy: .newlines)

        for (index,line) in totalLines.enumerated() {
            let components = line.components(separatedBy: "=")
            if components.count == 2 {
                let key = components[0].trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: CharacterSet(charactersIn: "\""))
                
                unUsedStrings.insert(key)
            }
        }
        
        var enumStrings: Set<String> = []
        
        StatusContent.allCases.map { (content) in
            enumStrings.insert(content.rawValue)
        }
        let finalStrings = unUsedStrings.subtracting(enumStrings)
        
        print(finalStrings.count)
        lines = lines.filter { line in
            guard let range = line.range(of: "\"(.+?)\"", options: .regularExpression) else {
                return true
            }
            
            let key = String(line[range].dropFirst().dropLast())
            return enumStrings.contains(key)
        }
        
        let destinationPath = "/Users/ismayil-16441/Documents/demoprojects/dealit-ios/Dealit/DemoVCs/CleanedString.strings"
        
        var updatedContents = lines.joined(separator: "\n")
        
        do {
            try updatedContents.write(toFile: destinationPath, atomically: true, encoding: .utf8)
        } catch {
            print("Could not write into the file")
        }
        
    
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

public enum StatusContent: String, CaseIterable {
    case original = "original"
    case completed = "completed"
}
