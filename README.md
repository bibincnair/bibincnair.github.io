# Stochastic Scribbler ✨

Personal blog by **Bibin** documenting explorations in technology, research papers, and development. Built with Jekyll using the modern and feature-rich Hydejack theme.

## What You'll Find Here

- **📄 Paper Reviews**: Deep dives into research papers with technical explanations and key insights
- **📚 Book Notes**: Summaries and reflections on technical books and learning materials
- **🎓 Course Notes**: Documentation from online courses, lectures, and tutorials
- **💻 Development**: Programming insights, tools, and best practices
- **🧠 Research**: Comprehensive reviews covering important topics in AI/ML

## Recent Topics

- Transformer architectures and attention mechanisms
- Large Language Models (LLMs) and training techniques
- Parameter-efficient fine-tuning methods
- GPU computing and parallel programming
- DevOps practices and system design

## Technical Setup

This blog is powered by:
- **Jekyll 4.3** for static site generation
- **Hydejack 9** theme for modern, responsive design
- **KaTeX** for fast mathematical equation rendering
- **GitHub Actions** for automated deployment to GitHub Pages
- **Custom branding** with personalized logo and styling


## Development

To run this blog locally:

```bash
# Install dependencies
bundle install

# Start the Jekyll server
bundle exec jekyll serve

# Visit http://localhost:4000
```

### Writing Posts

Posts are written in Markdown and stored in the `_posts/` directory:

```markdown
---
layout: post
title: "Your Post Title"
tags: [nlp, research, programming]
---

Your content here...
```

Mathematical equations are supported via KaTeX:
- Inline: `$E = mc^2$`
- Display: `$$\text{Attention}(Q,K,V) = \text{softmax}(QK^T/\sqrt{d_k})V$$`

### Theme Customization

- **Logo**: Custom logo in `/assets/img/logo.png`
- **Favicon**: Browser tab icon in `/assets/img/favicon.png`
- **Sidebar**: Background image in `/assets/img/sidebar-bg.png`
- **Colors**: Accent colors configured in `_config.yml`

## Deployment

The site uses GitHub Actions for automated building and deployment:
- Push to `main` branch triggers automatic deployment
- Built with Jekyll and deployed to GitHub Pages
- Uses `remote_theme` for Hydejack compatibility

## Contact

Questions or discussions about the content? Feel free to reach out!

---

*Built with the [Hydejack](https://hydejack.com/) Jekyll theme.*
