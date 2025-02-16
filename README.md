# Little-Portal WHMCS Theme

A modern, customized WHMCS client area theme based on the official WHMCS Twenty-One template. This theme provides an enhanced user experience while maintaining full compatibility with WHMCS core functionality.

## Overview

Little-Portal is a fork of the [WHMCS Twenty-One theme](https://github.com/WHMCS/templates-twenty-one) with additional customizations and modern improvements. Our goal is to provide a beautiful, responsive, and user-friendly interface while maintaining strict adherence to WHMCS development standards.

## Features

- Modern tech stack:
  - Bootstrap 5.3.2
  - jQuery 3.7.1
  - Font Awesome 6.5.1
- Enhanced UI/UX with custom color scheme
- Client-side pagination for improved performance
- Responsive design optimized for all devices
- Full compatibility with WHMCS core features
- Google Tag Manager integration
- Modern authentication flows

## Requirements

- WHMCS 6.0 or later
- PHP 7.4 or later (recommended)
- Modern web browser with JavaScript enabled

## Installation

1. Navigate to your WHMCS templates directory:
```bash
cd ~/whmcs/templates/
```

2. Clone this repository:
```bash
git clone https://github.com/your-username/little-custom-whmcs-frontend.git little-portal
```

3. Switch to the template directory:
```bash
cd little-portal
```

4. Activate the theme in your WHMCS admin panel:
   - Navigate to Setup > General Settings > Templates
   - Select "Little-Portal" from the available templates
   - Save changes

## Updating

To update the theme while maintaining your customizations:

1. Add the original Twenty-One repository as a remote:
```bash
git remote add upstream https://github.com/WHMCS/templates-twenty-one.git
```

2. Fetch updates:
```bash
git fetch upstream
```

3. Merge changes (resolve conflicts if necessary):
```bash
git merge upstream/master
```

## Customization

The theme can be customized through:

- `theme.yaml` - Core theme settings and color scheme
- `css/custom.css` - Custom CSS styles
- `js/scripts.js` - Custom JavaScript functionality

### Navbar Brand Configuration

The navbar brand can be configured to show:
- Both logo and brand name (default)
- Logo only
- Brand name only

To show only the logo:
1. Open `header.tpl`
2. Remove or comment out the `<span class="brand-text">` line
3. Or in `css/custom.css`, uncomment `display: none` in the `.navbar-brand .brand-text` class

To show only brand name:
1. Remove or comment out the `<img>` element in `header.tpl`

### Color Scheme

Default color palette (customizable in theme.yaml):
```yaml
primary-color: "#1E90FF"
secondary-color: "#8B5CF6"
success-color: "#22c55e"
info-color: "#4c82f7"
warning-color: "#ffba08"
danger-color: "#ef4444"
```

## Development Guidelines

When contributing to this theme:

1. Follow [WHMCS Theme Development Standards](https://developers.whmcs.com/themes/)
2. Maintain backwards compatibility
3. Test thoroughly before deploying changes
4. Document any customizations
5. Follow security best practices

## Credits

This theme is based on the [WHMCS Twenty-One theme](https://github.com/WHMCS/templates-twenty-one) and is maintained in accordance with WHMCS development guidelines.

## Support

For support related to:
- Theme customizations: Open an issue in this repository
- Core WHMCS functionality: Contact [WHMCS Support](https://www.whmcs.com/support)
- Documentation: Visit [WHMCS Developers](https://developers.whmcs.com/themes/)

## License

This theme is distributed under the same license as the original WHMCS Twenty-One theme. All customizations are provided as-is under this license.
