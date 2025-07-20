# Little-Portal WHMCS Theme - Component Reference Guide

## Overview

This document provides detailed information about all template components, includes, and reusable elements in the Little-Portal WHMCS theme.

---

## Template Includes Structure

### Core Includes (`/includes/`)

#### Alert Component (`includes/alert.tpl`)

**Purpose:** Displays Bootstrap-styled notification messages and alerts.

**Parameters:**
```smarty
{include file="$template/includes/alert.tpl"
    type="success|error|warning|info|danger"    // Alert type (required)
    msg="Message text"                          // Main message (optional if errorshtml provided)
    title="Alert Title"                         // Optional title
    textcenter=true|false                       // Center align text
    errorshtml="<li>Error 1</li><li>Error 2</li>" // HTML formatted error list
}
```

**Examples:**
```smarty
{* Simple success message *}
{include file="$template/includes/alert.tpl" 
    type="success" 
    msg="Settings saved successfully!"
    textcenter=true}

{* Error with title *}
{include file="$template/includes/alert.tpl" 
    type="error" 
    title="Validation Errors"
    errorshtml="<li>Email is required</li><li>Password too short</li>"}

{* Warning message *}
{include file="$template/includes/alert.tpl" 
    type="warning" 
    msg="Your account will expire in 3 days"}
```

#### Breadcrumb Component (`includes/breadcrumb.tpl`)

**Purpose:** Displays navigation breadcrumb trail.

**Usage:**
```smarty
{include file="$template/includes/breadcrumb.tpl"}
```

**Automatic Variables:**
- Uses `$breadcrumb` array automatically populated by WHMCS
- Displays hierarchical navigation path

#### Captcha Component (`includes/captcha.tpl`)

**Purpose:** Integrates CAPTCHA verification for forms.

**Parameters:**
```smarty
{include file="$template/includes/captcha.tpl"
    captchaForm=$captchaForm           // CAPTCHA form object from WHMCS
    containerClass="form-group row"    // CSS class for container
    nocache                           // Disable caching (for dynamic content)
}
```

**Examples:**
```smarty
{* Standard form CAPTCHA *}
{include file="$template/includes/captcha.tpl" 
    captchaForm=$captchaForm 
    containerClass="form-group"}

{* Registration form CAPTCHA with no cache *}
{include file="$template/includes/captcha.tpl" 
    captchaForm=$captchaFormRegister 
    containerClass="form-group row" 
    nocache}
```

#### Confirmation Component (`includes/confirmation.tpl`)

**Purpose:** Displays confirmation dialogs and messages.

**Parameters:**
```smarty
{include file="$template/includes/confirmation.tpl"
    message="Confirmation message"     // Message to display
    yesAction="javascript:function()"  // Action for Yes button
    noAction="javascript:function()"   // Action for No button
    yesLabel="Confirm"                // Custom Yes button text
    noLabel="Cancel"                  // Custom No button text
}
```

#### Domain Search Component (`includes/domain-search.tpl`)

**Purpose:** Domain availability search widget.

**Usage:**
```smarty
{include file="$template/includes/domain-search.tpl"}
```

**Features:**
- Real-time domain availability checking
- Multiple TLD suggestions
- Integration with WHMCS domain pricing
- Responsive design

#### Flash Message Component (`includes/flashmessage.tpl`)

**Purpose:** Displays session-based flash messages.

**Usage:**
```smarty
{include file="$template/includes/flashmessage.tpl"}
```

**Automatic Features:**
- Displays success/error messages from session
- Auto-dismissible alerts
- Proper styling based on message type

#### Generate Password Component (`includes/generate-password.tpl`)

**Purpose:** Password generation utility with customizable options.

**Usage:**
```smarty
{include file="$template/includes/generate-password.tpl"}
```

