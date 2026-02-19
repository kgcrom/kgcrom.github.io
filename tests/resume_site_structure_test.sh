#!/usr/bin/env bash
set -euo pipefail

failures=0

check_file() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    echo "FAIL: missing file $path"
    failures=$((failures + 1))
  fi
}

check_contains() {
  local path="$1"
  local pattern="$2"
  local message="$3"
  if [[ -f "$path" ]]; then
    if ! rg -q "$pattern" "$path"; then
      echo "FAIL: $message"
      failures=$((failures + 1))
    fi
  fi
}

check_not_contains() {
  local path="$1"
  local pattern="$2"
  local message="$3"
  if [[ -f "$path" ]]; then
    if rg -q "$pattern" "$path"; then
      echo "FAIL: $message"
      failures=$((failures + 1))
    fi
  fi
}

check_file "_config.yml"
check_file "assets/main.scss"
check_file "index.md"
check_file "en/index.md"

check_contains "_config.yml" "^remote_theme: sproogen/modern-resume-theme$" "_config.yml must use modern-resume-theme"
check_contains "_config.yml" "title: 17년차 백엔드/데이터 리드 개발자" "resume title should reflect senior positioning"
check_contains "_config.yml" "about_content: \\|" "about content must exist in _config.yml"
check_contains "_config.yml" "^content:$" "content sections must be configured in _config.yml"
check_contains "_config.yml" "caption: 2022년 5월 - 2023년 2월" "growing career range must be present"
check_not_contains "_config.yml" "카카오스타일" "kakaostyle career must not be included yet"
check_contains "_config.yml" "<!-- <a class=\"lang-switch\"" "EN switch should be commented out for now"
check_contains "assets/main.scss" "\\.lang-switch" "EN switch style must remain for future enablement"
check_contains "en/index.md" "English resume will be published soon" "English placeholder page should exist"

if [[ "$failures" -gt 0 ]]; then
  echo "\nResult: $failures checks failed"
  exit 1
fi

echo "Result: all checks passed"
