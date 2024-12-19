#include "network.hpp"
#include "logger.hpp"
#include <curl/curl.h>
#include <format>

size_t Network::WriteCallback(void* contents, size_t size, size_t nmemb, std::string* outBuffer) {
    size_t totalSize = size * nmemb;
    outBuffer->append(static_cast<char*>(contents), totalSize);
    return totalSize;
}

std::string Network::buildQueryString(const std::map<std::string, std::string>& params) const {
    std::shared_lock lock(networkMutex);
    std::string queryString;
    for (const auto& [key, value] : params) {
        queryString += std::format("{}={}&", key, value);
    }
    if (!queryString.empty()) queryString.pop_back(); // Remove trailing '&'
    return queryString;
}

bool Network::sendRequest(const std::string& url, std::string& response, bool verbose) {
    Logger::formattedInfo("Constructed URL: {}", url);

    CURL* curl = curl_easy_init();
    if (!curl) {
        Logger::error("Failed to initialize CURL");
        return false;
    }

    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &response);
    if (verbose) curl_easy_setopt(curl, CURLOPT_VERBOSE, 1L);

    CURLcode res = curl_easy_perform(curl);
    curl_easy_cleanup(curl);

    if (res != CURLE_OK) {
        Logger::formattedError("CURL error: {}", curl_easy_strerror(res));
        return false;
    }

    return true;
}
