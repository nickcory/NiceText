//
//  NiceTextApp.swift
//  NiceText
//
//  Created by Nick Cory on 2/15/23.
//

import SwiftUI

@main
struct NiceTextApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: TextFile()) { file in
            ContentView(document: file.$document)
        }
    }
}
