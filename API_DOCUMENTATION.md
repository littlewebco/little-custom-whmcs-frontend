# Little-Portal WHMCS Theme - API Documentation

## Table of Contents

1. [Theme Overview](#theme-overview)
2. [JavaScript APIs](#javascript-apis)
3. [Template Components](#template-components)
4. [CSS Classes and Components](#css-classes-and-components)
5. [Configuration APIs](#configuration-apis)
6. [Template Variables](#template-variables)
7. [Usage Examples](#usage-examples)
8. [Best Practices](#best-practices)

---

## Theme Overview

Little-Portal is a modern WHMCS client area theme based on the official Twenty-One template with enhanced performance optimizations and modern UI components.

### Key Features
- Bootstrap 5.3.2 framework
- jQuery 3.7.1 compatibility
- Font Awesome 6.5.1 icons
- Performance optimization engine
- Client-side pagination
- Responsive design
- Google Tag Manager integration

---

## JavaScript APIs

### Performance Optimizer (`window.LittlePortalOptimizer`)

The theme includes a comprehensive performance optimization engine with the following public methods:

#### `LittlePortalOptimizer.initLazyLoading()`

Initializes lazy loading for images using Intersection Observer API.

**Usage:**
```javascript
// Automatically called on page load, but can be manually triggered
LittlePortalOptimizer.initLazyLoading();
```

**HTML Setup:**
```html
<img data-src="/path/to/image.jpg" alt="Description" class="lazy" />
```

#### `LittlePortalOptimizer.initPreloading()`

Preloads critical resources on user interaction to improve perceived performance.

**Usage:**
```javascript
// Automatically enabled - preloads common WHMCS pages and assets
LittlePortalOptimizer.initPreloading();
```

#### `LittlePortalOptimizer.initFormOptimizations()`

Optimizes form interactions with loading states and validation enhancements.

**Usage:**
```javascript
// Automatically applied to all forms
LittlePortalOptimizer.initFormOptimizations();
```

**Features:**
- Auto-disables submit buttons during form submission
- Adds loading states to form elements
- Debounced handling for multi-select elements

#### `LittlePortalOptimizer.initModalOptimizations()`

Enhances modal performance and user experience.

**Usage:**
```javascript
LittlePortalOptimizer.initModalOptimizations();
```

#### `LittlePortalOptimizer.initPerformanceMonitoring()`

Monitors Web Vitals (LCP, CLS, FID) and dispatches custom events.

**Usage:**
```javascript
// Listen for performance events
window.addEventListener('perf:lcp', function(event) {
    console.log('LCP Value:', event.detail.value);
});

window.addEventListener('perf:cls', function(event) {
    console.log('CLS Value:', event.detail.value);
});

window.addEventListener('perf:fid', function(event) {
    console.log('FID Value:', event.detail.value);
});
```

### WHMCS Core Functions (`whmcs.js`)

#### Form and UI Functions

##### `disableFields(className, disabledState)`

Enables or disables form fields by class name.

**Parameters:**
- `className` (string): CSS class name of fields to modify
- `disabledState` (boolean): True to disable, false to enable

**Usage:**
```javascript
// Disable all fields with 'payment-fields' class
disableFields('payment-fields', true);

// Re-enable fields
disableFields('payment-fields', false);
```

##### `checkAll(className, masterControl)`

Toggles checkboxes based on a master checkbox control.

**Parameters:**
- `className` (string): Class name of checkboxes to control
- `masterControl` (object): Master checkbox element

**Usage:**
```html
<input type="checkbox" id="master" onchange="checkAll('item-check', this)" />
<input type="checkbox" class="item-check" />
<input type="checkbox" class="item-check" />
```

##### `showOverlay(msg)` / `hideOverlay()`

Shows/hides a full-page loading overlay.

**Usage:**
```javascript
// Show overlay
showOverlay('Processing your request...');

// Hide overlay
hideOverlay();
```

#### Navigation Functions

##### `clickableSafeRedirect(clickEvent, target, newWindow)`

Safely handles redirects with proper event handling.

**Parameters:**
- `clickEvent` (Event): The click event object
- `target` (string): URL to redirect to
- `newWindow` (boolean): Whether to open in new window

**Usage:**
```javascript
// Safe redirect in same window
clickableSafeRedirect(event, '/clientarea.php', false);

// Open in new window
clickableSafeRedirect(event, '/support/', true);
```

##### `popupWindow(addr, popname, w, h, features)`

Opens a popup window with specified dimensions.

**Parameters:**
- `addr` (string): URL to open
- `popname` (string): Window name
- `w` (number): Width in pixels
- `h` (number): Height in pixels
- `features` (string): Additional window features

**Usage:**
```javascript
popupWindow('/help/', 'help', 800, 600, 'scrollbars=yes');
```

#### Domain and SSL Functions

##### `useDefaultWhois(regType)` / `useCustomWhois(regType)`

Toggles between default and custom WHOIS information.

**Usage:**
```javascript
// Use default WHOIS for domain registration
useDefaultWhois('register');

// Use custom WHOIS
useCustomWhois('register');
```

#### Payment Functions

##### `showNewBillingAddressFields()` / `hideNewBillingAddressFields()`

Shows/hides billing address form fields.

**Usage:**
```javascript
// Show billing address fields
showNewBillingAddressFields();

// Hide billing address fields
hideNewBillingAddressFields();
```

##### `showNewCardInputFields()` / `hideNewCardInputFields()`

Shows/hides credit card input fields.

**Usage:**
```javascript
// Show card input fields
showNewCardInputFields();

// Hide card input fields
hideNewCardInputFields();
```

### Bootstrap Initialization

The theme automatically initializes Bootstrap 5 components:

```javascript
// Auto-migration from Bootstrap 4 to 5 data attributes
document.querySelectorAll('[data-toggle]').forEach(function(element) {
    element.setAttribute('data-bs-' + element.getAttribute('data-toggle'), '');
    element.removeAttribute('data-toggle');
});

// Initialize dropdowns, tooltips, and popovers
```

---

## Template Components

### Core Layout Components

#### Header (`header.tpl`)

Main navigation and branding component.

**Template Variables:**
- `$companyname`: Company name for branding
- `$google_tag_manager_id`: GTM container ID (optional)
- `$language`: Current language code
- `$templatefile`: Current template filename

**Usage:**
```smarty
{include file="$template/header.tpl"}
```

#### Footer (`footer.tpl`)

Site footer with company information and links.

**Template Variables:**
- `$companyname`: Company name
- `$date_year`: Current year
- `$WEB_ROOT`: Site root URL

**Customization:**
Edit footer links in lines 25-35 of `footer.tpl`.

#### Layout (`layout.tpl`)

Main page layout wrapper handling sidebar and content areas.

**Template Variables:**
- `$primarySidebar`: Primary sidebar menu object
- `$secondarySidebar`: Secondary sidebar menu object
- `$inShoppingCart`: Boolean for cart pages
- `$skipMainBodyContainer`: Skip container wrapper

### UI Components

#### Alert Component (`includes/alert.tpl`)

Displays notification messages with Bootstrap styling.

**Parameters:**
- `type`: Alert type (success, error, warning, info, danger)
- `msg`: Message text
- `title`: Optional title
- `textcenter`: Center align text (boolean)
- `errorshtml`: HTML formatted error list

**Usage:**
```smarty
{include file="$template/includes/alert.tpl" 
    type="success" 
    msg="Operation completed successfully" 
    textcenter=true}

{include file="$template/includes/alert.tpl" 
    type="error" 
    title="Error Occurred"
    errorshtml="<li>Field is required</li><li>Invalid format</li>"}
```

#### Modal Component (`includes/modal.tpl`)

Reusable modal dialog component.

**Parameters:**
- `name`: Unique modal identifier
- `title`: Modal title
- `content`: Modal body content (optional)
- `closeLabel`: Custom close button text
- `submitAction`: JavaScript action for submit button
- `submitLabel`: Custom submit button text

**Usage:**
```smarty
{include file="$template/includes/modal.tpl" 
    name="ConfirmAction"
    title="Confirm Action"
    content="Are you sure you want to proceed?"
    submitAction="performAction()"
    submitLabel="Confirm"}
```

**JavaScript Integration:**
```javascript
// Show modal
$('#modalConfirmAction').modal('show');

// Handle modal events
$('#modalConfirmAction').on('shown.bs.modal', function() {
    // Modal is now visible
});
```

#### Table List Component (`includes/tablelist.tpl`)

Advanced data table with filtering, sorting, and pagination.

**Parameters:**
- `tableName`: Unique table identifier
- `filterColumn`: Column index for filtering (optional)
- `noSortColumns`: Comma-separated column indices to disable sorting
- `startOrderCol`: Initial sort column index
- `noPagination`: Disable pagination (boolean)
- `noSearch`: Disable search (boolean)
- `noOrdering`: Disable column sorting (boolean)

**Usage:**
```smarty
{include file="$template/includes/tablelist.tpl" 
    tableName="InvoicesList" 
    filterColumn="4"
    startOrderCol="2"
    noSortColumns="0,5"}
```

**HTML Structure:**
```html
<table id="tableInvoicesList" class="table table-striped">
    <thead>
        <tr>
            <th>Invoice #</th>
            <th>Date</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <!-- Table rows -->
    </tbody>
</table>
```

#### Sidebar Component (`includes/sidebar.tpl`)

Dynamic sidebar navigation with collapsible menu items.

**Template Variables:**
- `$sidebar`: Sidebar menu object with nested structure

**Features:**
- Collapsible cards
- Active state highlighting
- Icon support
- Badge support
- Custom actions with loading states

#### Breadcrumb Component (`includes/breadcrumb.tpl`)

Navigation breadcrumb trail.

**Usage:**
```smarty
{include file="$template/includes/breadcrumb.tpl"}
```

#### Password Strength Component (`includes/pwstrength.tpl`)

Password strength indicator with real-time feedback.

**Usage:**
```smarty
{include file="$template/includes/pwstrength.tpl"}
```

**JavaScript Integration:**
```javascript
// Password strength is automatically initialized for inputs with class 'pwd'
<input type="password" class="form-control pwd" />
```

#### Captcha Component (`includes/captcha.tpl`)

CAPTCHA integration for forms.

**Parameters:**
- `captchaForm`: CAPTCHA form object
- `containerClass`: CSS class for container

**Usage:**
```smarty
{include file="$template/includes/captcha.tpl" 
    captchaForm=$captchaForm 
    containerClass="form-group"}
```

### Form Components

#### Generate Password Component (`includes/generate-password.tpl`)

Password generation utility with customizable options.

**Usage:**
```smarty
{include file="$template/includes/generate-password.tpl"}
```

**Features:**
- Customizable password length
- Character set options (uppercase, lowercase, numbers, symbols)
- Copy to clipboard functionality

#### Domain Search Component (`includes/domain-search.tpl`)

Domain availability search widget.

**Usage:**
```smarty
{include file="$template/includes/domain-search.tpl"}
```

---

## CSS Classes and Components

### Layout Classes

#### Container Classes
```css
.container          /* Standard Bootstrap container */
.container-fluid    /* Full-width container */
.main-content      /* Main content area with proper margins */
.primary-content   /* Primary content column */
.sidebar           /* Sidebar styling */
```

#### Navigation Classes
```css
.navbar            /* Top navigation bar */
.navbar-brand      /* Brand/logo area */
.brand-text        /* Brand text styling */
.logo-img          /* Logo image sizing */
.footer            /* Footer styling */
.footer-nav        /* Footer navigation links */
```

### Component Classes

#### Card Components
```css
.card-sidebar      /* Sidebar card styling */
.card-header       /* Card header */
.card-body         /* Card body content */
.card-minimise     /* Card collapse toggle */
.collapsable-card-body /* Collapsible card body */
```

#### Button Classes
```css
.btn-primary       /* Primary action button */
.btn-secondary     /* Secondary action button */
.btn-success       /* Success state button */
.btn-danger        /* Danger/delete button */
.btn-warning       /* Warning state button */
.btn-info          /* Info state button */
.loading           /* Loading state for buttons */
```

#### Alert Classes
```css
.alert             /* Base alert styling */
.alert-success     /* Success alert */
.alert-danger      /* Error alert */
.alert-warning     /* Warning alert */
.alert-info        /* Info alert */
.alert-bordered-left /* Left border accent */
```

#### Form Classes
```css
.form-control      /* Form input styling */
.form-group        /* Form group container */
.form-check        /* Checkbox/radio styling */
.input-group       /* Input group container */
.was-validated     /* Form validation state */
```

### Utility Classes

#### Loading and States
```css
.lazy              /* Lazy loading images */
.loaded            /* Loaded image state */
.w-hidden          /* Hidden element */
.loading           /* Loading state */
.disabled          /* Disabled state */
```

#### Responsive Classes
```css
.d-none            /* Hidden on all viewports */
.d-md-block        /* Visible on medium+ screens */
.d-lg-none         /* Hidden on large+ screens */
```

---

## Configuration APIs

### Theme Configuration (`theme.yaml`)

Main theme configuration file with the following properties:

```yaml
name: "Little-Portal"
description: "The Default Theme for Little Portal"
author: "Little Cloud"

properties:
  serverSidePagination: false  # Enable client-side pagination

provides:
  bootstrap: 5.3.2            # Bootstrap version
  jquery: 3.7.1               # jQuery version
  fontawesome: 6.5.1          # Font Awesome version

settings:
  primary-color: "#1E90FF"     # Primary brand color
  secondary-color: "#8B5CF6"   # Secondary color
  success-color: "#22c55e"     # Success state color
  info-color: "#4c82f7"        # Info state color
  warning-color: "#ffba08"     # Warning state color
  danger-color: "#ef4444"      # Danger state color
```

### CSS Custom Properties

Theme colors can be customized using CSS custom properties:

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

### JavaScript Configuration

Global JavaScript variables available:

```javascript
window.csrfToken        // CSRF token for AJAX requests
window.whmcsBaseUrl     // Base WHMCS URL
window.markdownGuide    // Markdown help text
window.locale           // Current locale
window.recaptchaSiteKey // reCAPTCHA site key
```

---

## Template Variables

### Global Variables

Available in all templates:

| Variable | Type | Description |
|----------|------|-------------|
| `$companyname` | string | Company name |
| `$pagetitle` | string | Current page title |
| `$templatefile` | string | Current template filename |
| `$language` | string | Current language code |
| `$charset` | string | Character encoding |
| `$WEB_ROOT` | string | Website root URL |
| `$template` | string | Current template name |
| `$date_year` | string | Current year |
| `$versionHash` | string | Asset version hash |

### Page-Specific Variables

#### Client Area Variables
| Variable | Type | Description |
|----------|------|-------------|
| `$clientsdetails` | object | Client information |
| `$primarySidebar` | object | Primary navigation menu |
| `$secondarySidebar` | object | Secondary navigation menu |
| `$inShoppingCart` | boolean | Whether in shopping cart |

#### Product/Service Variables
| Variable | Type | Description |
|----------|------|-------------|
| `$products` | array | Products list |
| `$services` | array | Services list |
| `$domains` | array | Domains list |
| `$invoices` | array | Invoices list |

#### Form Variables
| Variable | Type | Description |
|----------|------|-------------|
| `$errormessage` | string | Error message HTML |
| `$successmessage` | string | Success message |
| `$captchaForm` | object | CAPTCHA form object |

### Menu Object Structure

Sidebar menu objects have the following methods:

```php
// Menu item methods
$item->getName()           // Get item name
$item->getLabel()          // Get display label
$item->getUri()            // Get URL
$item->getIcon()           // Get icon class
$item->getBadge()          // Get badge text
$item->getClass()          // Get CSS class
$item->hasChildren()       // Check if has sub-items
$item->getChildren()       // Get child items
$item->isCurrent()         // Check if current page
$item->isDisabled()        // Check if disabled
```

---

## Usage Examples

### Creating a Custom Page Template

```smarty
{* custom-page.tpl *}

{include file="$template/includes/flashmessage.tpl"}

<div class="card">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fas fa-cog"></i>
            Custom Page Title
        </h3>
    </div>
    <div class="card-body">
        <p>Custom page content here.</p>
        
        {include file="$template/includes/alert.tpl" 
            type="info" 
            msg="This is an informational message"}
        
        <form method="post" action="custom-action.php">
            <div class="form-group">
                <label for="customField">Custom Field</label>
                <input type="text" 
                       class="form-control" 
                       id="customField" 
                       name="customField" 
                       required />
            </div>
            
            <button type="submit" class="btn btn-primary">
                Submit
            </button>
        </form>
    </div>
</div>
```

### Custom JavaScript Integration

```javascript
// custom-script.js

// Wait for theme to be ready
document.addEventListener('DOMContentLoaded', function() {
    
    // Use performance optimizer
    if (window.LittlePortalOptimizer) {
        // Monitor performance
        window.addEventListener('perf:lcp', function(event) {
            // Send to analytics
            if (typeof gtag !== 'undefined') {
                gtag('event', 'web_vitals', {
                    name: 'LCP',
                    value: Math.round(event.detail.value),
                    event_category: 'Performance'
                });
            }
        });
    }
    
    // Custom form handling
    document.querySelectorAll('.custom-form').forEach(function(form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Show loading overlay
            showOverlay('Processing...');
            
            // Submit via AJAX
            fetch(form.action, {
                method: 'POST',
                body: new FormData(form),
                headers: {
                    'X-CSRF-TOKEN': window.csrfToken
                }
            })
            .then(response => response.json())
            .then(data => {
                hideOverlay();
                
                if (data.success) {
                    // Show success message
                    location.reload();
                } else {
                    // Show error
                    alert(data.message);
                }
            })
            .catch(error => {
                hideOverlay();
                console.error('Error:', error);
            });
        });
    });
});
```

### Custom CSS Styling

```css
/* custom.css */

/* Override theme colors */
:root {
    --bs-primary: #your-color;
    --bs-secondary: #your-secondary;
}

/* Custom component styling */
.custom-card {
    border: 1px solid var(--bs-border-color);
    border-radius: 0.375rem;
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

.custom-card .card-header {
    background-color: var(--bs-light);
    border-bottom: 1px solid var(--bs-border-color);
}

/* Responsive customizations */
@media (max-width: 768px) {
    .custom-mobile-hidden {
        display: none;
    }
}

/* Loading animations */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

.fade-in {
    animation: fadeIn 0.3s ease-in;
}
```

### Data Table Configuration

```javascript
// Advanced DataTable setup
jQuery(document).ready(function() {
    $('#customTable').DataTable({
        responsive: true,
        processing: true,
        serverSide: false,
        order: [[0, 'desc']],
        columnDefs: [
            {
                targets: [3], // Actions column
                orderable: false,
                searchable: false
            }
        ],
        language: {
            emptyTable: "No data available",
            info: "Showing _START_ to _END_ of _TOTAL_ entries",
            lengthMenu: "Show _MENU_ entries",
            search: "Search:",
            paginate: {
                first: "First",
                last: "Last",
                next: "Next",
                previous: "Previous"
            }
        },
        pageLength: 25,
        lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]]
    });
});
```

---

## Best Practices

### Performance Optimization

1. **Use Lazy Loading**: Add `data-src` attribute to images for automatic lazy loading
2. **Minimize JavaScript**: Use the built-in performance optimizer
3. **Optimize Images**: Use WebP format when possible
4. **Cache Assets**: Leverage browser caching with version hashes

### Accessibility

1. **Use Semantic HTML**: Proper heading hierarchy and ARIA labels
2. **Keyboard Navigation**: Ensure all interactive elements are keyboard accessible
3. **Color Contrast**: Maintain WCAG AA compliance
4. **Screen Reader Support**: Use proper ARIA attributes

### Security

1. **CSRF Protection**: Always include CSRF token in AJAX requests
2. **Input Validation**: Validate all user inputs on client and server side
3. **XSS Prevention**: Escape output in templates
4. **Secure Headers**: Use appropriate security headers

### Template Development

1. **Component Reuse**: Use include files for reusable components
2. **Variable Naming**: Use descriptive variable names
3. **Error Handling**: Always handle error states gracefully
4. **Mobile First**: Design for mobile devices first

### JavaScript Development

1. **Event Delegation**: Use event delegation for dynamic content
2. **Error Handling**: Wrap code in try-catch blocks
3. **Performance**: Debounce frequent events
4. **Compatibility**: Test across different browsers

### CSS Best Practices

1. **BEM Methodology**: Use consistent naming conventions
2. **Custom Properties**: Use CSS variables for theming
3. **Responsive Design**: Use mobile-first approach
4. **Performance**: Minimize and optimize CSS files

---

This documentation covers all major APIs, components, and features of the Little-Portal WHMCS theme. For additional support or custom development needs, refer to the main README.md file or contact the development team.