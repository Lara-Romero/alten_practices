import UIKit

Task {
    do {
        let url = URL(string: "https://raw.githubusercontent.com/SDOSLabs/JSON-Sample/master/Products/images_test.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let arrayUrlsImages = try JSONDecoder().decode([String].self, from: data)
        print(arrayUrlsImages.count)
        
        var images = try await withThrowingTaskGroup(of: UIImage?.self, returning: [UIImage].self) { taskGroup in
            for url in arrayUrlsImages {
                taskGroup.addTask {
                    guard let url = URL(string: url) else { return nil }
                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)
                        if let image = UIImage(data: data) {
                            return image
                        } else {
                            print("Error al convertir la imagen \(url.absoluteURL)")
                            return nil
                        }
                    } catch {
                        print("Error al descargar de internet")
                        return nil
                    }
                }
            }
            
            var result = [UIImage]()
            for try await image in taskGroup {
                if let image = image {
                    result.append(image)
                }
            }
            return result
        }
        
        images.forEach {
            print($0)
            $0
        }
        print(images.count)
    } catch {
        print(error)
    }
    
}

