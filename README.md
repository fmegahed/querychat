---
sdk: docker
app_port: 7860
title: ISA 401 OEWS Jobs Explorer
emoji: 📊
colorFrom: yellow
colorTo: yellow
pinned: false
license: mit
short_description: Explore U.S. occupational employment and wage data
---

# ISA 401 OEWS Jobs Explorer

**Your AI-Powered Assistant for Exploring Occupational Employment and Wage Statistics**

[![Live App](https://img.shields.io/badge/Live_App-Hugging_Face-yellow)](https://huggingface.co/spaces/fmegahed/querychat_demo)

Explore the U.S. Bureau of Labor Statistics' Occupational Employment and Wage Statistics (OEWS) dataset using natural language queries.

---

## What is this app?

This Shiny application uses AI-powered natural language processing to help you explore the OEWS dataset. Instead of writing SQL queries, simply ask questions in plain English and get instant results.

**Example queries:**
- "What are the top 10 highest paying occupations in Ohio?"
- "Show me employment by industry for software developers"
- "What is the median wage for nurses nationally?"
- "Compare wages between California and Texas for data scientists"

---

## Dataset Information

**Dataset:** Occupational Employment and Wage Statistics (OEWS) Survey (May 2024 Estimates)
**Publisher:** U.S. Bureau of Labor Statistics (BLS), Department of Labor
**Website:** https://www.bls.gov/oes/

The OEWS program produces employment and wage estimates annually for over 800 occupations. These estimates are available for the nation as a whole, for individual states, and for metropolitan and nonmetropolitan areas.

### Key Fields

| Field | Description |
|-------|-------------|
| `occ_title` | Occupation title |
| `area_title` | Geographic area name |
| `tot_emp` | Total employment |
| `a_mean` | Mean annual wage |
| `a_median` | Median annual wage |
| `h_mean` | Mean hourly wage |

---

## Features

- **Natural Language Queries**: Ask questions in plain English
- **SQL Transparency**: See the generated SQL for each query
- **Interactive Data Table**: Sort, filter, and export results
- **Miami University Theming**: Branded for ISA 401 course use

---

## Running Locally

**With R:**
```r
# Install dependencies
renv::restore()

# Run the app
shiny::runApp('.', host = '0.0.0.0', port = 7860)
```

**With Docker:**
```bash
# Build the image
docker build -t oews-explorer .

# Run with OpenAI API key
docker run --rm -p 7860:7860 -e OPENAI_API_KEY=$OPENAI_API_KEY oews-explorer
```

---

## Required Environment Variable

This app requires an OpenAI API key to function:

```bash
export OPENAI_API_KEY="your-api-key-here"
```

On Hugging Face Spaces, set this as a secret in your Space settings.

---

## Technology Stack

- **[Shiny](https://shiny.posit.co/)** - Web application framework for R
- **[querychat](https://github.com/posit-dev/querychat)** - Natural language data querying
- **[bslib](https://rstudio.github.io/bslib/)** - Bootstrap theming for Shiny
- **[DT](https://rstudio.github.io/DT/)** - Interactive data tables

---

## Course Information

This application was developed for **ISA 401** at **Miami University** to help students explore and understand labor market data using modern AI-powered tools.

---

## Data Source

Bureau of Labor Statistics, U.S. Department of Labor. *Occupational Employment and Wage Statistics (OEWS), May 2024 Estimates.*
https://www.bls.gov/oes/
