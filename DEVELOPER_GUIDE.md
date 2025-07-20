# Little-Portal WHMCS Theme - Developer Guide

## Overview

This guide provides comprehensive information for developers who want to extend, customize, or contribute to the Little-Portal WHMCS theme. It covers advanced topics, development workflows, and best practices.

---

## Table of Contents

1. [Development Environment Setup](#development-environment-setup)
2. [Theme Architecture](#theme-architecture)
3. [Customization Strategies](#customization-strategies)
4. [Performance Optimization](#performance-optimization)
5. [Extension Development](#extension-development)
6. [Testing and Quality Assurance](#testing-and-quality-assurance)
7. [Deployment and Maintenance](#deployment-and-maintenance)
8. [Contributing Guidelines](#contributing-guidelines)

---

## Development Environment Setup

### Prerequisites

```bash
# Required software
- PHP 7.4+ (8.0+ recommended)
- Node.js 16+ (for build tools)
- Git
- Text editor/IDE (VS Code recommended)
- WHMCS 6.0+ installation
```

### Local Development Setup

```bash
# 1. Clone the repository
git clone https://github.com/your-org/little-custom-whmcs-frontend.git
cd little-custom-whmcs-frontend

# 2. Install development dependencies
npm install

# 3. Set up symbolic link to WHMCS templates directory
ln -s $(pwd) /path/to/whmcs/templates/little-portal

# 4. Configure environment
cp .env.example .env
# Edit .env with your local settings
```

### Build Tools Setup

```javascript
// package.json (add these scripts)
{
  "scripts": {
    "build": "npm run build:css && npm run build:js",
    "build:css": "sass css/dev/theme.scss css/theme.min.css --style=compressed",
    "build:js": "webpack --mode=production",
    "watch": "npm run watch:css & npm run watch:js",
    "watch:css": "sass css/dev/theme.scss css/theme.css --watch",
    "watch:js": "webpack --mode=development --watch",
    "lint": "eslint js/ && stylelint css/",
    "test": "jest"
  }
}
```

### Development Configuration

```yaml
# .env.development
DEBUG_MODE=true
MINIFY_ASSETS=false
CACHE_TEMPLATES=false
PERFORMANCE_MONITORING=true
SOURCE_MAPS=true
```

---

## Theme Architecture

### Directory Structure

```
little-portal/
├── css/                    # Stylesheets
│   ├── dev/               # Development SCSS files
│   ├── theme.css          # Main theme stylesheet
│   ├── theme.min.css      # Minified production CSS
│   └── custom.css         # User customizations
├── js/                    # JavaScript files
│   ├── performance-optimizer.js  # Performance optimization
│   ├── bootstrap-init.js  # Bootstrap initialization
│   ├── whmcs.js          # WHMCS core functions
│   └── custom.js         # Custom functionality
├── includes/              # Reusable template components
│   ├── alert.tpl         # Alert component
│   ├── modal.tpl         # Modal component
│   ├── sidebar.tpl       # Sidebar navigation
│   └── tablelist.tpl     # Data table component
├── store/                 # Store-specific templates
├── payment/              # Payment form templates
├── error/                # Error page templates
├── oauth/                # OAuth integration templates
├── images/               # Theme images and assets
├── theme.yaml           # Theme configuration
├── layout.tpl           # Main layout template
├── header.tpl           # Site header
├── footer.tpl           # Site footer
└── *.tpl                # Page-specific templates
```

### Template Hierarchy

```php
// Template loading order in WHMCS
1. {templatefile}.tpl          // Page-specific template
2. layout.tpl                  // Main layout wrapper
3. includes/*.tpl              // Component includes
4. {templatefile}_override.tpl // Override template (if exists)
```

### Asset Loading Strategy

```html
<!-- Critical path optimization -->
<head>
    <!-- 1. Critical CSS inline -->
    <style>/* Critical above-the-fold styles */</style>
    
    <!-- 2. Preload key resources -->
    <link rel="preload" href="theme.min.css" as="style">
    <link rel="preconnect" href="https://cdn.jsdelivr.net">
    
    <!-- 3. Load CSS asynchronously -->
    <link rel="stylesheet" href="theme.min.css" media="print" onload="this.media='all'">
    
    <!-- 4. JavaScript at end of head -->
    <script src="jquery.min.js"></script>
    <script src="bootstrap.min.js" defer></script>
</head>
```

---

## Customization Strategies

### 1. CSS Customization

#### Using CSS Custom Properties

```css
/* css/custom.css */
:root {
    /* Override theme colors */
    --bs-primary: #your-brand-color;
    --bs-secondary: #your-secondary-color;
    
    /* Custom properties */
    --header-height: 80px;
    --sidebar-width: 280px;
    --border-radius: 8px;
    --box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

/* Component customizations */
.navbar-brand {
    font-size: 1.5rem;
    font-weight: 700;
}

.card {
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
}
```

#### SCSS Development

```scss
// css/dev/_variables.scss
$primary-color: #1E90FF;
$secondary-color: #8B5CF6;
$font-family-base: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;

// Responsive breakpoints
$grid-breakpoints: (
    xs: 0,
    sm: 576px,
    md: 768px,
    lg: 992px,
    xl: 1200px,
    xxl: 1400px
);

// css/dev/theme.scss
@import 'variables';
@import 'bootstrap/scss/bootstrap';
@import 'components/navbar';
@import 'components/sidebar';
@import 'components/cards';
```

### 2. JavaScript Extension

#### Custom Performance Monitoring

```javascript
// js/custom-analytics.js
(function() {
    'use strict';
    
    const CustomAnalytics = {
        init: function() {
            this.setupPerformanceMonitoring();
            this.setupUserInteractionTracking();
            this.setupErrorReporting();
        },
        
        setupPerformanceMonitoring: function() {
            // Extend the theme's performance optimizer
            if (window.LittlePortalOptimizer) {
                window.addEventListener('perf:lcp', this.handleLCP.bind(this));
                window.addEventListener('perf:cls', this.handleCLS.bind(this));
                window.addEventListener('perf:fid', this.handleFID.bind(this));
            }
        },
        
        handleLCP: function(event) {
            // Send to your analytics service
            this.sendMetric('LCP', event.detail.value);
        },
        
        sendMetric: function(name, value) {
            if (typeof gtag !== 'undefined') {
                gtag('event', 'web_vitals', {
                    name: name,
                    value: Math.round(value),
                    event_category: 'Performance'
                });
            }
        }
    };
    
    // Auto-initialize
    document.addEventListener('DOMContentLoaded', function() {
        CustomAnalytics.init();
    });
    
    window.CustomAnalytics = CustomAnalytics;
})();
```

#### Custom Form Validation

```javascript
// js/custom-validation.js
const FormValidator = {
    init: function() {
        this.setupValidation();
        this.setupCustomRules();
    },
    
    setupValidation: function() {
        document.querySelectorAll('form[data-validate]').forEach(form => {
            form.addEventListener('submit', this.validateForm.bind(this));
        });
    },
    
    setupCustomRules: function() {
        // Custom validation rules
        this.rules = {
            strongPassword: function(value) {
                const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                return regex.test(value);
            },
            
            validDomain: function(value) {
                const regex = /^[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9](?:\.[a-zA-Z]{2,})+$/;
                return regex.test(value);
            }
        };
    },
    
    validateForm: function(event) {
        const form = event.target;
        let isValid = true;
        
        // Validate all fields with data-rule attributes
        form.querySelectorAll('[data-rule]').forEach(field => {
            const rule = field.dataset.rule;
            const value = field.value;
            
            if (this.rules[rule] && !this.rules[rule](value)) {
                this.showFieldError(field, `Invalid ${rule}`);
                isValid = false;
            } else {
                this.clearFieldError(field);
            }
        });
        
        if (!isValid) {
            event.preventDefault();
        }
    },
    
    showFieldError: function(field, message) {
        const errorDiv = field.parentNode.querySelector('.field-error') || 
                        document.createElement('div');
        errorDiv.className = 'field-error text-danger small mt-1';
        errorDiv.textContent = message;
        
        if (!field.parentNode.querySelector('.field-error')) {
            field.parentNode.appendChild(errorDiv);
        }
        
        field.classList.add('is-invalid');
    },
    
    clearFieldError: function(field) {
        const errorDiv = field.parentNode.querySelector('.field-error');
        if (errorDiv) {
            errorDiv.remove();
        }
        field.classList.remove('is-invalid');
    }
};

// Initialize on DOM ready
document.addEventListener('DOMContentLoaded', function() {
    FormValidator.init();
});
```

### 3. Template Customization

#### Creating Custom Page Templates

```smarty
{* custom-dashboard.tpl *}
{extends file="$template/layout.tpl"}

{block name="page-title"}Custom Dashboard{/block}

{block name="content"}
<div class="row">
    <div class="col-12">
        {include file="$template/includes/flashmessage.tpl"}
        
        <div class="dashboard-header mb-4">
            <h1>Welcome, {$clientsdetails.firstname}!</h1>
            <p class="text-muted">Manage your services and account settings</p>
        </div>
        
        <div class="row">
            <div class="col-md-4 mb-4">
                {include file="$template/custom/dashboard-stats.tpl"}
            </div>
            <div class="col-md-8 mb-4">
                {include file="$template/custom/recent-activity.tpl"}
            </div>
        </div>
        
        <div class="row">
            <div class="col-12">
                {include file="$template/custom/quick-actions.tpl"}
            </div>
        </div>
    </div>
</div>
{/block}
```

#### Custom Component Development

```smarty
{* includes/custom-stats-widget.tpl *}
<div class="stats-widget card">
    <div class="card-body">
        <div class="d-flex align-items-center">
            <div class="stats-icon me-3">
                <i class="{$icon} fa-2x text-{$type}"></i>
            </div>
            <div class="stats-content">
                <h3 class="stats-number mb-0">{$number}</h3>
                <p class="stats-label text-muted mb-0">{$label}</p>
            </div>
        </div>
        {if $trend}
            <div class="stats-trend mt-2">
                <small class="text-{if $trend > 0}success{else}danger{/if}">
                    <i class="fas fa-arrow-{if $trend > 0}up{else}down{/if}"></i>
                    {abs($trend)}% {if $trend > 0}increase{else}decrease{/if}
                </small>
            </div>
        {/if}
    </div>
</div>
```

**Usage:**
```smarty
{include file="$template/includes/custom-stats-widget.tpl"
    icon="fas fa-server"
    type="primary"
    number="12"
    label="Active Services"
    trend=5}
```

---

## Performance Optimization

### 1. Asset Optimization

#### Image Optimization

```javascript
// js/image-optimizer.js
const ImageOptimizer = {
    init: function() {
        this.setupLazyLoading();
        this.setupWebPSupport();
        this.setupResponsiveImages();
    },
    
    setupWebPSupport: function() {
        // Check WebP support
        const webP = new Image();
        webP.onload = webP.onerror = function() {
            const isWebP = webP.height === 2;
            document.documentElement.classList.toggle('webp', isWebP);
        };
        webP.src = 'data:image/webp;base64,UklGRjoAAABXRUJQVlA4IC4AAACyAgCdASoCAAIALmk0mk0iIiIiIgBoSygABc6WWgAA/veff/0PP8bA//LwYAAA';
    },
    
    setupResponsiveImages: function() {
        // Add responsive image handling
        document.querySelectorAll('img[data-sizes]').forEach(img => {
            const sizes = JSON.parse(img.dataset.sizes);
            let srcset = '';
            
            Object.keys(sizes).forEach(breakpoint => {
                srcset += `${sizes[breakpoint]} ${breakpoint}w, `;
            });
            
            img.srcset = srcset.slice(0, -2); // Remove trailing comma
        });
    }
};
```

#### CSS Optimization

```scss
// Use modern CSS features for better performance
.component {
    // Use CSS Grid for complex layouts
    display: grid;
    grid-template-columns: 1fr 300px;
    gap: 2rem;
    
    // Use CSS custom properties for dynamic theming
    color: var(--text-color, #333);
    background: var(--bg-color, #fff);
    
    // Use contain for better rendering performance
    contain: layout style paint;
    
    // Use will-change sparingly for animations
    &.animating {
        will-change: transform;
    }
}

// Optimize animations
@keyframes slideIn {
    from {
        transform: translateX(-100%);
    }
    to {
        transform: translateX(0);
    }
}

.slide-animation {
    animation: slideIn 0.3s ease-out;
    
    @media (prefers-reduced-motion: reduce) {
        animation: none;
    }
}
```

### 2. JavaScript Performance

#### Efficient Event Handling

```javascript
// Use event delegation for better performance
class PerformantEventHandler {
    constructor() {
        this.setupDelegation();
        this.setupIntersectionObserver();
        this.setupRequestIdleCallback();
    }
    
    setupDelegation() {
        // Single event listener for all buttons
        document.addEventListener('click', (event) => {
            if (event.target.matches('.btn-action')) {
                this.handleButtonClick(event);
            } else if (event.target.matches('.modal-trigger')) {
                this.handleModalTrigger(event);
            }
        });
    }
    
    setupIntersectionObserver() {
        // Efficiently handle viewport intersections
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    this.loadComponentData(entry.target);
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });
        
        document.querySelectorAll('[data-load-on-scroll]').forEach(el => {
            observer.observe(el);
        });
    }
    
    setupRequestIdleCallback() {
        // Use idle time for non-critical operations
        if (window.requestIdleCallback) {
            requestIdleCallback(() => {
                this.preloadNextPageAssets();
                this.initializeAnalytics();
                this.setupPerfMonitoring();
            });
        }
    }
}
```

### 3. Template Performance

#### Efficient Template Patterns

```smarty
{* Cache expensive operations *}
{$expensiveData = calculateExpensiveData() scope=global cache_lifetime=3600}

{* Use assign for complex logic *}
{assign var="hasPermission" value=($user.role == 'admin' || $user.permissions.canEdit)}

{* Avoid deep nesting in loops *}
{foreach $items as $item}
    {include file="$template/includes/item-row.tpl" item=$item nocache}
{/foreach}

{* Use conditional loading *}
{if $showAdvancedFeatures}
    {include file="$template/includes/advanced-panel.tpl"}
{/if}

{* Optimize image loading *}
<img src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" 
     data-src="{$imageUrl}" 
     alt="{$imageAlt}" 
     class="lazy"
     loading="lazy" />
```

---

## Extension Development

### 1. Hook System Integration

#### WHMCS Action Hooks

```php
<?php
// hooks/theme-hooks.php

// Add custom CSS variables to head
add_hook('ClientAreaHeadOutput', 1, function($vars) {
    $customColors = getCustomColors();
    
    $css = '<style>:root {';
    foreach ($customColors as $property => $value) {
        $css .= "--{$property}: {$value};";
    }
    $css .= '}</style>';
    
    return $css;
});

// Add custom JavaScript configuration
add_hook('ClientAreaFooterOutput', 1, function($vars) {
    $config = [
        'theme' => 'little-portal',
        'version' => getThemeVersion(),
        'features' => getEnabledFeatures(),
        'user' => [
            'id' => $vars['clientsdetails']['id'],
            'role' => getUserRole($vars['clientsdetails']['id'])
        ]
    ];
    
    return '<script>window.themeConfig = ' . json_encode($config) . ';</script>';
});

// Custom sidebar menu items
add_hook('ClientAreaPrimarySidebar', 1, function($primarySidebar) {
    $customPanel = $primarySidebar->addChild('custom-panel', [
        'label' => 'Custom Features',
        'uri' => '#',
        'icon' => 'fas fa-magic'
    ]);
    
    $customPanel->addChild('feature-one', [
        'label' => 'Feature One',
        'uri' => 'custom-feature-one.php',
        'icon' => 'fas fa-star'
    ]);
});
```

### 2. Custom Modules Integration

#### Payment Gateway Theme Integration

```smarty
{* payment/custom-gateway/inputs.tpl *}
<div class="payment-gateway-custom">
    <div class="gateway-header mb-3">
        <img src="{$WEB_ROOT}/modules/gateways/custom-gateway/logo.png" 
             alt="Custom Gateway" 
             class="gateway-logo" />
        <h5>Secure Payment with Custom Gateway</h5>
    </div>
    
    <div class="payment-form">
        {if $gatewayError}
            {include file="$template/includes/alert.tpl" 
                type="error" 
                msg=$gatewayError}
        {/if}
        
        <div class="form-group">
            <label for="customField">Custom Field</label>
            <input type="text" 
                   class="form-control" 
                   id="customField" 
                   name="custom_field" 
                   required />
        </div>
        
        {include file="$template/payment/billing-address.tpl"}
        
        <div class="payment-actions mt-3">
            <button type="submit" class="btn btn-primary btn-lg w-100">
                <i class="fas fa-lock"></i>
                Complete Secure Payment
            </button>
        </div>
    </div>
</div>
```

### 3. API Integration

#### Custom Dashboard Widgets

```javascript
// js/dashboard-widgets.js
class DashboardWidget {
    constructor(element, options) {
        this.element = element;
        this.options = Object.assign({
            refreshInterval: 300000, // 5 minutes
            showLoader: true,
            cache: true
        }, options);
        
        this.init();
    }
    
    init() {
        this.loadData();
        this.setupAutoRefresh();
        this.setupEvents();
    }
    
    async loadData() {
        if (this.options.showLoader) {
            this.showLoader();
        }
        
        try {
            const response = await fetch(`/api/dashboard-widget/${this.options.type}`, {
                headers: {
                    'X-CSRF-TOKEN': window.csrfToken
                }
            });
            
            const data = await response.json();
            this.renderData(data);
            
        } catch (error) {
            this.renderError(error.message);
        } finally {
            this.hideLoader();
        }
    }
    
    renderData(data) {
        const template = this.element.querySelector('.widget-template').innerHTML;
        const rendered = this.interpolateTemplate(template, data);
        this.element.querySelector('.widget-content').innerHTML = rendered;
    }
    
    interpolateTemplate(template, data) {
        return template.replace(/\{\{(\w+)\}\}/g, (match, key) => {
            return data[key] || '';
        });
    }
    
    setupAutoRefresh() {
        if (this.options.refreshInterval > 0) {
            setInterval(() => {
                this.loadData();
            }, this.options.refreshInterval);
        }
    }
}

// Initialize widgets
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('[data-widget]').forEach(element => {
        const type = element.dataset.widget;
        const options = JSON.parse(element.dataset.options || '{}');
        options.type = type;
        
        new DashboardWidget(element, options);
    });
});
```

---

## Testing and Quality Assurance

### 1. Automated Testing

#### JavaScript Unit Tests

```javascript
// tests/performance-optimizer.test.js
import { LittlePortalOptimizer } from '../js/performance-optimizer.js';

describe('LittlePortalOptimizer', () => {
    beforeEach(() => {
        document.body.innerHTML = '';
        // Reset global state
    });
    
    test('initializes lazy loading correctly', () => {
        // Setup test DOM
        document.body.innerHTML = `
            <img data-src="/test.jpg" class="lazy" alt="Test" />
        `;
        
        LittlePortalOptimizer.initLazyLoading();
        
        // Verify IntersectionObserver was set up
        expect(window.IntersectionObserver).toHaveBeenCalled();
    });
    
    test('handles performance monitoring events', () => {
        const mockCallback = jest.fn();
        window.addEventListener('perf:lcp', mockCallback);
        
        LittlePortalOptimizer.initPerformanceMonitoring();
        
        // Simulate LCP event
        const event = new CustomEvent('perf:lcp', {
            detail: { value: 1500 }
        });
        window.dispatchEvent(event);
        
        expect(mockCallback).toHaveBeenCalledWith(
            expect.objectContaining({
                detail: { value: 1500 }
            })
        );
    });
});
```

#### Template Testing

```php
<?php
// tests/TemplateTest.php
class TemplateTest extends PHPUnit\Framework\TestCase
{
    public function testAlertComponentRendersCorrectly()
    {
        $smarty = new Smarty();
        $smarty->assign('type', 'success');
        $smarty->assign('msg', 'Test message');
        
        $output = $smarty->fetch('includes/alert.tpl');
        
        $this->assertStringContains('alert-success', $output);
        $this->assertStringContains('Test message', $output);
    }
    
    public function testModalComponentWithAllParameters()
    {
        $smarty = new Smarty();
        $smarty->assign('name', 'TestModal');
        $smarty->assign('title', 'Test Title');
        $smarty->assign('content', 'Test Content');
        $smarty->assign('submitAction', 'testAction()');
        
        $output = $smarty->fetch('includes/modal.tpl');
        
        $this->assertStringContains('id="modalTestModal"', $output);
        $this->assertStringContains('Test Title', $output);
        $this->assertStringContains('onclick="testAction()"', $output);
    }
}
```

### 2. Performance Testing

#### Lighthouse Integration

```javascript
// tests/lighthouse.config.js
module.exports = {
    ci: {
        collect: {
            url: [
                'http://localhost/clientarea.php',
                'http://localhost/cart.php',
                'http://localhost/login.php'
            ],
            startServerCommand: 'npm run start:test-server',
            settings: {
                chromeFlags: '--no-sandbox'
            }
        },
        assert: {
            assertions: {
                'categories:performance': ['warn', { minScore: 0.8 }],
                'categories:accessibility': ['error', { minScore: 0.9 }],
                'categories:best-practices': ['warn', { minScore: 0.8 }],
                'categories:seo': ['warn', { minScore: 0.8 }]
            }
        }
    }
};
```

#### Load Testing

```javascript
// tests/load-test.js
import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
    stages: [
        { duration: '2m', target: 100 }, // Ramp up
        { duration: '5m', target: 100 }, // Stay at 100 users
        { duration: '2m', target: 0 },   // Ramp down
    ],
};

export default function() {
    // Test critical user journeys
    const loginResponse = http.post('/dologin.php', {
        username: 'test@example.com',
        password: 'testpassword'
    });
    
    check(loginResponse, {
        'login successful': (r) => r.status === 200,
        'login response time OK': (r) => r.timings.duration < 2000,
    });
    
    sleep(1);
    
    const clientAreaResponse = http.get('/clientarea.php');
    
    check(clientAreaResponse, {
        'client area loads': (r) => r.status === 200,
        'client area fast': (r) => r.timings.duration < 1500,
    });
    
    sleep(2);
}
```

### 3. Accessibility Testing

#### Automated Accessibility Tests

```javascript
// tests/accessibility.test.js
import axe from 'axe-core';

describe('Accessibility Tests', () => {
    test('main navigation is accessible', async () => {
        document.body.innerHTML = `
            <nav class="navbar" role="navigation" aria-label="Main navigation">
                <a href="#" class="navbar-brand">Little Portal</a>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="#" class="nav-link">Home</a>
                    </li>
                </ul>
            </nav>
        `;
        
        const results = await axe.run(document.body);
        expect(results.violations).toHaveLength(0);
    });
    
    test('forms have proper labels', async () => {
        document.body.innerHTML = `
            <form>
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required />
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required />
            </form>
        `;
        
        const results = await axe.run(document.body);
        expect(results.violations).toHaveLength(0);
    });
});
```

---

## Deployment and Maintenance

### 1. Build Process

#### Production Build Script

```bash
#!/bin/bash
# scripts/build.sh

set -e

echo "Building Little-Portal WHMCS Theme for production..."

# Install dependencies
npm install --production

# Build CSS
echo "Building CSS..."
sass css/dev/theme.scss css/theme.min.css --style=compressed --no-source-map

# Build JavaScript
echo "Building JavaScript..."
npm run build:js

# Optimize images
echo "Optimizing images..."
imagemin images/**/*.{jpg,png,svg} --out-dir=images/

# Generate asset manifest
echo "Generating asset manifest..."
node scripts/generate-manifest.js

# Run tests
echo "Running tests..."
npm test

# Validate templates
echo "Validating templates..."
php scripts/validate-templates.php

echo "Build complete!"
```

#### Asset Versioning

```javascript
// scripts/generate-manifest.js
const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

function generateHash(filePath) {
    const content = fs.readFileSync(filePath);
    return crypto.createHash('md5').update(content).digest('hex').substring(0, 8);
}

const assets = {
    'css/theme.min.css': generateHash('css/theme.min.css'),
    'js/scripts.min.js': generateHash('js/scripts.min.js'),
    'js/performance-optimizer.js': generateHash('js/performance-optimizer.js')
};

const manifest = {
    version: process.env.BUILD_VERSION || '1.0.0',
    timestamp: Date.now(),
    assets: assets
};

fs.writeFileSync('asset-manifest.json', JSON.stringify(manifest, null, 2));

// Update theme.yaml with new version hash
const themeConfig = fs.readFileSync('theme.yaml', 'utf8');
const updatedConfig = themeConfig.replace(
    /version_hash: .*/,
    `version_hash: "${manifest.version}-${manifest.timestamp}"`
);
fs.writeFileSync('theme.yaml', updatedConfig);

console.log('Asset manifest generated successfully');
```

### 2. Monitoring and Analytics

#### Performance Monitoring Setup

```javascript
// js/monitoring.js
class ThemeMonitoring {
    constructor() {
        this.init();
    }
    
    init() {
        this.setupErrorReporting();
        this.setupPerformanceTracking();
        this.setupUserTracking();
    }
    
    setupErrorReporting() {
        window.addEventListener('error', (event) => {
            this.reportError({
                message: event.message,
                filename: event.filename,
                lineno: event.lineno,
                colno: event.colno,
                stack: event.error ? event.error.stack : null,
                userAgent: navigator.userAgent,
                url: window.location.href,
                timestamp: Date.now()
            });
        });
        
        window.addEventListener('unhandledrejection', (event) => {
            this.reportError({
                message: 'Unhandled Promise Rejection',
                error: event.reason,
                url: window.location.href,
                timestamp: Date.now()
            });
        });
    }
    
    setupPerformanceTracking() {
        // Track Core Web Vitals
        if (window.LittlePortalOptimizer) {
            ['perf:lcp', 'perf:cls', 'perf:fid'].forEach(eventType => {
                window.addEventListener(eventType, (event) => {
                    this.reportMetric(eventType.replace('perf:', ''), event.detail.value);
                });
            });
        }
        
        // Track page load performance
        window.addEventListener('load', () => {
            setTimeout(() => {
                const navigation = performance.getEntriesByType('navigation')[0];
                
                this.reportMetric('page_load_time', navigation.loadEventEnd - navigation.fetchStart);
                this.reportMetric('dom_content_loaded', navigation.domContentLoadedEventEnd - navigation.fetchStart);
                this.reportMetric('first_byte', navigation.responseStart - navigation.fetchStart);
            }, 0);
        });
    }
    
    reportError(errorData) {
        // Send to your error reporting service
        fetch('/api/errors', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': window.csrfToken
            },
            body: JSON.stringify(errorData)
        }).catch(() => {
            // Silently fail to avoid recursive errors
        });
    }
    
    reportMetric(name, value) {
        // Send to your analytics service
        if (typeof gtag !== 'undefined') {
            gtag('event', 'theme_performance', {
                metric_name: name,
                metric_value: Math.round(value),
                page_path: window.location.pathname
            });
        }
    }
}

// Initialize monitoring
new ThemeMonitoring();
```

### 3. Maintenance Tasks

#### Automated Updates

```bash
#!/bin/bash
# scripts/maintenance.sh

# Update dependencies
echo "Checking for dependency updates..."
npm audit
npm update

# Check for WHMCS compatibility
echo "Checking WHMCS compatibility..."
php scripts/check-compatibility.php

# Optimize database queries (if using custom tables)
echo "Optimizing performance..."
php scripts/optimize-performance.php

# Clear template cache
echo "Clearing template cache..."
rm -rf /path/to/whmcs/templates_c/little-portal/*

# Generate fresh asset hashes
echo "Regenerating asset hashes..."
node scripts/generate-manifest.js

echo "Maintenance complete!"
```

---

## Contributing Guidelines

### 1. Code Standards

#### PHP/Smarty Standards

```php
<?php
// Follow PSR-12 coding standards
class ThemeHelper
{
    public function formatCurrency($amount, $currency = 'USD')
    {
        return money_format('%.2n', $amount) . ' ' . $currency;
    }
    
    public function sanitizeOutput($input)
    {
        return htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
    }
}
```

```smarty
{* Smarty template standards *}
{* Always escape output *}
<p>{$userInput|escape:'html'}</p>

{* Use consistent indentation *}
{if $condition}
    <div class="content">
        {$content}
    </div>
{/if}

{* Comment complex logic *}
{* Calculate total with tax *}
{assign var="totalWithTax" value=($subtotal * (1 + $taxRate))}
```

#### JavaScript Standards

```javascript
// Use ESLint configuration
module.exports = {
    extends: ['eslint:recommended'],
    env: {
        browser: true,
        es2020: true,
        jquery: true
    },
    rules: {
        'indent': ['error', 4],
        'quotes': ['error', 'single'],
        'semi': ['error', 'always'],
        'no-unused-vars': 'error',
        'no-console': 'warn'
    }
};

// Code example following standards
class ComponentManager {
    constructor(options = {}) {
        this.options = Object.assign({
            autoInit: true,
            debug: false
        }, options);
        
        if (this.options.autoInit) {
            this.init();
        }
    }
    
    init() {
        this.bindEvents();
        this.loadComponents();
    }
    
    bindEvents() {
        document.addEventListener('DOMContentLoaded', () => {
            this.initializeComponents();
        });
    }
}
```

### 2. Git Workflow

#### Branch Strategy

```bash
# Main branches
main         # Production-ready code
develop      # Development integration branch

# Feature branches
feature/new-component     # New feature development
bugfix/fix-modal-issue   # Bug fixes
hotfix/security-patch    # Critical fixes
release/v2.0.0          # Release preparation
```

#### Commit Message Format

```
type(scope): description

[optional body]

[optional footer]
```

**Examples:**
```
feat(modal): add custom modal size options

Add support for sm, lg, and xl modal sizes with proper responsive behavior.
Includes documentation and examples.

Closes #123

fix(performance): resolve memory leak in lazy loading

The intersection observer was not being properly disconnected,
causing memory accumulation on pages with many images.

Breaking change: LittlePortalOptimizer.initLazyLoading() now returns
an object with a disconnect() method for cleanup.

BREAKING CHANGE: API signature changed for lazy loading initialization
```

### 3. Pull Request Process

#### PR Template

```markdown
## Description
Brief description of changes and motivation.

## Type of Change
- [ ] Bug fix (non-breaking change that fixes an issue)
- [ ] New feature (non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed
- [ ] Accessibility testing completed
- [ ] Performance testing completed

## Screenshots
Include screenshots for UI changes.

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Breaking changes documented
- [ ] Backwards compatibility maintained (if applicable)
```

#### Review Guidelines

1. **Code Quality**
   - Follows established patterns
   - Proper error handling
   - Performance considerations
   - Security best practices

2. **Testing**
   - Adequate test coverage
   - Edge cases considered
   - Manual testing completed

3. **Documentation**
   - API documentation updated
   - Usage examples provided
   - Breaking changes documented

4. **Accessibility**
   - WCAG 2.1 AA compliance
   - Keyboard navigation support
   - Screen reader compatibility

---

This developer guide provides comprehensive information for extending and maintaining the Little-Portal WHMCS theme. Follow these guidelines to ensure consistency, quality, and performance across all customizations and contributions.