import SwiftUI

struct PushUps: View {
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image("push_up_image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    LinearGradient(gradient: Gradient(colors:
                                                        [.clear, Color(.systemBackground)]), startPoint: .top,
                                   endPoint: .bottom)
                    .overlay(alignment: .bottom) {
                        VStack(alignment: .leading, content: {
                            Text("Push ups")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Beginner")
                            
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                }
                
                VStack(alignment: .leading, spacing:8, content: {
                    HStack {
                        Image("baby")
                            .resizable()
                            .frame(width: 20, height:20)
                        
                        Text("Beginner")
                    }
                    
                    Label("No equipment required", systemImage: "dumbbell.fill")
                    
                    HStack {
                        Image("chest_muscles")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Image("tricep_muscles")
                            .resizable()
                            .frame(width:60, height: 60)
                    }
                    
                })
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding()
                
                Image("push_up_anim")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                    .cornerRadius(10)
                
                Spacer()
            }
            
            VStack {
                Button(action: {}) {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        .padding(12)
                        .background(
                            Circle()
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .padding(.bottom, 20) // Adjust bottom padding as needed
                }
            }
            .padding(.trailing, 20) // Adjust trailing padding as needed
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PushUps_Previews: PreviewProvider {
    static var previews: some View {
        PushUps()
    }
}
