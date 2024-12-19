### **`README.md` for FCLI**

# FCLI

[![forthebadge](https://forthebadge.com/images/badges/made-with-c-plus-plus.svg)](https://forthebadge.com)

**FCLI** is a powerful, extensible, and thread-safe command-line interface (CLI) tool for interacting with APIs, particularly those following the Farcaster hub protocol. It allows users to query data, execute commands, and dynamically configure hub addresses with ease. Designed with modern C++ standards (C++23), it ensures high performance and stability.

---

## Features

- **Dynamic Hub Configuration**: Supports setting custom hub addresses via commands.
- **Thread-Safe Operations**: Ensures reliable and safe execution in multi-threaded environments.
- **JSON Pretty-Printing**: Parses and formats JSON responses for better readability.
- **Verbose Mode**: Enables detailed debugging information for API requests.
- **Extensibility**: Built with modular design principles, allowing easy addition of new features.

---

## Getting Started

### **Prerequisites**

- C++23-compatible compiler (e.g., GCC 12+, Clang 16+)
- `libcurl` for HTTP requests
- `jsoncpp` for JSON parsing
- CMake 3.25+ for building the project

---

### **Build Instructions**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/genyleap/FCLI.git
   cd FCLI
   ```

2. **Configure and Build**:
   ```bash
   mkdir build && cd build
   cmake ..
   cmake --build .
   ```

3. **Run the Executable**:
   ```bash
   ./fcli help
   ```

---

## Usage

### **Basic Commands**

1. **Fetch Hub Information**:
   ```bash
   ./fcli /v1/info dbstats=1
   ```

   Example Output:
   ```plaintext
   [INFO] Executing command with URL: https://hub.pinata.cloud/v1/info?dbstats=1
   [INFO] Response:
   {
       "version": "1.0.0",
       "dbStats": {
           "collections": 12,
           "documents": 456789
       }
   }
   ```

2. **Set Custom Hub Address**:
   ```bash
   ./fcli set-hub https://mycustomhub.com
   ```

   Example Output:
   ```plaintext
   [INFO] Hub URL updated to: https://mycustomhub.com
   ```

3. **Help**:
   ```bash
   ./fcli help
   ```

   Example Output:
   ```plaintext
   [INFO] Available Commands:
     /v1/info  - Fetch hub information.
     /v1/reactions - Fetch reactions for a cast or user.
     set-hub <hub_url> - Set a custom hub address.

   Example:
     ./fcli /v1/info dbstats=1
     ./fcli set-hub https://mycustomhub.com
   ```

---

## Project Structure

```plaintext
FCLI/
├── sources/
│   ├── logger.cpp          # Implementation of Logger class
│   ├── network.cpp         # Implementation of Network class
│   ├── fcli.cpp            # Implementation of FCLI class
│   ├── logger.hpp          # Thread-safe logging utilities
│   ├── network.hpp         # Network request handler
│   ├── fcli.hpp            # CLI logic
├── CMakeLists.txt          # Build configuration
├── README.md               # Project documentation
```

---

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add new feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Author

Developed by [C O M P Ξ Z (compez.eth)](https://warpcast.com/@compez.eth) as part of the Genyleap initiative. 🎉

---

## Acknowledgments

- [libcurl](https://curl.se/libcurl/) for HTTP requests
- [jsoncpp](https://github.com/open-source-parsers/jsoncpp) for JSON parsing
- The Farcaster ecosystem for their open API standards
```

---
