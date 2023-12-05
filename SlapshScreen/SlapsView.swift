//
//  SlapsView.swift
//  SlapshScreen
//
//  Created by Yasin Karateke on 5.12.2023.
//

import SwiftUI

struct SlapsView: View {
    
    @State var isActive: Bool = false
    @State private var size: CGFloat = 0.2 // ayarlanacak
    @State private var opacity: Double = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        }else{
            VStack {
                VStack(alignment: .center, spacing: 9) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * size, height: UIScreen.main.bounds.height * size)
                        .padding(.all, 20)
                }
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.5
                        self.opacity = 1.00
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SlapsView_Previews: PreviewProvider {
    static var previews: some View {
        SlapsView()
    }
}
