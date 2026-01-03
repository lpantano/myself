# Personal Website

A Hugo-based personal website built with Hugo Blox (formerly Wowchemy).

## Prerequisites

- **Hugo Extended** v0.154.0 or later
- **Go** 1.21 or later

## Testing Locally

### 1. Install Hugo Extended

**macOS:**
```bash
brew install hugo
```

**Linux:**
Download from [Hugo Releases](https://github.com/gohugoio/hugo/releases)

**Verify installation:**
```bash
hugo version
```

### 2. Clone and Setup

```bash
git clone <your-repo-url>
cd myself
```

### 3. Install Dependencies

Update Hugo modules:
```bash
hugo mod get -u
hugo mod tidy
```

### 4. Run Local Development Server

```bash
hugo server
```

Or with drafts and future posts:
```bash
hugo server -D -F
```

The site will be available at: `http://localhost:1313`

### 5. Build for Production

```bash
hugo
```

The site will be generated in the `./public` directory.

## Configuration

- **Main config:** `config/_default/config.toml`
- **Menus:** `config/_default/menus.toml`
- **Content:** `content/` directory
- **Author profile:** `content/authors/admin/_index.md`

## Deployment

The site automatically deploys via GitHub Actions when pushing to the `master` branch:

- **Testing workflow** (`.github/workflows/ci.yml`): Runs on `master` and `devel` branches
- **Production workflow** (`.github/workflows/ci-publish.yml`): Deploys to GitHub Pages and publishes to `lpantano.github.io`

## Hugo Modules

This site uses the following Hugo Blox modules:

- `blox-bootstrap/v5` v5.9.7
- `blox-plugin-netlify` v1.2.0
- `blox-core` v0.3.1
- `blox-seo` v0.2.2

To update modules:
```bash
hugo mod get -u
hugo mod tidy
```

## Troubleshooting

### Clear Hugo cache
```bash
hugo mod clean
```

### Rebuild modules
```bash
hugo mod clean
hugo mod get -u
hugo mod tidy
```

### Check module versions
```bash
hugo mod graph
```

## Documentation

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Blox Documentation](https://docs.hugoblox.com/)
- [Hugo Blox GitHub](https://github.com/HugoBlox/hugo-blox-builder)
