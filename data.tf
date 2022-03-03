# data "aws_vpc" "selected" {

#   filter {
#     name   = "tag:environment/${var.env}"
#     values = ["1"]
#   }

#   filter {
#     name   = "tag:product/${var.product}"
#     values = ["1"]
#   }
# }

# data "aws_subnet_ids" "subnet_database" {
#   vpc_id = data.aws_vpc.vpc_database.id

#   filter {
#     name   = "tag:environment/${var.env}"
#     values = ["1"]
#   }

#   filter {
#     name   = "tag:product/${var.product}"
#     values = ["1"]
#   }

#   filter {
#     name   = "tag:type/database"
#     values = ["1"]
#   }
# }

# data "aws_subnet" "subnet_database" {
#   count = length(data.aws_subnet_ids.subnet_database.ids)
#   id    = tolist(data.aws_subnet_ids.subnet_database.ids)[count.index]
# }