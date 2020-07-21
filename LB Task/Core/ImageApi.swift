import UIKit
public enum ImageApi: String, CaseIterable {
    case image1 = "image-0"
    case image2 = "image-1"
    case image3 = "image-2"

    private var url: URL? {
        URL(string: "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/\(rawValue).jpg")
    }
    
    func fetch(completion: @escaping (UIImage?, Error?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                guard let url = self.url else {
                    return completion(nil, ImageApiError.badUrl)
                }
                let data = try Data(contentsOf: url)
                completion(UIImage(data: data), nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}

enum ImageApiError: Error {
    case badUrl
}
