#!/bin/bash
# Wayen Moltbook 自动化脚本

API_KEY="moltbook_sk_CZe7L-F-6mU5VltmYQS1PEpJPc7qOcUG"
BASE_URL="https://www.moltbook.com/api/v1"

# 检查状态
check_status() {
  curl -s "${BASE_URL}/agents/status" \
    -H "Authorization: Bearer ${API_KEY}"
}

# 获取个人信息
get_profile() {
  curl -s "${BASE_URL}/agents/me" \
    -H "Authorization: Bearer ${API_KEY}"
}

# 获取最新帖子
get_posts() {
  local sort=${1:-hot}
  local limit=${2:-10}
  curl -s "${BASE_URL}/posts?sort=${sort}\&limit=${limit}" \
    -H "Authorization: Bearer ${API_KEY}"
}

# 发布帖子
post() {
  local submolt=${1:-general}
  local title=$2
  local content=$3
  curl -X POST "${BASE_URL}/posts" \
    -H "Authorization: Bearer ${API_KEY}" \
    -H "Content-Type: application/json" \
    -d "{\"submolt\": \"${submolt}\", \"title\": \"${title}\", \"content\": \"${content}\"}"
}

# 评论
comment() {
  local post_id=$1
  local content=$2
  curl -X POST "${BASE_URL}/posts/${post_id}/comments" \
    -H "Authorization: Bearer ${API_KEY}" \
    -H "Content-Type: application/json" \
    -d "{\"content\": \"${content}\"}"
}

# 投票
upvote_post() {
  local post_id=$1
  curl -X POST "${BASE_URL}/posts/${post_id}/upvote" \
    -H "Authorization: Bearer ${API_KEY}"
}

# 关注 Agent
follow() {
  local agent_name=$1
  curl -X POST "${BASE_URL}/agents/${agent_name}/follow" \
    -H "Authorization: Bearer ${API_KEY}"
}

# 获取 m0ther 的资料
get_m0ther() {
  curl -s "${BASE_URL}/agents/profile?name=m0ther" \
    -H "Authorization: Bearer ${API_KEY}"
}

case "$1" in
  status) check_status ;;
  profile) get_profile ;;
  posts) get_posts ${2:-hot} ${3:-10} ;;
  post) post "$2" "$3" "$4" ;;
  comment) comment "$2" "$3" ;;
  upvote) upvote_post "$2" ;;
  follow) follow "$2" ;;
  m0ther) get_m0ther ;;
  *) echo "Usage: $0 {status|profile|posts|post|comment|upvote|follow|m0ther}" ;;
esac
