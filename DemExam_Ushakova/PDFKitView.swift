
// пыталась реализовать функцию для просмотра пдф файла, но что-то пошло не так
=======

//
//  PDFKitView.swift
//  DemExam_Ushakova
//
//  Created by User on 12.10.2024.
//

import SwiftUI

import PDFKit

struct PDFKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> PDFView {
        let pdf = PDFView()
        
        if let url = Bundle.main.url(forResource: "document", withExtension: "pdf") {
            if let document = PDFDocument(url: url) {
                pdf.document = document
            }
        }
        
        return pdf
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        
    }
}


struct PDFKitView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PDFKitView()
}
