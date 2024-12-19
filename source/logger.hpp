#ifndef LOGGER_HPP
#define LOGGER_HPP

#include <string>
#include <mutex>
#include <format>
#include <iostream>

/**
 * @class Logger
 * @brief A thread-safe logging utility for formatted and colored console output.
 *
 * Provides static methods to log error, informational, and JSON-formatted messages
 * with appropriate formatting and color coding. Supports variadic templates for
 * formatted messages using `std::format`.
 */
class Logger {
private:
    /**
     * @brief A mutex to ensure thread-safe logging.
     */
    static std::mutex logMutex;

public:
    /**
     * @brief Logs an error message in red to the console.
     * @param message The error message to log.
     */
    static void error(const std::string& message);

    /**
     * @brief Logs an informational message in green to the console.
     * @param message The informational message to log.
     */
    static void info(const std::string& message);

    /**
     * @brief Logs a JSON-formatted message in cyan to the console.
     * @param message The JSON message to log.
     */
    static void json(const std::string& message);

    /**
     * @brief Logs a formatted error message in red to the console.
     * @tparam Args Variadic template for formatting arguments.
     * @param fmt The format string (follows `std::format` syntax).
     * @param args The arguments for the format string.
     */
    template<typename... Args>
    static void formattedError(const std::format_string<Args...>& fmt, Args&&... args) {
        error(std::format(fmt, std::forward<Args>(args)...));
    }

    /**
     * @brief Logs a formatted informational message in green to the console.
     * @tparam Args Variadic template for formatting arguments.
     * @param fmt The format string (follows `std::format` syntax).
     * @param args The arguments for the format string.
     */
    template<typename... Args>
    static void formattedInfo(const std::format_string<Args...>& fmt, Args&&... args) {
        info(std::format(fmt, std::forward<Args>(args)...));
    }
};

#endif // LOGGER_HPP
