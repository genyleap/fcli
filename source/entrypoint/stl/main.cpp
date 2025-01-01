#include "fcli.hpp"
#include "remoteexecutor.hpp" // Include the RemoteExecutor module

/**
 * @brief Entry point for the FCLI application.
 *
 * Initializes the command-line interface and delegates execution
 * to the FCLI class. Handles unexpected errors gracefully.
 *
 * @param argc The number of command-line arguments.
 * @param argv An array of command-line argument strings.
 * @return Exit status code (0 for success, non-zero for failure).
 */
auto main(int argc, char* argv[]) -> int {
    try {
        FCLI fcli;

        // Check for remote execution flags
        if (argc > 1) {
            std::string mode = argv[1];
            if (mode == "--remote-ssh" && argc == 6) {
                std::string user = argv[2];
                std::string host = argv[3];
                std::string keyPath = argv[4];
                std::string command = argv[5];

                // Execute remote command via SSH
                std::string output = RemoteExecutor::executeSSH(host, user, command, keyPath);
                Logger::info("Remote SSH Execution Output:");
                Logger::info(output);
                return 0; // Success
            } else if (mode == "--remote-api" && argc == 5) {
                std::string url = argv[2];
                std::string token = argv[3];
                std::string command = argv[4];

                // Execute remote command via API
                std::string output = RemoteExecutor::executeAPI(url, command, token);
                Logger::info("Remote API Execution Output:");
                Logger::info(output);
                return 0; // Success
            }
        }

        // Standard CLI execution
        fcli.run(argc, argv);
    } catch (const std::exception& e) {
        Logger::error(std::format("An unexpected error occurred: {}", e.what()));
        return 1; // Exit with failure status
    } catch (...) {
        Logger::error("An unknown error occurred.");
        return 1; // Exit with failure status
    }

    return 0;
}
