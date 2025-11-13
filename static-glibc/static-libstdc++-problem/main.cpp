#include <future>

extern void foo();

int main() {
    auto m_result = std::async(std::launch::async, [](){});
    foo();
}
