# Portfolio Management Guide

This guide explains how to manage your portfolio content using the Jekyll collection-based approach.

## Portfolio Structure

```
├── _portfolio/              # Individual portfolio items (markdown files)
│   ├── project1.md
│   ├── project2.md
│   └── project3.md
├── _layouts/
│   └── portfolio-item.html  # Template for individual portfolio pages
├── _sass/
│   └── my-portfolio.scss    # Portfolio-specific styles
├── assets/img/portfolio/    # Portfolio images
├── portfolio.md             # Main portfolio page
└── add-portfolio-item.sh    # Script to create new portfolio items
```

## Adding New Portfolio Items

### Method 1: Using the Script (Recommended)

```bash
./add-portfolio-item.sh "Project Name" "Project Description"
```

This will create a new markdown file in `_portfolio/` with the proper structure.

### Method 2: Manual Creation

1. Create a new `.md` file in the `_portfolio/` directory
2. Use this frontmatter template:

```yaml
---
title: "Your Project Title"
description: "Brief description of your project"
image: "/assets/img/portfolio/your-image.jpg"
technologies: ["Tech1", "Tech2", "Tech3"]
github: "https://github.com/username/repo"
demo: "https://your-demo-link.com"
date: YYYY-MM-DD
order: N
---
```

3. Add your content using Markdown

## Frontmatter Fields

- **title**: Project name (required)
- **description**: Brief description shown on portfolio grid (required)
- **image**: Path to project image (optional)
- **technologies**: Array of technologies used (optional)
- **github**: GitHub repository URL (optional)
- **demo**: Live demo URL (optional)
- **date**: Project date for sorting (required)
- **order**: Display order on portfolio page (required)

## Images

- Place portfolio images in `assets/img/portfolio/`
- Recommended size: 800x400px
- Supported formats: jpg, png, webp

## Styling

Portfolio styles are defined in `_sass/my-portfolio.scss`. The following CSS classes are available:

- `.portfolio-grid`: Main portfolio grid container
- `.portfolio-item`: Individual portfolio item cards
- `.tech-tags`: Container for technology tags
- `.tech-tag`: Individual technology tag
- `.portfolio-item-detail`: Individual portfolio page styles

## Content Guidelines

### Project Overview
- Explain what the project does
- Mention the problem it solves
- Highlight what makes it unique

### Key Features
- List 3-5 main features
- Use bullet points or numbered lists
- Be specific and concise

### Technologies Used
- Group by category (Frontend, Backend, Database, etc.)
- Mention specific versions if relevant
- Include deployment tools and services

### Challenges and Solutions
- Describe technical challenges you faced
- Explain how you solved them
- Show problem-solving skills

### What I Learned
- Focus on skills and knowledge gained
- Mention new technologies learned
- Include soft skills if relevant

## Best Practices

1. **Keep descriptions concise** - The grid description should be 1-2 sentences
2. **Use high-quality images** - Professional screenshots or mockups work best
3. **Update regularly** - Keep your portfolio current with recent work
4. **Be specific about your role** - Clarify what you personally contributed
5. **Include links** - Always provide GitHub and demo links when possible

## Sorting and Organization

Portfolio items are sorted by the `order` field. Lower numbers appear first. To reorder items, simply change their `order` values.

## Troubleshooting

### Portfolio items not showing up
- Check that files are in `_portfolio/` directory
- Ensure frontmatter is properly formatted
- Verify Jekyll is rebuilding (restart if necessary)

### Images not loading
- Check image paths are correct
- Ensure images exist in `assets/img/portfolio/`
- Verify image file extensions match

### Styling issues
- Check `_sass/my-portfolio.scss` for CSS errors
- Ensure the import in `_sass/my-style.scss` is present
- Clear browser cache and rebuild
