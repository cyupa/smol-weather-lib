
public struct WeatherData : Decodable {
    public let main: WeatherMain
    public let wind: Wind
}

public struct WeatherMain : Decodable {
    public let feels_like: Double
    public let humidity: Int8
    public let pressure: Int16
    public let temp: Double
    public let temp_max: Double
    public let temp_min: Double
}

public struct Wind : Decodable {
    public let speed: Float
    public let deg: Int16
}

public struct Coordinates {
    let lat, lon: Float;

    init(lat: Float, lon: Float) {
        self.lat = lat;
        self.lon = lon;
    }
}
