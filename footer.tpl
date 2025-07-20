    </main><!-- /.main-content -->

    {$footeroutput}

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <a href="{$WEB_ROOT}">
                        {if $assetLogoPath}
                            <img src="https://little.cloud/assets/img/logo.svg" 
                                 alt="{$companyname}" 
                                 class="footer-logo" 
                                 width="120" 
                                 height="40"
                                 loading="lazy" />
                        {else}
                            <img src="https://little.cloud/assets/img/logo.svg" 
                                 alt="{$companyname}" 
                                 class="footer-logo" 
                                 width="120" 
                                 height="40"
                                 loading="lazy" />
                        {/if}
                    </a>
                    <p class="footer-desc">Our mission is to make life easier for our customers. We do it by offering easy to use, fast and reliable technology and support services.</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <nav class="footer-nav">
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register">Register Domain</a>
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">Transfer Domain</a>
                        <a href="{$WEB_ROOT}/domain-pricing">Domain Pricing</a>
                        <a href="{$WEB_ROOT}/whois">WHOIS Lookup</a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=domains">Domain Management</a>
                        <a href="{$WEB_ROOT}/ssl-certificates">SSL Certificates</a>
                        <a href="{$WEB_ROOT}/contact.php">Contact Us</a>
                    </nav>
                </div>
                <div class="col-md-4">
                    <h5>Contact</h5>
                    <p>
                        <strong>Email:</strong> <a href="mailto:helpdesk@little.cloud">helpdesk@little.cloud</a>
                    </p>
                </div>
            </div>
            <div class="footer-copyright">
                <p>Copyright &copy; {$date_year} {$companyname}. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Performance optimization scripts -->
    <script>
        // Lazy loading for images that don't have native support
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        if (img.dataset.src) {
                            img.src = img.dataset.src;
                            img.removeAttribute('data-src');
                        }
                        imageObserver.unobserve(img);
                    }
                });
            });

            document.querySelectorAll('img[data-src]').forEach(img => {
                imageObserver.observe(img);
            });
        }

        // Preload critical resources on user interaction
        let interactionOccurred = false;
        function preloadOnInteraction() {
            if (interactionOccurred) return;
            interactionOccurred = true;

            // Preload next likely pages
            const criticalPages = [
                '{$WEB_ROOT}/clientarea.php',
                '{$WEB_ROOT}/cart.php',
                '{$WEB_ROOT}/contact.php'
            ];

            criticalPages.forEach(url => {
                const link = document.createElement('link');
                link.rel = 'prefetch';
                link.href = url;
                document.head.appendChild(link);
            });
        }

        // Preload on first user interaction
        ['mousedown', 'touchstart', 'keydown'].forEach(event => {
            document.addEventListener(event, preloadOnInteraction, { once: true, passive: true });
        });

        // Performance monitoring
        if ('PerformanceObserver' in window) {
            // Monitor Largest Contentful Paint
            const lcpObserver = new PerformanceObserver((entryList) => {
                const entries = entryList.getEntries();
                const lastEntry = entries[entries.length - 1];
                // You can send this data to analytics
                console.debug('LCP:', lastEntry.startTime);
            });
            lcpObserver.observe({ entryTypes: ['largest-contentful-paint'] });

            // Monitor Cumulative Layout Shift
            const clsObserver = new PerformanceObserver((entryList) => {
                let clsValue = 0;
                for (const entry of entryList.getEntries()) {
                    if (!entry.hadRecentInput) {
                        clsValue += entry.value;
                    }
                }
                console.debug('CLS:', clsValue);
            });
            clsObserver.observe({ entryTypes: ['layout-shift'] });
        }
    </script>

</body>
</html>