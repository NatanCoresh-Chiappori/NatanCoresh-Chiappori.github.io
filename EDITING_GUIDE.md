# Content Editing Guide

This guide shows you exactly where to edit each section of your personal website in `index.html`.

## 📝 Quick Reference

All content is in **`index.html`**. Just open it and search for the sections below!

---

## 1. **Page Title** (Browser Tab)
**Line 6:**
```html
<title>Your Name - Personal Website</title>
```
Change "Your Name" to your actual name.

---

## 2. **Navigation Logo** (Top Left)
**Line 16:**
```html
<div class="nav-logo">Your Name</div>
```
Change "Your Name" to your name or a logo text.

---

## 3. **Hero Section** (Main Landing Area)
**Lines 35-40:**

**Your Name:**
```html
<span class="title-line title-main">Your Name</span>
```

**Your Title/Role:**
```html
<p class="hero-subtitle">Designer & Developer</p>
```

**Your Description:**
```html
<p class="hero-description">Creating beautiful digital experiences with attention to detail and passion for innovation.</p>
```

**Button Text (optional):**
```html
<a href="#work" class="btn btn-primary">View My Work</a>
<a href="#contact" class="btn btn-secondary">Get In Touch</a>
```

---

## 4. **About Section**
**Lines 59-62:**

**Intro Paragraph:**
```html
<p class="about-intro">I'm a creative professional passionate about crafting exceptional digital experiences.</p>
```

**Additional Paragraphs:**
```html
<p>With a keen eye for design and a love for clean, efficient code...</p>
<p>When I'm not designing or coding, you'll find me...</p>
```

**Skills (Lines 67-90):**
To edit skills, change:
- **Skill Name:** The text inside `<span class="skill-name">Design</span>`
- **Skill Level:** The percentage in `style="width: 90%"` (change 90% to your level)

Example:
```html
<div class="skill-item">
    <span class="skill-name">Design</span>  <!-- Change skill name here -->
    <div class="skill-bar">
        <div class="skill-progress" style="width: 90%"></div>  <!-- Change percentage here -->
    </div>
</div>
```

To add/remove skills, copy the entire `<div class="skill-item">...</div>` block.

---

## 5. **Work/Portfolio Section**
**Lines 105-153:**

Each project is a `<div class="work-item">` block. To edit a project:

**Project Title (Line 112):**
```html
<h3 class="work-title">Project Title</h3>
```

**Project Description (Line 113):**
```html
<p class="work-description">A brief description of your project...</p>
```

**Project Tags (Lines 114-117):**
```html
<div class="work-tags">
    <span class="tag">Design</span>
    <span class="tag">Development</span>
    <span class="tag">Branding</span>
</div>
```

**Project Link (Line 119):**
```html
<a href="#" class="work-link">View Project →</a>
```
Change `href="#"` to your project URL.

**To Add Project Images:**
Replace lines 106-109:
```html
<div class="work-image">
    <div class="work-placeholder">
        <span>Project Image</span>
    </div>
</div>
```

With:
```html
<div class="work-image">
    <img src="images/project1.jpg" alt="Project Name">
</div>
```

**To Add/Remove Projects:**
Copy the entire `<div class="work-item">...</div>` block (lines 105-121) and paste it to add more, or delete it to remove.

---

## 6. **Contact Section**
**Line 166 - Contact Intro:**
```html
<p class="contact-intro">I'm always open to discussing new projects...</p>
```

**Email (Lines 168-173):**
```html
<a href="mailto:your.email@example.com" class="contact-item">
    <div class="contact-icon">✉</div>
    <div class="contact-info">
        <h3>Email</h3>
        <p>your.email@example.com</p>  <!-- Change email here -->
    </div>
</a>
```
Change both the `href="mailto:..."` and the `<p>` text.

**LinkedIn (Lines 175-180):**
```html
<a href="#" class="contact-item">  <!-- Add your LinkedIn URL here -->
    <div class="contact-icon">💼</div>
    <div class="contact-info">
        <h3>LinkedIn</h3>
        <p>Connect with me</p>  <!-- Optional: change text -->
    </div>
</a>
```

**GitHub (Lines 182-187):**
```html
<a href="#" class="contact-item">  <!-- Add your GitHub URL here -->
    <div class="contact-icon">🐙</div>
    <div class="contact-info">
        <h3>GitHub</h3>
        <p>View my code</p>  <!-- Optional: change text -->
    </div>
</a>
```

---

## 7. **Footer**
**Line 197:**
```html
<p>&copy; 2024 Your Name. All rights reserved.</p>
```
Change "Your Name" and the year if needed.

---

## 💡 Tips

1. **Save the file** after making changes
2. **Refresh your browser** to see updates
3. **Keep HTML tags intact** - only change the text between `>` and `<`
4. **For images:** Create an `images` folder and put your images there, then reference them like `images/photo.jpg`

---

## 🎨 Adding Your Own Images

1. Create an `images` folder in your project directory
2. Add your images to that folder
3. Reference them in HTML like: `<img src="images/your-image.jpg" alt="Description">`

---

## ✏️ Example: Quick Personalization

Here's a quick example of what to change:

**Before:**
```html
<span class="title-line title-main">Your Name</span>
<p class="hero-subtitle">Designer & Developer</p>
```

**After:**
```html
<span class="title-line title-main">John Doe</span>
<p class="hero-subtitle">Full Stack Developer</p>
```

That's it! Just find the text and replace it with your own content.

