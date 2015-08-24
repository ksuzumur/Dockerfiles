s/^Listen 80/Listen 0.0.0.0:8080/
s/^User apache/User default/
s/^Group apache/Group default/
s%^ErrorLog "logs/error_log"%ErrorLog "/tmp/error_log"%
s%CustomLog "logs/access_log"%CustomLog "/tmp/access_log"%
