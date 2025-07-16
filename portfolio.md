---
layout: page
title: Portfolio
permalink: /portfolio/
---

<div class="portfolio-grid">
  {% for item in site.data.portfolio %}
    <div class="portfolio-item">
      <a href="{{ item.url }}">
        <img src="{{ item.image }}" alt="{{ item.title }}">
        <h3>{{ item.title }}</h3>
        <p>{{ item.description }}</p>
      </a>
    </div>
  {% endfor %}
</div>
