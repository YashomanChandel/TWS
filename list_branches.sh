#!/bin/bash

API_URL="https://api.github.com"

UserName=$username
TOKEN=$token

repo_owner=$1
repo_name=$2

github_api_get()  {
local endpoint="$1"
local url="${API_URL}/${endpoint}"

curl -s -u "${UserName}:${TOKEN}" "$url"
}

repo_list_branches() {
	
	local endpoint="repos/${repo_owner}/${repo_name}/branches"
	branch="$(github_api_get "$endpoint" | jq '.[] .name')"
	echo "$branch"
}

repo_list_branches


