import Foundation
import FoundationNetworking

public class WeatherService {
    private let apiUrl = "https://api.openweathermap.org/data/2.5/weather"
    private let appid: String

    public init(appid: String) {
        self.appid = appid
    }
    
    public func getWeather(byCity city: String, completionHandler: @escaping (WeatherData) -> Void) -> Void {
        var components = self.componentsWithAppId()

        components.queryItems!.append(URLQueryItem(
            name: "q",
            value: city
        ))

        self.fetchWeatherData(with: components.url!, completionHandler: completionHandler);
    }

    public func getWeather(byCoordinates coordinates: Coordinates, completionHandler: @escaping (WeatherData) -> Void) -> Void {
        var components = self.componentsWithAppId()

        components.queryItems!.append(contentsOf: [
            URLQueryItem(
                name: "lat",
                value: String(coordinates.lat)
            ),
            URLQueryItem(
                name: "lon",
                value: String(coordinates.lon)
            )
        ])

        self.fetchWeatherData(with: components.url!, completionHandler: completionHandler);
    }

    public func getWeather(byZipCode zipCode: String, completionHandler: @escaping (WeatherData) -> Void) -> Void {
        var components = self.componentsWithAppId()

        components.queryItems!.append(URLQueryItem(
            name: "zip",
            value: zipCode
        ))

        self.fetchWeatherData(with: components.url!, completionHandler: completionHandler);
    }

    private func fetchWeatherData(with url: URL, completionHandler: @escaping (WeatherData) -> Void) -> Void {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // TODO: improve error handling!

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let response = response as? HTTPURLResponse else {
                print("Response is not of type HTTPURLResponse")
                return
            }

            guard let data = data, response.statusCode == 200 else {
                print("StatusCode: \(response.statusCode)")
                return
            }

            guard let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) else {
                print("Could not decode JSON")
                return
            }

            completionHandler(weatherData);
        }

        // immediately start the task
        task.resume();
    }

    private func componentsWithAppId() -> URLComponents { 
        var components = URLComponents(string: self.apiUrl)!

        let appid = URLQueryItem(
            name: "appid",
            value: self.appid
        )

        components.queryItems = [appid]
        return components
    }
}

public struct Coordinates {
    let lat, lon: Float;

    init(lat: Float, lon: Float) {
        self.lat = lat;
        self.lon = lon;
    }
}

public struct WeatherData : Decodable {

}