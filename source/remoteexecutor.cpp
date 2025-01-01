#include "remoteexecutor.hpp"
#include <iostream>
#include <cstdlib>
#include <sstream>

std::string RemoteExecutor::executeSSH(const std::string& host, const std::string& user,
                                       const std::string& command, const std::string& keyPath) {
    std::ostringstream oss;
    oss << "ssh -i " << keyPath << " " << user << "@" << host << " \"" << command << "\"";

    FILE* pipe = popen(oss.str().c_str(), "r");
    if (!pipe) {
        throw std::runtime_error("Failed to execute SSH command");
    }

    char buffer[128];
    std::string result;
    while (fgets(buffer, sizeof(buffer), pipe) != nullptr) {
        result += buffer;
    }

    pclose(pipe);
    return result;
}

std::string RemoteExecutor::executeAPI(const std::string& url, const std::string& command,
                                       const std::string& token) {
    std::ostringstream oss;
    oss << "curl -X POST -H \"Authorization: Bearer " << token << "\" "
        << "-d \"command=" << command << "\" " << url;

    FILE* pipe = popen(oss.str().c_str(), "r");
    if (!pipe) {
        throw std::runtime_error("Failed to execute API command");
    }

    char buffer[128];
    std::string result;
    while (fgets(buffer, sizeof(buffer), pipe) != nullptr) {
        result += buffer;
    }

    pclose(pipe);
    return result;
}
