//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Артём Дмитриев on 24.10.2022.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("venom-10")
                .resizable()
                .frame(width: 56, height: 56)
                .scaledToFill()
                .clipped()
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Venom")
                    .font(.system(size: 14, weight: .semibold))
                Text("Eddie Brock")
                    .font(.system(size: 14))
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
