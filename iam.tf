resource "aws_iam_role" "aditya_training_role" {
  name               = "aditya-iam-training-role"
  assume_role_policy = file("ec2_assume_role.json")

  tags = {
    Name      = "aditya-iam-training-role"
    ManagedBy = "v-aditya.pidikiti"
  }
}

resource "aws_iam_policy" "aditya_training_policy" {
  name   = "aditya-iam-training-policy"
  policy = file("iam-policy-ec2.json")

  tags = {
    Name      = "aditya-iam-training-policy"
    ManagedBy = "v-aditya.pidikiti"
  }
}

resource "aws_iam_role_policy_attachment" "aditya-training-policy-attachment" {
  role       = aws_iam_role.aditya_training_role.name
  policy_arn = aws_iam_policy.aditya_training_policy.arn
}

resource "aws_iam_instance_profile" "aditya-training-instance-profile" {
  name = aws_iam_role.aditya_training_role.name
  role = aws_iam_role.aditya_training_role.name
}
