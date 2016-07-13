// CUSTOM-CONF: File automatically created/updated [custom-conf-firefox-esr]

// Allow extensions update check
pref("extensions.update.enabled", true);

// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// identify default locale to use if no /usr/lib/firefox-addons/searchplugins/LOCALE
// exists for the current used LOCALE
pref("distribution.searchplugins.defaultLocale", "en-GB");

// Prevent EULA dialog to popup on first run
lockPref("browser.EULA.override", true);

// Prevent milestone page to popup on version change
lockPref("browser.startup.homepage_override.mstone", "ignore");

// Enable the NetworkManager integration
lockPref("toolkit.networkmanager.disable", false);

// Disable IPv6 DNS Lookup
//pref("network.dns.disableIPv6", true);

// Avoid openh264 being downloaded
pref("media.gmp-manager.url.override", "data:text/plain,");

// Disable openh264
pref("media.gmp-gmpopenh264.enabled", false);

// Default to classic view for about:newtab
sticky_pref("browser.newtabpage.enhanced", false);

// Disable health report upload
lockPref("datareporting.healthreport.uploadEnabled", false);

// Force cache management to sensible settings
lockPref("browser.cache.disk.smart_size.enabled", false);
lockPref("browser.cache.disk.smart_size.first_run", false);
lockPref("browser.cache.disk.parent_directory", "~/.cache/firefox");
lockPref("browser.cache.disk.capacity", 262144);
lockPref("browser.cache.offline.parent_directory", "~/.cache/firefox");
lockPref("browser.cache.offline.capacity", 262144);

