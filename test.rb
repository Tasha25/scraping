
#!/usr/bin/ruby
#!/usr/bin/ruby
txt='<a href="mailto:info@vacamas.org" target="_blank" onclick="_gaq.push([\'_trackEvent\', \'button\', \'clicked\', \'Vacamas.org\'])">Info@Vacamas.org</a>'

email_address = txt.match(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)[0]

puts email_address

