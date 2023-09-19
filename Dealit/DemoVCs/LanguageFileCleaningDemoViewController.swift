//
//  LanguageFileCleaningDemoViewController.swift
//  Dealit
//
//  Created by ismayil-16441 on 14/09/23.
//

import UIKit
import Foundation
import SimpleCustomUIComponentsSwift

class LanguageFileCleaningDemoViewController: UIViewController {

    
    
    private var button: CustomAddButton  = {
        let button = CustomAddButton()
        button.backgroundColor = .purple
        button.setTitle("Clean", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(button)
        button.frame = CGRect(x: (self.view.frame.width / 2) - 50, y: (self.view.frame.height / 2) - 50, width: 100, height: 50)
        button.addTarget(self, action:  #selector(showOverHeadView), for: .touchUpInside)
    }
    
    
    @objc func showOverHeadView() {
        let vc = OverHeadAlertViewController()
        self.navigationController?.present(vc, animated: true)
    }
    
    
    @objc func deleteUnUsedLines() {
        
        // Specify the directory path where your string files are located
        let directoryPath = "Users/ismayil-16441/Documents/demoprojects/dealit-ios/Dealit/DemoVCs/OriginalStringFiles"
        do {
            let fileManager = FileManager.default
            let fileURLs = try fileManager.contentsOfDirectory(at: URL(fileURLWithPath: directoryPath), includingPropertiesForKeys: nil)

            for fileURL in fileURLs {
                var originalFilePath = ""
                if #available(iOS 16.0, *) {
                     originalFilePath = fileURL.path(percentEncoded: true)
                } else {
                    // Fallback on earlier versions
                }
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
                
                print("Final Strings count -\(finalStrings.count)")
                lines = lines.filter { line in
                    if line.isEmpty {
                        return false
                    }
                    guard let range = line.range(of: "\"(.+?)\"", options: .regularExpression) else {
                        return true
                    }
                    
                    let key = String(line[range].dropFirst().dropLast())
                    return enumStrings.contains(key)
                }
                
                let destinationDirectory = "/Users/ismayil-16441/Documents/demoprojects/dealit-ios/Dealit/DemoVCs/CleanedStrings"
                
                let destinationPath = "\(destinationDirectory)/\(fileURL.lastPathComponent)"
                
                let updatedContents = lines.joined(separator: "\n")
                
                do {
                    try updatedContents.write(toFile: destinationPath, atomically: true, encoding: .utf8)
                } catch {
                    print("Could not write into the file")
                }
            }
        } catch {
            print("Error reading directory: \(error)")
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
