# My Academic Blog

This is my personal academic blog where I write about research papers, books, and courses I'm studying. Built with Jekyll using the clean and minimal Lanyon theme, this site serves as my digital notebook for documenting my learning journey in AI, NLP, and related fields.

## What You'll Find Here

- **📄 Paper Reviews**: Deep dives into research papers with technical explanations, key insights, and mathematical formulations
- **📚 Book Notes**: Summaries and reflections on technical books I'm reading
- **🎓 Course Notes**: Documentation of online courses, lectures, and learning materials
- **🧠 Survey Papers**: Comprehensive reviews of survey papers covering important topics in AI/ML

## Recent Topics

- Transformer architectures and attention mechanisms
- Large Language Models (LLMs) and their applications
- Parameter-efficient fine-tuning techniques
- GPU computing and parallel programming
- DevOps practices and methodologies

## Technical Setup

This blog is built with:
- **Jekyll** for static site generation
- **MathJax 3** for rendering mathematical equations
- **Lanyon theme** for clean, content-focused design
- **GitHub Pages** for hosting


## Running Locally

To run this blog locally for development:

```bash
# Install dependencies
bundle install

# Start the Jekyll server
bundle exec jekyll serve

# Visit http://localhost:4000
```

## Writing Posts

Posts are written in Markdown and stored in the `_posts/` directory. Each post requires front matter with a title, date, and tags:

```markdown
---
layout: post
title: "Your Post Title"
date: 2025-06-26
tags: [nlp, survey, transformer]
---

Your content here...
```

Mathematical equations are supported via MathJax:
- Inline: `$E = mc^2$`
- Display: `$$\text{Attention}(Q,K,V) = \text{softmax}(QK^T/\sqrt{d_k})V$$`

## Contact

Feel free to reach out if you have questions about any of the content or want to discuss the topics I write about.

---

*This blog is built on the Lanyon theme by Mark Otto. Original theme documentation and licensing information can be found in the [Lanyon repository](https://github.com/poole/lanyon).*
