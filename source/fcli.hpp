#ifndef FCLI_HPP
#define FCLI_HPP

#include "network.hpp"
#include "logger.hpp"
#include <json/json.h>
#include <string>
#include <map>
#include <format>
#include <ranges>

/**
 * @class FCLI
 * @brief A command-line interface for interacting with APIs using the `Network` utility.
 *
 * Handles user input, constructs and sends API requests, and processes the responses.
 * Provides features like JSON pretty-printing and dynamic help messages.
 * Supports dynamic configuration of the hub address.
 */
class FCLI {
private:
    /**
     * @brief The base URL of the hub (default: "https://hub.pinata.cloud").
     */
    std::string baseUrl = "https://hub.pinata.cloud";

    /**
     * @brief A utility object for handling network requests.
     */
    Network network;

    /**
     * @brief Pretty-prints a JSON string to the console.
     *
     * Parses a raw JSON string and outputs it in a human-readable format
     * with indentation.
     *
     * @param json The raw JSON string to pretty-print.
     */
    void prettyPrintJson(const std::string& json);

    /**
     * @brief Displays help information for available commands or a specific endpoint.
     *
     * Outputs general help if no endpoint is specified. If an endpoint is provided,
     * details and examples specific to that endpoint are shown.
     *
     * @param endpoint The optional endpoint for which help is requested (default: "").
     */
    void handleHelp(const std::string& endpoint = "");

    /**
     * @brief Executes an API command by sending a request to the specified endpoint.
     *
     * Constructs the full URL using the base endpoint and query parameters, sends
     * the request using the `Network` utility, and processes the response.
     *
     * @param endpoint The API endpoint to query (e.g., `/v1/info`).
     * @param params A map of query parameters to include in the request.
     * @param verbose If `true`, enables verbose output for debugging (default: false).
     */
    void executeCommand(const std::string& endpoint, const std::map<std::string, std::string>& params, bool verbose);

    /**
     * @brief Sets the base URL for the hub dynamically.
     *
     * Updates the `baseUrl` with a custom hub address provided by the user.
     *
     * @param hubUrl The custom hub URL to set.
     */
    void setHubUrl(const std::string& hubUrl);

public:
    /**
     * @brief Main entry point for the command-line interface.
     *
     * Parses command-line arguments, determines the requested action, and
     * executes the corresponding command or displays help.
     *
     * @param argc The number of command-line arguments.
     * @param argv An array of command-line argument strings.
     */
    void run(int argc, char* argv[]);
};

#endif // FCLI_HPP
