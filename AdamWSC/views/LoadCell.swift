
import SwiftUI

struct LoadCell: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray.opacity(0.2))
                .frame(height: 200)
                .cornerRadius(20)
                .padding(.top, 3)
                .padding(.bottom, 3)
                .padding([.leading, .trailing])
            ProgressView()
                .opacity(0.5)
        }
            
    }
}

#Preview {
    LoadCell()
}
