---
layout: page
title: Resume
description: >
  Bibin's professional resume - Software Engineer with expertise in systems programming, 
  AI/ML, and robotics.
hide_description: true
---

<div class="layout-resume">
  <!-- Resume content will be generated from _data/resume.yml -->
  {% assign resume = site.data.resume %}
  
  <div class="row">
    <div class="col-md-6">
      <!-- Left Column -->
      {% if resume.work %}
      <section>
        <h2>{{ site.data.strings.resume.work | default: "Work Experience" }}</h2>
        {% for job in resume.work %}
        <article>
          <h3>{{ job.position }}</h3>
          <p><strong>{{ job.company }}</strong> • {{ job.startDate }}{% if job.endDate %} - {{ job.endDate }}{% else %} - Present{% endif %}</p>
          {% if job.website %}<p><a href="{{ job.website }}">{{ job.website }}</a></p>{% endif %}
          {% if job.summary %}<p>{{ job.summary }}</p>{% endif %}
          {% if job.highlights %}
          <ul>
            {% for highlight in job.highlights %}
            <li>{{ highlight }}</li>
            {% endfor %}
          </ul>
          {% endif %}
        </article>
        {% endfor %}
      </section>
      {% endif %}
      
      {% if resume.education %}
      <section>
        <h2>{{ site.data.strings.resume.education | default: "Education" }}</h2>
        {% for edu in resume.education %}
        <article>
          <h3>{{ edu.studyType }} in {{ edu.area }}</h3>
          <p><strong>{{ edu.institution }}</strong> • {{ edu.startDate }}{% if edu.endDate %} - {{ edu.endDate }}{% endif %}</p>
          {% if edu.gpa %}<p>GPA: {{ edu.gpa }}</p>{% endif %}
          {% if edu.courses %}
          <p><strong>Relevant Courses:</strong> {{ edu.courses | join: ", " }}</p>
          {% endif %}
        </article>
        {% endfor %}
      </section>
      {% endif %}
      
      {% if resume.projects %}
      <section>
        <h2>{{ site.data.strings.resume.projects | default: "Projects" }}</h2>
        {% for project in resume.projects %}
        <article>
          <h3>{{ project.name }}</h3>
          {% if project.url %}<p><a href="{{ project.url }}">{{ project.url }}</a></p>{% endif %}
          {% if project.description %}<p>{{ project.description }}</p>{% endif %}
          {% if project.highlights %}
          <ul>
            {% for highlight in project.highlights %}
            <li>{{ highlight }}</li>
            {% endfor %}
          </ul>
          {% endif %}
          {% if project.keywords %}
          <p><strong>Technologies:</strong> {{ project.keywords | join: ", " }}</p>
          {% endif %}
        </article>
        {% endfor %}
      </section>
      {% endif %}
    </div>
    
    <div class="col-md-6">
      <!-- Right Column -->
      {% if resume.skills %}
      <section>
        <h2>{{ site.data.strings.resume.skills | default: "Skills" }}</h2>
        {% for skill in resume.skills %}
        <article>
          <h3>{{ skill.name }}</h3>
          {% if skill.keywords %}
          <p>{{ skill.keywords | join: ", " }}</p>
          {% endif %}
        </article>
        {% endfor %}
      </section>
      {% endif %}
      
      {% if resume.languages %}
      <section>
        <h2>{{ site.data.strings.resume.languages | default: "Languages" }}</h2>
        {% for lang in resume.languages %}
        <p><strong>{{ lang.language }}:</strong> {{ lang.fluency }}</p>
        {% endfor %}
      </section>
      {% endif %}
      
      {% if resume.interests %}
      <section>
        <h2>{{ site.data.strings.resume.interests | default: "Interests" }}</h2>
        {% for interest in resume.interests %}
        <p><strong>{{ interest.name }}:</strong> {{ interest.keywords | join: ", " }}</p>
        {% endfor %}
      </section>
      {% endif %}
      
      {% if resume.awards %}
      <section>
        <h2>{{ site.data.strings.resume.awards | default: "Awards" }}</h2>
        {% for award in resume.awards %}
        <article>
          <h3>{{ award.title }}</h3>
          <p><strong>{{ award.awarder }}</strong> • {{ award.date }}</p>
          {% if award.summary %}<p>{{ award.summary }}</p>{% endif %}
        </article>
        {% endfor %}
      </section>
      {% endif %}
      
      {% if resume.publications %}
      <section>
        <h2>{{ site.data.strings.resume.publications | default: "Publications" }}</h2>
        {% for pub in resume.publications %}
        <article>
          <h3>{{ pub.name }}</h3>
          <p><strong>{{ pub.publisher }}</strong> • {{ pub.releaseDate }}</p>
          {% if pub.website %}<p><a href="{{ pub.website }}">{{ pub.website }}</a></p>{% endif %}
          {% if pub.summary %}<p>{{ pub.summary }}</p>{% endif %}
        </article>
        {% endfor %}
      </section>
      {% endif %}
    </div>
  </div>
</div>

<style>
.layout-resume {
  max-width: 1000px;
  margin: 0 auto;
}

.layout-resume .row {
  display: flex;
  gap: 2rem;
}

.layout-resume .col-md-6 {
  flex: 1;
}

.layout-resume section {
  margin-bottom: 2rem;
}

.layout-resume h2 {
  color: var(--accent-color);
  border-bottom: 2px solid var(--accent-color);
  padding-bottom: 0.5rem;
  margin-bottom: 1rem;
}

.layout-resume article {
  margin-bottom: 1.5rem;
}

.layout-resume h3 {
  margin-bottom: 0.25rem;
  color: var(--heading-color);
}

.layout-resume article p {
  margin-bottom: 0.5rem;
}

.layout-resume ul {
  margin-left: 1rem;
  margin-bottom: 0.5rem;
}

@media (max-width: 768px) {
  .layout-resume .row {
    flex-direction: column;
    gap: 1rem;
  }
}

@media print {
  .layout-resume {
    font-size: 0.9rem;
  }
  
  .layout-resume .row {
    gap: 1rem;
  }
  
  .layout-resume section {
    margin-bottom: 1rem;
  }
  
  .layout-resume article {
    margin-bottom: 1rem;
  }
}
</style>
