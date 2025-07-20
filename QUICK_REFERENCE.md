# Little-Portal WHMCS Theme - Quick Reference

## Quick Start

### Essential File Structure
```
little-portal/
├── theme.yaml              # Theme configuration
├── layout.tpl             # Main layout
├── header.tpl             # Site header
├── footer.tpl             # Site footer
├── css/
│   ├── theme.min.css      # Main styles
│   └── custom.css         # Customizations
├── js/
│   ├── performance-optimizer.js  # Performance features
│   └── whmcs.js          # Core functions
└── includes/              # Reusable components
    ├── alert.tpl         # Alerts/notifications
    ├── modal.tpl         # Modal dialogs
    ├── sidebar.tpl       # Navigation sidebar
    └── tablelist.tpl     # Data tables
```

### Theme Configuration (theme.yaml)
```yaml
name: "Little-Portal"
properties:
  serverSidePagination: false
provides:
  bootstrap: 5.3.2
  jquery: 3.7.1
  fontawesome: 6.5.1
settings:
  primary-color: "#1E90FF"
  secondary-color: "#8B5CF6"
```

---

## Common Template Patterns

### Basic Page Template
```smarty
{* custom-page.tpl *}
{include file="$template/includes/flashmessage.tpl"}

<div class="card">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fas fa-icon"></i>
            Page Title
        </h3>
    </div>
    <div class="card-body">
        {* Page content here *}
    </div>
</div>
```

### Including Components
```smarty
{* Alert component *}
{include file="$template/includes/alert.tpl" 
    type="success" 
    msg="Operation completed successfully"}

{* Modal component *}
{include file="$template/includes/modal.tpl" 
    name="ConfirmModal"
    title="Confirm Action"
    submitAction="performAction()"}

{* Data table *}
{include file="$template/includes/tablelist.tpl" 
    tableName="DataList" 
    filterColumn="3"}
```

### Error Handling
```smarty
{if $errormessage}
    {include file="$template/includes/alert.tpl" 
        type="error" 
        errorshtml=$errormessage}
{/if}

{if $successmessage}
    {include file="$template/includes/alert.tpl" 
        type="success" 
        msg=$successmessage}
{/if}
```

---

## JavaScript API Reference

### Performance Optimizer
```javascript
// Available globally as window.LittlePortalOptimizer

// Initialize lazy loading
LittlePortalOptimizer.initLazyLoading();

// Monitor performance events
window.addEventListener('perf:lcp', function(event) {
    console.log('LCP:', event.detail.value);
});

window.addEventListener('perf:cls', function(event) {
    console.log('CLS:', event.detail.value);
});

window.addEventListener('perf:fid', function(event) {
    console.log('FID:', event.detail.value);
});
```

### WHMCS Core Functions
```javascript
// Show/hide loading overlay
showOverlay('Processing...');
hideOverlay();

// Safe redirects
clickableSafeRedirect(event, '/clientarea.php', false);

// Form field management
disableFields('payment-fields', true);  // Disable
disableFields('payment-fields', false); // Enable

// Checkbox management
checkAll('item-checkbox', masterCheckbox);

// Payment form toggles
showNewCardInputFields();
hideNewCardInputFields();
showNewBillingAddressFields();
hideNewBillingAddressFields();
```

---

## CSS Quick Reference

### Theme Colors (CSS Custom Properties)
```css
:root {
    --bs-primary: #1E90FF;
    --bs-secondary: #8B5CF6;
    --bs-success: #22c55e;
    --bs-info: #4c82f7;
    --bs-warning: #ffba08;
    --bs-danger: #ef4444;
}
```

### Common Component Classes
```css
/* Layout */
.main-content      /* Main content area */
.sidebar           /* Sidebar container */
.navbar            /* Top navigation */
.footer            /* Site footer */

/* Cards */
.card-sidebar      /* Sidebar card styling */
.card-minimise     /* Collapsible card toggle */

/* Buttons */
.btn-primary       /* Primary action button */
.btn-secondary     /* Secondary button */
.loading           /* Loading state */

/* Forms */
.form-control      /* Form inputs */
.was-validated     /* Validation state */

/* Utilities */
.lazy              /* Lazy loading images */
.w-hidden          /* Hidden element */
```

### Responsive Utilities
```css
.d-none            /* Hidden on all screens */
.d-md-block        /* Visible on medium+ screens */
.d-lg-none         /* Hidden on large+ screens */
```

---

## Component Usage Examples

