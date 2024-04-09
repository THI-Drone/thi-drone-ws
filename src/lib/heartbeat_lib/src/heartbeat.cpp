#include "heartbeat/heartbeat.hpp"

using namespace std::chrono_literals;

void MinimalPublisher::timer_callback()
{
    auto message = interfaces::msg::Heartbeat();
    message.sender_id = id;
    message.active = false;
    message.tick = ++tick_;
    publisher_->publish(message);
}