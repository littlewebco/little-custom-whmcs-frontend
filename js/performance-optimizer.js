/**
 * Little Portal Performance Optimizer
 * Lightweight scripts to replace the heavy bundled libraries
 * Optimized for WHMCS themes
 */

(function() {
    'use strict';

    // Performance utilities
    const PerfOptimizer = {
        // Image lazy loading with intersection observer
        initLazyLoading: function() {
            if ('IntersectionObserver' in window) {
                const imageObserver = new IntersectionObserver((entries, observer) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const img = entry.target;
                            if (img.dataset.src) {
                                img.src = img.dataset.src;
                                img.classList.add('loaded');
                                img.removeAttribute('data-src');
                            }
                            observer.unobserve(img);
                        }
                    });
                }, {
                    root: null,
                    rootMargin: '50px',
                    threshold: 0.1
                });

                // Observe all images with data-src
                document.querySelectorAll('img[data-src]').forEach(img => {
                    img.classList.add('lazy');
                    imageObserver.observe(img);
                });
            }
        },

        // Critical resource preloading on user interaction
        initPreloading: function() {
            let interactionOccurred = false;
            
            const preloadCriticalResources = () => {
                if (interactionOccurred) return;
                interactionOccurred = true;

                // Preload likely next pages
                const criticalPages = [
                    '/clientarea.php',
                    '/cart.php',
                    '/contact.php',
                    '/login.php'
                ];

                criticalPages.forEach(path => {
                    const link = document.createElement('link');
                    link.rel = 'prefetch';
                    link.href = window.whmcsBaseUrl + path;
                    document.head.appendChild(link);
                });

                // Preload common assets
                const criticalAssets = [
                    '/templates/little-portal/css/theme.min.css',
                    '/assets/css/fontawesome-all.min.css'
                ];

                criticalAssets.forEach(asset => {
                    const link = document.createElement('link');
                    link.rel = 'prefetch';
                    link.href = window.whmcsBaseUrl + asset;
                    document.head.appendChild(link);
                });
            };

            // Trigger preloading on first user interaction
            ['mousedown', 'touchstart', 'keydown', 'scroll'].forEach(event => {
                document.addEventListener(event, preloadCriticalResources, { 
                    once: true, 
                    passive: true 
                });
            });
        },

        // Optimize form interactions
        initFormOptimizations: function() {
            // Add loading states to forms
            document.querySelectorAll('form').forEach(form => {
                form.addEventListener('submit', function(e) {
                    const submitBtn = form.querySelector('[type="submit"]');
                    if (submitBtn && !submitBtn.disabled) {
                        submitBtn.classList.add('loading');
                        submitBtn.disabled = true;
                        
                        // Re-enable after 30 seconds as fallback
                        setTimeout(() => {
                            submitBtn.classList.remove('loading');
                            submitBtn.disabled = false;
                        }, 30000);
                    }
                });
            });

            // Optimize select elements
            document.querySelectorAll('select[multiple]').forEach(select => {
                select.addEventListener('change', function() {
                    // Debounce multiple selections
                    clearTimeout(this.changeTimeout);
                    this.changeTimeout = setTimeout(() => {
                        // Trigger any necessary updates
                        this.dispatchEvent(new Event('optimizedChange'));
                    }, 300);
                });
            });
        },

        // Modal optimizations
        initModalOptimizations: function() {
            // Optimize modal loading
            const modalTriggers = document.querySelectorAll('[data-bs-toggle="modal"]');
            modalTriggers.forEach(trigger => {
                trigger.addEventListener('click', function() {
                    const targetModal = document.querySelector(this.getAttribute('data-bs-target'));
                    if (targetModal) {
                        targetModal.classList.add('loading');
                        
                        // Remove loading state when modal is shown
                        targetModal.addEventListener('shown.bs.modal', function() {
                            this.classList.remove('loading');
                        }, { once: true });
                    }
                });
            });
        },

        // Web Vitals monitoring
        initPerformanceMonitoring: function() {
            if (typeof PerformanceObserver === 'undefined') return;

            // Monitor Largest Contentful Paint (LCP)
            try {
                const lcpObserver = new PerformanceObserver((entryList) => {
                    const entries = entryList.getEntries();
                    const lastEntry = entries[entries.length - 1];
                    
                    // Log performance data (can be sent to analytics)
                    console.info('LCP:', Math.round(lastEntry.startTime), 'ms');
                    
                    // Dispatch custom event for analytics
                    window.dispatchEvent(new CustomEvent('perf:lcp', {
                        detail: { value: lastEntry.startTime }
                    }));
                });
                lcpObserver.observe({ entryTypes: ['largest-contentful-paint'] });
            } catch (e) {
                console.debug('LCP monitoring not available');
            }

            // Monitor Cumulative Layout Shift (CLS)
            try {
                let clsValue = 0;
                const clsObserver = new PerformanceObserver((entryList) => {
                    for (const entry of entryList.getEntries()) {
                        if (!entry.hadRecentInput) {
                            clsValue += entry.value;
                        }
                    }
                    
                    console.info('CLS:', clsValue.toFixed(4));
                    
                    window.dispatchEvent(new CustomEvent('perf:cls', {
                        detail: { value: clsValue }
                    }));
                });
                clsObserver.observe({ entryTypes: ['layout-shift'] });
            } catch (e) {
                console.debug('CLS monitoring not available');
            }

            // Monitor First Input Delay (FID)
            try {
                const fidObserver = new PerformanceObserver((entryList) => {
                    for (const entry of entryList.getEntries()) {
                        console.info('FID:', Math.round(entry.processingStart - entry.startTime), 'ms');
                        
                        window.dispatchEvent(new CustomEvent('perf:fid', {
                            detail: { value: entry.processingStart - entry.startTime }
                        }));
                    }
                });
                fidObserver.observe({ entryTypes: ['first-input'] });
            } catch (e) {
                console.debug('FID monitoring not available');
            }
        },

        // Initialize all optimizations
        init: function() {
            // Wait for DOM to be ready
            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', () => {
                    this.runOptimizations();
                });
            } else {
                this.runOptimizations();
            }
        },

        runOptimizations: function() {
            this.initLazyLoading();
            this.initPreloading();
            this.initFormOptimizations();
            this.initModalOptimizations();
            this.initPerformanceMonitoring();
            
            console.info('Little Portal Performance Optimizer loaded');
        }
    };

    // Auto-initialize
    PerfOptimizer.init();

    // Expose to global scope for external use
    window.LittlePortalOptimizer = PerfOptimizer;

})();