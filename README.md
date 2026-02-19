# kgcrom.github.io

Jekyll + [modern-resume-theme](https://github.com/sproogen/modern-resume-theme) 기반 개인 이력서 사이트입니다.
GitHub Pages를 통해 자동 배포됩니다.

## 기술 스택

- **Jekyll** - 정적 사이트 생성기
- **modern-resume-theme** - 이력서 테마 (`remote_theme: sproogen/modern-resume-theme`)
- **GitHub Pages** - 호스팅 및 자동 배포

## 프로젝트 구조

```
├── _config.yml          # Jekyll 설정 및 이력서 데이터 (경력, 기술 스택, 학력 등)
├── index.md             # 메인 페이지 (한국어)
├── en/index.md          # 영문 페이지
├── assets/main.scss     # 스타일 커스터마이징
├── Gemfile              # Ruby 의존성 (github-pages)
└── tests/               # 사이트 구조 검증 테스트
```

## 로컬 개발

1. Ruby와 Bundler를 설치합니다.
2. 의존성을 설치하고 로컬 서버를 실행합니다.

```bash
bundle install
bundle exec jekyll serve
```

`http://127.0.0.1:4000`에서 확인할 수 있습니다.

## 배포

`main` 브랜치에 push하면 GitHub Pages를 통해 자동으로 배포됩니다.
