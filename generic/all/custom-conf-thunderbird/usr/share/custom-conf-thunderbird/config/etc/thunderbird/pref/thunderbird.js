// CUSTOM-CONF: File automatically created/updated [custom-conf-thunderbird]

// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mail checking (gnome).
pref("mail.shell.checkDefaultClient", false);
pref("mail.shell.checkDefaultMail", false);

// Prevent milestone page to popup on version change
pref("mailnews.start_page_override.mstone", "ignore");

// Disable IPv6 DNS Lookup
//pref("network.dns.disableIPv6", true);

// URL/Link handlers
pref("network.protocol-handler.app.http", "x-www-browser");
pref("network.protocol-handler.app.https", "x-www-browser");

// Snooping settings
pref("toolkit.telemetry.prompted", 2);
pref("toolkit.telemetry.rejected", true);

// Force cache management to sensible settings
pref("browser.cache.disk.smart_size.enabled", false);
pref("browser.cache.disk.smart_size.first_run", false);
pref("browser.cache.disk.parent_directory", "~/.cache/thunderbird");
pref("browser.cache.disk.capacity", 262144);
pref("browser.cache.offline.parent_directory", "~/.cache/thunderbird");
pref("browser.cache.offline.capacity", 262144);

