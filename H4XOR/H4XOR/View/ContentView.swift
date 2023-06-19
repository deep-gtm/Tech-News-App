import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManage = NetworkManager()
    var body: some View {
        NavigationStack {
            List(networkManage.posts) { post in
                NavigationLink(destination: DetailsView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4XOR")
        }
        .onAppear {
            networkManage.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


