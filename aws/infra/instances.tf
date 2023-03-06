resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = merge(var.tags,  {
    Name            = "WEB-tag-testing-instance"
    a_Solution      = "TaggingSolution"
    a_Environment   = "uat01"
    Creator         = "amit.naudiyal"
  })

  lifecycle {
    ignore_changes = [
      tags["CR_Ref"], tags["Opportunity_no"]
    ]
  }

}

resource "aws_instance" "cron" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name            = "CRON-tag-testing-instance"
    a_Solution      = "TaggingSolution"
    a_Environment   = "uat01"
    Creator         = "amit.naudiyal"
  }
}

resource "aws_s3_bucket" "tag-bucket" {
  bucket = "tf-bucket-tagging-solution"

  tags = {
    Name            = "tf-bucket-tagging-solution"
    a_Solution      = "TaggingSolution"
  }
}