### Alert Component
```smarty
{* Success alert *}
{include file="$template/includes/alert.tpl" 
    type="success" 
    msg="Settings saved successfully!"
    textcenter=true}

{* Error alert with multiple messages *}
{include file="$template/includes/alert.tpl" 
    type="error" 
    title="Validation Errors"
    errorshtml="<li>Email is required</li><li>Password too short</li>"}

{* Warning alert *}
{include file="$template/includes/alert.tpl" 
    type="warning" 
    msg="Your subscription expires in 3 days"}
```

### Modal Component
```smarty
{* Confirmation modal *}
{include file="$template/includes/modal.tpl" 
    name="DeleteConfirm"
    title="Confirm Deletion"
    content="Are you sure you want to delete this item?"
    submitAction="deleteItem()"
    submitLabel="Delete"
    closeLabel="Cancel"}

{* JavaScript usage *}
<script>
$('#modalDeleteConfirm').modal('show');
</script>
```

### Table Component
```smarty
{* Basic table *}
{include file="$template/includes/tablelist.tpl" 
    tableName="InvoicesList"}

{* Advanced table with filtering and custom settings *}
{include file="$template/includes/tablelist.tpl" 
    tableName="ServicesList" 
    filterColumn="4" 
    noSortColumns="0,5"
    startOrderCol="2"}
```

---

## Form Patterns

### Standard Form
```smarty
<form method="post" action="process.php">
    <div class="form-group mb-3">
        <label for="email" class="form-label">Email Address</label>
        <input type="email" 
               class="form-control" 
               id="email" 
               name="email" 
               value="{$email}" 
               required />
    </div>
    
    <div class="form-group mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" 
               class="form-control" 
               id="password" 
               name="password" 
               required />
    </div>
    
    {include file="$template/includes/captcha.tpl" 
        captchaForm=$captchaForm}
    
    <button type="submit" class="btn btn-primary">
        Submit
    </button>
</form>
```

### Form with Validation
```smarty
<form method="post" action="process.php" data-validate>
    <div class="form-group mb-3">
        <label for="domain" class="form-label">Domain Name</label>
        <input type="text" 
               class="form-control" 
               id="domain" 
               name="domain" 
               data-rule="validDomain"
               required />
    </div>
    
    <div class="form-group mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" 
               class="form-control pwd" 
               id="password" 
               name="password" 
               data-rule="strongPassword"
               required />
    </div>
    
    {include file="$template/includes/pwstrength.tpl"}
    
    <button type="submit" class="btn btn-primary">
        Create Account
    </button>
</form>
```

---

## Customization Snippets

### Override Theme Colors
```css
/* css/custom.css */
:root {
    --bs-primary: #your-brand-color;
    --bs-secondary: #your-secondary-color;
}

/* Update navbar */
.navbar {
    background: var(--bs-primary) !important;
}

/* Custom button styles */
.btn-custom {
    background-color: #your-color;
    border-color: #your-color;
    color: white;
}
```

### Custom JavaScript
```javascript
// js/custom.js
document.addEventListener('DOMContentLoaded', function() {
    // Initialize custom features
    initCustomComponents();
    
    // Handle custom events
    document.addEventListener('click', function(event) {
        if (event.target.matches('.custom-button')) {
            handleCustomButton(event);
        }
    });
});

function initCustomComponents() {
    // Your custom initialization code
    console.log('Custom components initialized');
}

function handleCustomButton(event) {
    event.preventDefault();
    // Custom button logic
}
```

### Custom Component
```smarty
{* includes/custom-widget.tpl *}
<div class="custom-widget card">
    <div class="card-header">
        <h5 class="card-title">
            {if $icon}<i class="{$icon}"></i>{/if}
            {$title}
        </h5>
    </div>
    <div class="card-body">
        {$content}
        
        {if $actions}
            <div class="widget-actions mt-3">
                {foreach $actions as $action}
                    <a href="{$action.url}" class="btn btn-sm btn-outline-primary">
                        {$action.label}
                    </a>
                {/foreach}
            </div>
        {/if}
    </div>
</div>
```

---

## WHMCS Hook Examples

### Add Custom CSS
```php
<?php
add_hook('ClientAreaHeadOutput', 1, function($vars) {
    return '<link rel="stylesheet" href="/templates/little-portal/css/custom-feature.css">';
});
```

### Add Custom JavaScript
```php
<?php
add_hook('ClientAreaFooterOutput', 1, function($vars) {
    return '<script src="/templates/little-portal/js/custom-feature.js"></script>';
});
```

