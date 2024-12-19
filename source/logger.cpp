#include "logger.hpp"

std::mutex Logger::logMutex;

void Logger::error(const std::string& message) {
    std::lock_guard<std::mutex> lock(logMutex);
    std::cerr << "\033[1;31m[ERROR]\033[0m " << message << std::endl;
}

void Logger::info(const std::string& message) {
    std::lock_guard<std::mutex> lock(logMutex);
    std::cout << "\033[1;32m[INFO]\033[0m " << message << std::endl;
}

void Logger::json(const std::string& message) {
    std::lock_guard<std::mutex> lock(logMutex);
    std::cout << "\033[1;36m[JSON]\033[0m " << message << std::endl;
}
