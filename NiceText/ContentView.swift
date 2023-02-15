//
//  ContentView.swift
//  NiceText
//
//  Created by Nick Cory on 2/15/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct TextFile: FileDocument {
    static var readableContentTypes: [UTType] = [UTType.plainText]
    
    var text = ""
    
    init(initialText: String = "") {
        text = initialText
    }
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}



struct ContentView: View {
    
    @Binding var document: TextFile
    
    var body: some View {
        
        TextEditor(text: $document.text)
        
    }
}

/**
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
