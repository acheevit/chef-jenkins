#
# Cookbook Name:: jenkins
# Based on hudson
# Library:: nogzip_http
#
# Author:: Michael Daugherty <mike@mpdaugherty.com>
#
# This library just overrides the resource provide for http_request.
# It does not use gzip, which causes an error with file downloads to
# no longer show up.
#
# See: http://tickets.opscode.com/browse/CHEF-3218
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class Chef
  class Provider
    class HttpRequest < Chef::Provider
      def load_current_resource
        @rest = Chef::REST.new(@new_resource.url, nil, nil, :disable_gzip => true)
      end
    end
  end
end
