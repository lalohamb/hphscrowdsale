
# The Ultimate Guide to bolt.new Prompting: Build Better Apps Without Deep Technical Knowledge
https://support.bolt.new/The-Ultimate-Guide-to-bolt-new-Prompting-Build-Better-Apps-Without-Deep-Technical-Knowledge-1371ce6babea808ba6ded876e75e5921

## Building Modern Applications

Building apps used to require deep technical knowledge and months of development time. With bolt.new and modern AI tools, anyone can create full-stack applications. Here's how.

Think of prompts as conversations with an expert developer. The better you explain what you want, the better results you'll get. This guide shows you how.

## Starting New Projects

Use this template to begin:

> “I need a [type] application with:

Tech Stack:
- Frontend: React with TypeScript
- Styling: Tailwind CSS
- Auth: Firebase
- Database: [choice]

Core Features:
1. User authentication
2. [Main feature]
3. [Secondary features]

Start with the main page containing:
[Detailed page requirements]”
> 

### 
> “I need a crowdsale application with:

Tech Stack:
- Frontend: React
- Styling: Tailwind CSS
- 

Core Features:
1. User authentication
2. Token purchase
3. Token refund
4. Automatically refund if goal not met
5. purchase in ETH
6. Thirdweb Wallet Intergration

7. [Use Chatgpt to review contract for features]

## Core Prompting Strategies

### Start with the Big Picture:

- Begin with your end goal and work backwards
- Let bolt interpret your vision before diving into specifics
- Be intentionally vague sometimes - bolt often surprises you with better solutions

Example:

> "I want to build a marketplace app where:
- Users list items for sale
- Buyers browse and purchase
- Sellers track their sales

[*other stuff you want]*"
> 

Sometimes be intentionally vague to let bolt surprise you with creative solutions. 

You might get something even better than what you imagined.

###
### Break Down into Pieces

Instead of building everything at once, request specific parts:

1. First, the main page
2. Then, the listing form
3. Next, the search feature
4. Finally, user profiles

Pro Tips:

- Break large files into logical components (header, main content, sidebar)
- For critical changes use "Do not touch anything else, focus only on this task"
- When debugging gets stuck, use "Let's take a step back" to reset
- Use .bolt/ignore to restrict which files bolt can access when working on specific sections

###
### Break Down into Pieces

Instead of building everything at once, request specific parts:

1. [ Design file path ]
2. First, the main page or Landing Page
2. Then, crowdsale page (consist of buy, sale, refund, coponents, et., )
3. Next, Terms of Usage page text only maybe a check box for user to agree. 
4. Finally, user profiles for token users

Pro Tips:

- Break large files into logical components (header, main content, sidebar)
- For critical changes use "Do not touch anything else, focus only on this task"
- When debugging gets stuck, use "Let's take a step back" to reset
- Use .bolt/ignore to restrict which files bolt can access when working on specific sections


# Design and Component Strategies

## Copy and Match Designs

### Adapting Designs You Love

Found a design you love? Here's how to use it:

1. Find and copy component code (or screenshot) 
2. Show it to bolt:

> "Make my navigation menu look like this style:
[paste component code/screenshot]
Keep the same visual style but change it to include these menu items:

- Home
- Products
- About Us"
> 

### Style Pattern Library

Save working components and styles. Use these prompt formats:

*For New Components:*

> “ Using this button style:
[paste button code]
Create matching components for:
- Form inputs
- Cards
- Alert messages”
> 

*For Design Systems:*

> “Look at this card design:
[paste code]
Create a product grid using the same:
- Shadow effects
- Border styles
- Color scheme
- Spacing patterns”
> 

---

## Development Best Practices

### Testing Changes Safely

*Before making changes:*

> “don't change any code whatsoever.
Theoretically, if I want to add [feature],
what code changes would be needed?”
> 

### Handling Issues

When problems arise:

1. Save working versions
2. Fork the project
3. Break into smaller prompts
4. Check GitHub issues

Example error prompt:

> “This component worked before:
[paste working version]
Now it shows this error:
[paste error]
How do I fix it?”
> 

### Success Strategies

- Save working code and components
- Document successful prompts
- Build a reference library
- Test features independently
- Avoid mixing database implementations
- Add auth after UI is stable

---

## Data Management

### Storage Setup

Keep data requirements clear:

> "I need to save:
- User profiles
- Product listings
- Order history"
> 

### Database Options

Works Well:

- [Firebase: Best for beginners](https://www.youtube.com/watch?v=1GfqnOAKr9M)
- [Supabase: Easy PostgreSQL](https://www.youtube.com/watch?v=yRlVtXkDSp0)

Challenging:

- AWS: Limited testing
- External SQL: Mixed results

Integration Tips:

- Start with simple integrations
- Let bolt guide API setup
- Watch for over-complication

---

## Project Organization

Comments:

- Request bolt add detailed comments
- Explain function purposes
- Document data flow
- Note key decisions

Backups:

- Fork project in StackBlitz frequently
- Download full codebase
- Document major changes

Prompt Library:

- Save successful commands
- Document architecture decisions
- Keep debugging prompts
- Note common fixes

## Natural Communication Approaches

### Voice-to-Text Prompting

Sometimes the simplest way to explain your vision is to speak it out. Use your device's voice-to-text (Apple Dictation, OpenAI or Super Whisper) to capture detailed ideas naturally.

### Example Voice Prompt

Raw

```
So what I want is a dashboard that shows all my customer information, and I want it organized kind of like how Gmail does it where you have the list on the left side and when you click on a customer it shows all their details on the right side and make sure there's enough space between everything so it's easy to read and maybe we can have some kind of color coding for different customer status levels like red for urgent issues and green for active customers and yellow for ones we need to follow up with
```

![CleanShot 2024-11-17 at 17.01.18@2x.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/84c3f1ef-7a9d-479f-a780-6f07e320ea9c/fa155769-6c38-4e15-bb36-c7016bed404c/CleanShot_2024-11-17_at_17.01.182x.png)

If its too unclear, you can always optimize it using the one-click prompt optimizer built in bolt. 

### Tips for Effective Voice Prompts

- Speak naturally, use examples
- Focus on visuals and user interactions
- Don't worry about perfect structure

## Helpful Resources

- [Bolt Prompter (ChatGPT)](http://chatgpt.com/g/g-tozliiBeO-bolt-prompter)
- [Prompt Examples](http://cursor.directory)
- [Updates & Issues](https://www.notion.so/1411ce6babea800fa23fe39e0bfc4608?pvs=21)

## Common Questions

### Q: How detailed should my prompts be?

A: More detail helps. Include examples, reference code, and specific requirements.

### Q: What if I find code I like on another website?

A: Copy the code and ask bolt.new to adapt it for your needs. Include CSS and configuration files for best results.

### Q: How do I maintain consistent style?

A: Save your favorite components and show them to bolt.new when creating new ones. Ask it to match the style.

### Q: What if bolt.new doesn't understand?

A: Break your request into smaller parts. Show examples of what you want.

Your success with bolt.new depends on clear communication and good references. Save what works, learn from what doesn't, and build your library of effective prompts and components. Remember: these practices come from community experience and continue to evolve as bolt.new actively develops. Check the GitHub repository for latest updates.

Happy building :)

---

Follow me on X: [@djahlor](https://twitter.com/djahlor)

Contact: [info@djahlor.com](mailto:info@djahlor.com)