
import SwiftUI

struct LoadCell: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.blue.opacity(0.1))
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
