#!/bin/bash

# Portfolio Item Generator Script
# Usage: ./add-portfolio-item.sh "Project Name" "Project Description"

if [ $# -lt 2 ]; then
    echo "Usage: $0 \"Project Name\" \"Project Description\""
    echo "Example: $0 \"My Awesome App\" \"A web application that does amazing things\""
    exit 1
fi

PROJECT_NAME="$1"
PROJECT_DESCRIPTION="$2"

# Convert project name to filename (lowercase, replace spaces with hyphens)
FILENAME=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g')

# Get current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Get next order number
LAST_ORDER=$(grep -h "^order:" _portfolio/*.md 2>/dev/null | sed 's/order: //' | sort -n | tail -1)
if [ -z "$LAST_ORDER" ]; then
    NEXT_ORDER=1
else
    NEXT_ORDER=$((LAST_ORDER + 1))
fi

# Create the markdown file
cat > "_portfolio/${FILENAME}.md" << EOF
---
title: "${PROJECT_NAME}"
description: "${PROJECT_DESCRIPTION}"
image: "/assets/img/portfolio/${FILENAME}.jpg"
technologies: ["Technology1", "Technology2", "Technology3"]
github: "https://github.com/yourusername/${FILENAME}"
demo: "https://your-demo-link.com"
date: ${CURRENT_DATE}
order: ${NEXT_ORDER}
---

## Project Overview

Provide a detailed overview of your project here. Explain what it does, why you built it, and what makes it special.

## Key Features

- **Feature 1**: Description of the first key feature
- **Feature 2**: Description of the second key feature
- **Feature 3**: Description of the third key feature

## Technologies Used

- **Frontend**: Describe the frontend technologies
- **Backend**: Describe the backend technologies
- **Database**: Describe the database technology
- **Other Tools**: Any other tools or services used

## Challenges and Solutions

### Challenge 1: Problem Description
Explain a technical challenge you faced and how you solved it.

### Challenge 2: Another Problem
Describe another challenge and your solution.

## What I Learned

- Key learning point 1
- Key learning point 2
- Key learning point 3

## Future Improvements

- Planned feature or improvement 1
- Planned feature or improvement 2
- Planned feature or improvement 3
EOF

echo "Portfolio item created: _portfolio/${FILENAME}.md"
echo "Don't forget to:"
echo "1. Add an image at: assets/img/portfolio/${FILENAME}.jpg"
echo "2. Update the technologies, GitHub, and demo URLs"
echo "3. Fill in the project details"
