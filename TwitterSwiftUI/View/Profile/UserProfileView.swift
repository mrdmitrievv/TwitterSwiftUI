//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 27.10.2022.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
            }
            
            .navigationTitle("batman")
        }
        
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