### Custom Sidebar Menu
```php
<?php
add_hook('ClientAreaPrimarySidebar', 1, function($primarySidebar) {
    $primarySidebar->addChild('custom-section', [
        'label' => 'Custom Features',
        'uri' => 'custom.php',
        'icon' => 'fas fa-star'
    ]);
});
```

---

## Troubleshooting

### Common Issues

#### 1. Templates Not Loading
**Problem:** Changes to templates not appearing
**Solution:**
```bash
# Clear template cache
rm -rf /path/to/whmcs/templates_c/little-portal/*

# Or in WHMCS Admin
# Setup > General Settings > Security > Force Template Compile
```

#### 2. JavaScript Errors
**Problem:** `LittlePortalOptimizer is not defined`
**Solution:**
```html
<!-- Ensure scripts load in correct order -->
<script src="jquery.min.js"></script>
<script src="performance-optimizer.js"></script>
<script>
// Check if optimizer is available
if (window.LittlePortalOptimizer) {
    // Use optimizer
}
</script>
```

#### 3. CSS Not Applied
**Problem:** Custom styles not working
**Solution:**
```css
/* Use more specific selectors */
.little-portal .custom-class {
    /* Your styles */
}

/* Or use !important sparingly */
.custom-class {
    color: red !important;
}
```

#### 4. Bootstrap Conflicts
**Problem:** Bootstrap components not working
**Solution:**
```javascript
// Ensure Bootstrap 5 syntax
$('#myModal').modal('show');  // ✓ Correct
$('#myModal').modal();        // ✗ Bootstrap 4 syntax
```

### Performance Issues

#### 1. Slow Page Load
**Checks:**
- Enable performance monitoring
- Check network tab in DevTools
- Verify lazy loading is working
- Optimize images

#### 2. Memory Leaks
**Checks:**
- Disconnect observers when done
- Remove event listeners
- Check for global variable pollution

### Debugging Tools

```javascript
// Enable debug mode
localStorage.setItem('theme-debug', 'true');

// Performance monitoring
console.time('page-load');
window.addEventListener('load', () => {
    console.timeEnd('page-load');
});

// Check Web Vitals
new PerformanceObserver((list) => {
    list.getEntries().forEach((entry) => {
        console.log(entry.name, entry.value);
    });
}).observe({entryTypes: ['measure', 'navigation']});
```

---

## Migration Guide

### From Bootstrap 4 to 5
```html
<!-- Bootstrap 4 -->
<div data-toggle="modal" data-target="#myModal">

<!-- Bootstrap 5 -->
<div data-bs-toggle="modal" data-bs-target="#myModal">
```

### Updating jQuery
```javascript
// Old jQuery patterns
$(document).ready(function() {
    // Code here
});

// Modern approach
document.addEventListener('DOMContentLoaded', function() {
    // Code here
});
```

---

## Performance Optimization

### Image Optimization
```html
<!-- Lazy loading -->
<img data-src="/image.jpg" 
     alt="Description" 
     class="lazy"
     loading="lazy" />

<!-- Responsive images -->
<img src="/image-small.jpg"
     srcset="/image-medium.jpg 768w, /image-large.jpg 1200w"
     sizes="(max-width: 768px) 100vw, 50vw"
     alt="Description" />
```

### CSS Optimization
```css
/* Use CSS containment */
.component {
    contain: layout style paint;
}

/* Optimize animations */
.animation {
    will-change: transform;
    transform: translateZ(0); /* Hardware acceleration */
}

@media (prefers-reduced-motion: reduce) {
    .animation {
        animation: none;
    }
}
```

### JavaScript Optimization
```javascript
// Use requestIdleCallback for non-critical tasks
if (window.requestIdleCallback) {
    requestIdleCallback(() => {
        initializeNonCriticalFeatures();
    });
} else {
    setTimeout(initializeNonCriticalFeatures, 1);
}

// Debounce expensive operations
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}
```

---

## Useful Resources

### Official Documentation
- [WHMCS Developer Documentation](https://developers.whmcs.com/)
- [Bootstrap 5 Documentation](https://getbootstrap.com/docs/5.3/)
- [jQuery Documentation](https://api.jquery.com/)

### Tools
- [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools)
- [Lighthouse](https://developers.google.com/web/tools/lighthouse)
- [axe DevTools](https://www.deque.com/axe/devtools/) (Accessibility)

### Performance
- [Web Vitals](https://web.dev/vitals/)
- [PageSpeed Insights](https://pagespeed.web.dev/)
- [GTmetrix](https://gtmetrix.com/)

---

This quick reference guide provides essential information for working with the Little-Portal WHMCS theme. Bookmark this page for quick access to common patterns and solutions.