**Features:**
- Customizable password length (8-50 characters)
- Character set options:
  - Uppercase letters (A-Z)
  - Lowercase letters (a-z)
  - Numbers (0-9)
  - Special characters (!@#$%^&*)
- Copy to clipboard functionality
- Real-time password strength indicator

**JavaScript Integration:**
```javascript
// Generate password with specific options
generatePassword({
    length: 16,
    uppercase: true,
    lowercase: true,
    numbers: true,
    symbols: false
});
```

#### Head Template (`includes/head.tpl`)

**Purpose:** HTML head section with optimized asset loading.

**Features:**
- Critical CSS preloading
- External resource preconnection
- Optimized JavaScript loading order
- CSRF token configuration
- Performance optimization settings

**Key Assets Loaded:**
- jQuery 3.7.1
- Bootstrap 5.3.2
- Font Awesome 6.5.1
- WHMCS core scripts
- Performance optimizer

#### Linked Accounts Component (`includes/linkedaccounts.tpl`)

**Purpose:** Social media and OAuth account linking.

**Parameters:**
```smarty
{include file="$template/includes/linkedaccounts.tpl"
    linkContext="login|register"    // Context for account linking
    customFeedback=true|false      // Enable custom feedback styling
}
```

#### Modal Component (`includes/modal.tpl`)

**Purpose:** Reusable Bootstrap modal dialogs.

**Parameters:**
```smarty
{include file="$template/includes/modal.tpl"
    name="UniqueModalName"              // Modal identifier (required)
    title="Modal Title"                 // Modal header title
    content="Modal body content"        // Static content (optional)
    closeLabel="Close"                  // Custom close button text
    submitAction="javascript:action()"  // Submit button action
    submitLabel="Save Changes"          // Custom submit button text
    size="sm|lg|xl"                    // Modal size (optional)
}
```

**Examples:**
```smarty
{* Confirmation modal *}
{include file="$template/includes/modal.tpl" 
    name="DeleteConfirm"
    title="Confirm Deletion"
    content="Are you sure you want to delete this item? This action cannot be undone."
    submitAction="deleteItem()"
    submitLabel="Delete"
    closeLabel="Cancel"}

{* Large modal for complex forms *}
{include file="$template/includes/modal.tpl" 
    name="EditUser"
    title="Edit User Details"
    size="lg"
    submitAction="saveUser()"
    submitLabel="Save Changes"}
```

**JavaScript Usage:**
```javascript
// Show modal
$('#modalDeleteConfirm').modal('show');

// Handle modal events
$('#modalDeleteConfirm').on('shown.bs.modal', function() {
    // Focus on input or perform actions
    $(this).find('input:first').focus();
});

// Hide modal
$('#modalDeleteConfirm').modal('hide');
```

#### Navbar Component (`includes/navbar.tpl`)

**Purpose:** Main navigation bar with responsive design.

**Features:**
- Responsive collapsible menu
- User account dropdown
- Search functionality
- Mobile-optimized navigation

#### Network Issues Notifications (`includes/network-issues-notifications.tpl`)

**Purpose:** Displays network status and maintenance notifications.

**Usage:**
```smarty
{include file="$template/includes/network-issues-notifications.tpl"}
```

#### Panel Component (`includes/panel.tpl`)

**Purpose:** Generic panel/card component for content organization.

**Parameters:**
```smarty
{include file="$template/includes/panel.tpl"
    title="Panel Title"           // Panel header title
    content="Panel content"       // Panel body content
    type="default|primary|info"   // Panel type/styling
    icon="fas fa-icon"           // Header icon (optional)
}
```

#### Password Strength Component (`includes/pwstrength.tpl`)

**Purpose:** Real-time password strength indicator.

**Usage:**
```smarty
{include file="$template/includes/pwstrength.tpl"}
```

**Features:**
- Real-time strength calculation
- Visual strength meter
- Strength descriptions (Weak, Fair, Good, Strong)
- Integration with password fields having class `pwd`

**JavaScript Integration:**
```html
<input type="password" class="form-control pwd" name="password" />
<!-- Strength meter appears automatically -->
```

#### Sidebar Component (`includes/sidebar.tpl`)

**Purpose:** Dynamic sidebar navigation with menu structure.

**Parameters:**
```smarty
{include file="$template/includes/sidebar.tpl"
    sidebar=$primarySidebar    // Sidebar menu object
}
```

**Menu Object Methods:**
```php
// Available methods for menu items
$item->getName()           // Get unique item name
$item->getLabel()          // Get display label
$item->getUri()            // Get link URL
$item->getIcon()           // Get Font Awesome icon class
$item->getBadge()          // Get badge text/count
$item->getClass()          // Get additional CSS classes
$item->hasChildren()       // Check if has sub-menu items
$item->getChildren()       // Get array of child items
$item->isCurrent()         // Check if current active page
$item->isDisabled()        // Check if menu item is disabled
$item->hasIcon()           // Check if has icon
$item->hasBadge()          // Check if has badge
$item->hasBodyHtml()       // Check if has custom body content
$item->getBodyHtml()       // Get custom body HTML
```

**Custom Actions Support:**
```smarty
{* Menu items with custom actions *}
{assign "customActionData" $childItem->getAttribute('dataCustomAction')}
{if is_array($customActionData)}
    data-active="{$customActionData['active']}"
    data-identifier="{$customActionData['identifier']}"
    data-serviceid="{$customActionData['serviceid']}"
{/if}
```

#### Social Accounts Component (`includes/social-accounts.tpl`)

**Purpose:** Social media account integration display.

**Usage:**
```smarty
{include file="$template/includes/social-accounts.tpl"}
```

#### Table List Component (`includes/tablelist.tpl`)

**Purpose:** Advanced DataTable implementation with sorting, filtering, and pagination.

**Parameters:**
```smarty
{include file="$template/includes/tablelist.tpl"
    tableName="UniqueTableName"        // Table identifier (required)
    filterColumn=4                     // Column index for filtering (0-based)
    noSortColumns="0,5"               // Comma-separated non-sortable columns
    startOrderCol=2                   // Initial sort column (0-based)
    noPagination=true|false           // Disable pagination
    noInfo=true|false                 // Hide table info
    noSearch=true|false               // Disable search
    noOrdering=true|false             // Disable column sorting
    dontControlActiveClass=true|false  // Don't auto-manage active states
}
```

**Examples:**
```smarty
{* Basic table with filtering *}
{include file="$template/includes/tablelist.tpl" 
    tableName="InvoicesList" 
    filterColumn="4"}

{* Advanced table configuration *}
{include file="$template/includes/tablelist.tpl" 
    tableName="DomainsList" 
    noSortColumns="0,1" 
    startOrderCol="2" 
    filterColumn="5"}

{* Simple table without pagination *}
{include file="$template/includes/tablelist.tpl" 
    tableName="SimpleList" 
    noPagination=true 
    noSearch=true}
```

**Required HTML Structure:**
```html
<table id="tableInvoicesList" class="table table-striped">
    <thead>
        <tr>
            <th>Column 1</th>
            <th>Column 2</th>
            <th>Column 3</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Data 1</td>
            <td>Data 2</td>
            <td>Data 3</td>
            <td><button class="btn btn-sm btn-primary">Action</button></td>
        </tr>
    </tbody>
</table>
```

**Filter Integration:**
```html
<div class="view-filter-btns">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action">
            <i class="far fa-circle"></i>
            <span>All Items</span>
        </a>
        <a href="#" class="list-group-item list-group-item-action">
            <i class="far fa-circle"></i>
            <span>Active</span>
        </a>
        <a href="#" class="list-group-item list-group-item-action">
            <i class="far fa-circle"></i>
            <span>Pending</span>
        </a>
    </div>
</div>
```

**DataTable Configuration:**
```javascript
// The table is automatically initialized with these options:
{
    "responsive": true,
    "pageLength": 10,
    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "View All"]],
    "stateSave": true,  // Remembers sorting and pagination
    "order": [[0, "asc"]],  // Default sort
    "oLanguage": {
        // Localized text
    }
}
```

#### User Validation Component (`includes/validateuser.tpl`)

**Purpose:** User account validation prompts and forms.

**Usage:**
```smarty
{include file="$template/includes/validateuser.tpl"}
```

#### Email Verification Component (`includes/verifyemail.tpl`)

**Purpose:** Email verification notices and controls.

**Usage:**
```smarty
{include file="$template/includes/verifyemail.tpl"}
```

---

## Store Components (`/store/`)

### SSL Certificate Store (`/store/ssl/`)

#### SSL Navigation (`store/ssl/shared/nav.tpl`)

**Purpose:** SSL certificate category navigation.

**Parameters:**
```smarty
{include file="$template/store/ssl/shared/nav.tpl" 
    current="dv|ov|ev|wildcard|competitiveupgrade"}
```

#### Certificate Pricing (`store/ssl/shared/certificate-pricing.tpl`)

**Purpose:** SSL certificate pricing display.

**Parameters:**
```smarty
{include file="$template/store/ssl/shared/certificate-pricing.tpl" 
    type="dv|ov|ev|wildcard"}
```

#### SSL Features (`store/ssl/shared/features.tpl`)

**Purpose:** SSL certificate features comparison.

**Parameters:**
```smarty
{include file="$template/store/ssl/shared/features.tpl" 
    type="dv|ov|ev|wildcard"}
```

#### Trust Logos (`store/ssl/shared/logos.tpl`)

**Purpose:** SSL provider and trust logos display.

**Usage:**
```smarty
{include file="$template/store/ssl/shared/logos.tpl"}
```

#### Currency Chooser (`store/ssl/shared/currency-chooser.tpl`)

**Purpose:** Currency selection widget for SSL pricing.

**Usage:**
```smarty
{include file="$template/store/ssl/shared/currency-chooser.tpl"}
```

---

## Payment Components (`/payment/`)

### Credit Card Input (`payment/card/inputs.tpl`)

**Purpose:** Credit card payment form fields.

**Features:**
- Card number validation
- Expiry date selection
- CVV field
- Cardholder name
- Billing address integration

### Bank Transfer Input (`payment/bank/inputs.tpl`)

**Purpose:** Bank transfer payment form fields.

**Features:**
- Bank account details
- Routing information
- Account holder verification

### Billing Address (`payment/billing-address.tpl`)

**Purpose:** Reusable billing address form component.

**Usage:**
```smarty
{include file="$template/payment/billing-address.tpl"}
```

**Features:**
- Address validation
- Country/state selection
- Postal code formatting
- Tax calculation integration

---

## Error Pages (`/error/`)

### 404 Error (`error/page-not-found.tpl`)

**Purpose:** Custom 404 error page.

**Features:**
- User-friendly error message
- Navigation suggestions
- Search functionality

### Unknown Route (`error/unknown-routepath.tpl`)

**Purpose:** Handles unknown route errors.

**Usage:**
```smarty
{include file="$template/error/page-not-found.tpl"}
```

---

## OAuth Integration (`/oauth/`)

### OAuth Templates

Contains specialized templates for OAuth authentication flows and integrations.

---

## Component Best Practices

### Including Components

```smarty
{* Always use the full path from template root *}
{include file="$template/includes/alert.tpl" type="success" msg="Message"}

{* Pass required parameters explicitly *}
{include file="$template/includes/modal.tpl" 
    name="ConfirmModal"
    title="Confirm Action"
    submitAction="performAction()"}

{* Use nocache for dynamic content *}
{include file="$template/includes/captcha.tpl" 
    captchaForm=$captchaForm 
    nocache}
```

### Parameter Validation

```smarty
{* Check for required parameters *}
{if isset($type) && isset($msg)}
    {include file="$template/includes/alert.tpl" type=$type msg=$msg}
{/if}

{* Provide defaults for optional parameters *}
{include file="$template/includes/modal.tpl" 
    name=$modalName
    title=$modalTitle|default:"Confirm"
    closeLabel=$closeLabel|default:"Cancel"}
```

### JavaScript Integration

```javascript
// Wait for component initialization
$(document).ready(function() {
    // Initialize custom components
    initializeCustomComponents();
});

// Handle component events
$(document).on('shown.bs.modal', '.modal', function() {
    // Modal shown event
});

$(document).on('click', '.btn-action', function() {
    // Button click event
});
```

### Responsive Design

```smarty
{* Use responsive utility classes *}
<div class="d-none d-md-block">
    {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
</div>

{* Mobile-specific includes *}
{if $isMobile}
    {include file="$template/includes/mobile-menu.tpl"}
{else}
    {include file="$template/includes/desktop-menu.tpl"}
{/if}
```

### Performance Considerations

```smarty
{* Use conditional includes to reduce overhead *}
{if $showSidebar}
    {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
{/if}

{* Cache static components *}
{include file="$template/includes/footer.tpl" cache_lifetime=3600}

{* Use nocache for dynamic content only *}
{include file="$template/includes/user-specific-content.tpl" nocache}
```

---

This component reference provides comprehensive documentation for all reusable template components in the Little-Portal WHMCS theme. Each component is designed to be modular, accessible, and performant while maintaining consistency with the overall theme design.