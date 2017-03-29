resource "aws_autoscaling_group" "slave_server_group" {
  name = "Slaves-${var.stack_name}"

  min_size = "${var.slave_instance_count}"
  max_size = "${var.slave_instance_count}"
  desired_capacity = "${var.slave_instance_count}"

  vpc_zone_identifier = ["${var.aws_subnet_private_a_id}"]
  launch_configuration = "${aws_launch_configuration.slave.id}"

  tag {
    key = "role"
    value = "mesos-slave"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = false
  }
}