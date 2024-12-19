#include "fcli.hpp"

void FCLI::prettyPrintJson(const std::string& json) {
    Json::Value jsonData;
    Json::CharReaderBuilder readerBuilder;
    std::string errors;

    std::istringstream stream(json);
    if (Json::parseFromStream(readerBuilder, stream, &jsonData, &errors)) {
        Json::StreamWriterBuilder writerBuilder;
        writerBuilder["indentation"] = "  ";
        std::string formattedJson = Json::writeString(writerBuilder, jsonData);
        Logger::json(formattedJson);
    } else {
        Logger::error("Failed to parse JSON response.");
        Logger::info(json);
    }
}

void FCLI::handleHelp(const std::string& endpoint) {
    Logger::info("Available Commands:");
    Logger::info("  /v1/info  - Fetch hub information.");
    Logger::info("  /v1/reactions - Fetch reactions for a cast or user.");
    Logger::info("  set-hub <hub_url> - Set a custom hub address.");
    Logger::info("\nExample:");
    Logger::info("  ./fcli /v1/info dbstats=1");
    Logger::info("  ./fcli set-hub https://mycustomhub.com");
}

void FCLI::executeCommand(const std::string& endpoint, const std::map<std::string, std::string>& params, bool verbose) {
    std::string queryString = network.buildQueryString(params);

    // Ensure endpoint starts with '/'
    std::string cleanEndpoint = endpoint[0] == '/' ? endpoint : "/" + endpoint;

    // Construct the full URL
    std::string fullUrl = queryString.empty() ? baseUrl + cleanEndpoint : baseUrl + cleanEndpoint + "?" + queryString;

    Logger::formattedInfo("Executing command with URL: {}", fullUrl);

    std::string response;
    if (network.sendRequest(fullUrl, response, verbose)) {
        prettyPrintJson(response);
    }
}

void FCLI::setHubUrl(const std::string& hubUrl) {
    if (hubUrl.empty() || hubUrl.find("http") != 0) {
        Logger::error("Invalid hub URL. Please provide a valid URL starting with 'http' or 'https'.");
        return;
    }
    baseUrl = hubUrl;
    Logger::formattedInfo("Hub URL updated to: {}", hubUrl);
}

void FCLI::run(int argc, char* argv[]) {
    if (argc < 2) {
        Logger::error("Usage: fcli <endpoint|help|set-hub> <key=value> [key=value ...] [--verbose]");
        return;
    }

    std::string command = argv[1];
    bool verbose = false;

    std::map<std::string, std::string> params;
    for (auto&& arg : std::ranges::subrange(argv + 2, argv + argc)) {
        std::string argument(arg); // Convert char* to std::string
        if (argument == "--verbose") {
            verbose = true;
        } else if (auto pos = argument.find('='); pos != std::string::npos) {
            params[argument.substr(0, pos)] = argument.substr(pos + 1);
        } else {
            Logger::formattedError("Invalid parameter format: '{}'. Use key=value.", argument);
            return;
        }
    }

    if (command == "help") {
        handleHelp();
    } else if (command == "set-hub") {
        if (params.empty() || params.begin()->first.empty()) {
            Logger::error("Please provide a hub URL.");
            return;
        }
        setHubUrl(params.begin()->first);
    } else {
        executeCommand(command, params, verbose);
    }
}
