#pragma once

#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "interfaces/msg/Heartbeat.hpp"

using namespace std::chrono_literals;

class MinimalPublisher : public rclcpp::Node
{
public:
  MinimalPublisher(char* id)
  : Node("minimal_publisher")
  {
    this->id = id;
    publisher_ = this->create_publisher<interfaces::msg::Heartbeat>("heartbeat", 10);
    timer_ = this->create_wall_timer(
      500ms, std::bind(&MinimalPublisher::timer_callback, this));
  }

private:
  void timer_callback();
  rclcpp::TimerBase::SharedPtr timer_;
  rclcpp::Publisher<interfaces::msg::Heartbeat>::SharedPtr publisher_;
  uint32_t tick_ = 0;
  char* id;
};