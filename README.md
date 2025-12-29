# TMDBKit

A Swift framework for interacting with The Movie Database (TMDB) API. TMDBKit provides a clean and type-safe interface for searching and fetching movie and TV show data.

## Features

- Search for movies and TV shows
- Fetch trending movies
- Type-safe API responses
- Modern async/await support
- Comprehensive test coverage
- Protocol-based architecture for easy testing

## Installation

### XCFramework

To build and use TMDBKit as an XCFramework, see the [Building XCFramework](#building-xcframework) section below.

## Usage

### Configuration

Before using TMDBKit, configure it with your TMDB access token:

```swift
import TMDBKit

TMDBConfiguration.configure(accessToken: "your_tmdb_access_token")
```

You can obtain an access token from [The Movie Database](https://www.themoviedb.org/settings/api).

### Searching for Movies

```swift
import TMDBKit

let searchService = TMDBSearchService()

do {
    let response = try await searchService.searchMovies(with: "Inception", page: 1)
    if let movies = response.results {
        for movie in movies {
            print(movie.title ?? "Unknown")
        }
    }
} catch {
    print("Error searching movies: \(error)")
}
```

### Searching for TV Shows

```swift
import TMDBKit

let searchService = TMDBSearchService()

do {
    let response = try await searchService.searchTvShows(with: "Breaking Bad", page: 1)
    if let shows = response.results {
        for show in shows {
            print(show.name ?? "Unknown")
        }
    }
} catch {
    print("Error searching TV shows: \(error)")
}
```

### Fetching Trending Movies

```swift
import TMDBKit

let moviesService = TMDBMoviesService()

do {
    let response = try await moviesService.fetchTrendingMovies(page: 1)
    if let movies = response.results {
        for movie in movies {
            print("\(movie.title ?? "Unknown") - Rating: \(movie.voteAverage ?? 0)")
        }
    }
} catch {
    print("Error fetching trending movies: \(error)")
}
```

## Models

### Movie

```swift
public struct Movie: Codable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let id: Int?
    public let title: String?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let posterPath: String?
    public let mediaType: String?
    public let genreIds: [Int]?
    public let popularity: Double?
    public let releaseDate: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?
}
```

### TVShow

```swift
public struct TVShow: Codable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let genreIds: [Int]?
    public let id: Int?
    public let originCountry: [String]?
    public let originalLanguage: String?
    public let originalName: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let firstAirDate: String?
    public let name: String?
    public let voteAverage: Double?
    public let voteCount: Int?
}
```

## Error Handling

TMDBKit uses the `NetworkError` enum for error handling:

```swift
public enum NetworkError: Error {
    case invalidURL
    case httpError(statusCode: Int)
    case decodingError(Error)
    case unknown(Error)
}
```

## Building XCFramework

TMDBKit includes a convenient build script that generates an XCFramework for iOS, iPadOS, tvOS, and macOS.

### Quick Build

Simply run the included build script:

```bash
./build-multiplatform.sh
```

This will:
- Build for iOS Device
- Build for iOS Simulator
- Build for tvOS Device
- Build for tvOS Simulator
- Build for macOS
- Create an XCFramework combining all platforms
- Output the framework to `build/TMDBKit.xcframework`

The script is fault-tolerant and will create the XCFramework with any successfully built platforms, even if some builds fail.

### Using the Generated XCFramework

After running the build script:

1. Locate the generated framework at `build/TMDBKit.xcframework`
2. Drag and drop `TMDBKit.xcframework` into your Xcode project
3. In your target's settings, go to "Frameworks, Libraries, and Embedded Content"
4. Ensure TMDBKit.xcframework is set to "Embed & Sign"
5. Import and use as shown in the Usage section above

### Manual Build (Advanced)

If you need to customize the build process, you can build manually for specific platforms:

```bash
# Build for iOS
xcodebuild archive \
  -project TMDBKit.xcodeproj \
  -scheme TMDBKit \
  -destination "generic/platform=iOS" \
  -archivePath "build/TMDBKit-iOS" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Build for iOS Simulator
xcodebuild archive \
  -project TMDBKit.xcodeproj \
  -scheme TMDBKit \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "build/TMDBKit-iOS-Simulator" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Build for macOS
xcodebuild archive \
  -project TMDBKit.xcodeproj \
  -scheme TMDBKit \
  -destination "generic/platform=macOS" \
  -archivePath "build/TMDBKit-macOS" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
  -archive build/TMDBKit-iOS.xcarchive -framework TMDBKit.framework \
  -archive build/TMDBKit-iOS-Simulator.xcarchive -framework TMDBKit.framework \
  -archive build/TMDBKit-macOS.xcarchive -framework TMDBKit.framework \
  -output build/TMDBKit.xcframework
```

## Architecture

TMDBKit follows a clean architecture pattern:

- **Services Layer**: High-level API services (`TMDBMoviesService`, `TMDBSearchService`)
- **Networking Layer**: Generic network service handling requests and responses
- **Routers**: Route definitions for different API endpoints
- **Models**: Codable data models matching TMDB API responses
- **Configuration**: Centralized configuration management

## Acknowledgments

This framework uses [The Movie Database API](https://www.themoviedb.org/documentation/api) but is not endorsed or certified by TMDB.
