#include "fcli.hpp"

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
