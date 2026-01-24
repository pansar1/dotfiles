---
name: explain
description: Explain code with visual diagrams and analogies. Use when explaining how code works, teaching about a codebase, or when asked "how does this work?"
---

# Code Explainer

Explain code in a clear, educational way using multiple techniques.

## Explanation Structure

### 1. Start with an Analogy

Compare the code to something from everyday life:
- A function that validates input → "Like a bouncer checking IDs at a club"
- Event-driven architecture → "Like a restaurant where waiters take orders to the kitchen"
- Caching → "Like keeping frequently used items on your desk instead of filing cabinet"

### 2. Draw a Diagram

Use ASCII art to visualize:

**Flow diagrams:**
```
Request → Auth → Validate → Process → Response
            ↓
         Error Handler
```

**Data flow:**
```
┌─────────┐    ┌─────────┐    ┌─────────┐
│  Input  │───▶│ Process │───▶│ Output  │
└─────────┘    └─────────┘    └─────────┘
```

**Component relationships:**
```
┌──────────────────────────────────┐
│           Application            │
├──────────────────────────────────┤
│  ┌────────┐  ┌────────────────┐  │
│  │ Router │──│   Controllers  │  │
│  └────────┘  └───────┬────────┘  │
│                      │           │
│              ┌───────▼────────┐  │
│              │    Services    │  │
│              └───────┬────────┘  │
│                      │           │
│              ┌───────▼────────┐  │
│              │   Database     │  │
│              └────────────────┘  │
└──────────────────────────────────┘
```

### 3. Walk Through Step-by-Step

Number each step and explain what happens:

1. **Entry point**: Where execution begins
2. **Data transformation**: How data changes as it flows
3. **Decision points**: Where branching occurs
4. **Side effects**: External interactions (DB, API, etc.)
5. **Return value**: What comes out

### 4. Highlight a Gotcha

Point out common mistakes or misconceptions:
- "A common mistake is thinking X, but actually Y"
- "This looks like Z, but it's different because..."
- "Watch out for this edge case..."

## Tone

- Conversational, not academic
- Use "you" and "we"
- Build from simple to complex
- Celebrate clever patterns but explain why they're clever
