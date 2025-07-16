---
layout: page
title: Portfolio
permalink: /portfolio/
---

<div class="portfolio-grid">
  {% assign sorted_portfolio = site.portfolio | sort: 'order' %}
  {% for item in sorted_portfolio %}
    <div class="portfolio-item">
      <a href="{{ item.url }}">
        {% if item.image %}
          <img src="{{ item.image }}" alt="{{ item.title }}">
        {% endif %}
        <div class="portfolio-content">
          <h3>{{ item.title }}</h3>
          <p>{{ item.description }}</p>
          {% if item.technologies %}
            <div class="tech-tags">
              {% for tech in item.technologies %}
                <span class="tech-tag">{{ tech }}</span>
              {% endfor %}
            </div>
          {% endif %}
        </div>
      </a>
    </div>
  {% endfor %}
</div>
