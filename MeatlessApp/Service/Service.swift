import Foundation

struct Service {
    
    let service: URLSession
    
    init(service: URLSession = URLSession.shared) {
        self.service = service
    }
    
    func fetchRestaurantList(completion: @escaping (Result<[Restaurant], Error>) -> Void) {
        
        // STORY 1: Implement the API integration to fetch restaurant list.
        // GET https://raw.githubusercontent.com/devpass-tech/meatless-api/main/restaurant_list.json
        
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/meatless-api/main/restaurant_list.json")
        else {
            return completion(.failure(NSError(domain: "url", code: 404)))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        service.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
                completion(.failure(NSError(domain: "status code", code: response.statusCode)))
            }
            
            if let data {
                do {
                    let result = try JSONDecoder().decode([Restaurant].self, from: data)
                    completion(.success(result))
                }
                catch let error {
                    completion(.failure(error))
                }
            }
            
        }.resume()
        
    }
}
