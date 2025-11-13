#include <future>

void foo() {
    auto m_result = std::async(std::launch::async, [](){});
}
