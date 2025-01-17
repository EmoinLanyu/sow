// Copyright 2019 Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, v. 2 except as noted otherwise in the LICENSE file.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region     = var.REGION
  version    = "=2.60"
}

//=====================================================================
//= S3 bucket
//=====================================================================

resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.BUCKETNAME
  region        = var.REGION
  force_destroy = true
  tags = {
    Name = var.LANDSCAPE
  }
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

//=====================================================================
//= Output variables
//=====================================================================

output "bucketName" {
  value = aws_s3_bucket.bucket.id
}

