edit env file as you would prefer
for me i use http://localhost:8888/kanjiwines/public/login
to access the software

---------------------------------------------------------------------------
                                                           Sat, Aug 30, '25
                                                           ----------------
Wampserver - Installers, Updates, Addons, Tools
https://wampserver.aviatechno.net/

Steps to Share Wampserver App on LAN

1. Get Your PC’s Local IP Address
On the server computer (where Wampserver is installed):
=> Open Command Prompt → type:
   ipconfig
=> Look for IPv4 Address, e.g.:
   IPv4 Address. . . . . . . . . . . : 192.168.1.101

2. Configure Apache to Listen on All Interfaces
Edit the Apache configuration:
=> Open:
   C:\wamp64\bin\apache\apache2.4.xx\conf\httpd.conf
=> Find:
   Listen 127.0.0.1:80
=> Change to:
   Listen 0.0.0.0:80
This makes Apache accept requests from other computers, not just localhost.

3. Update Virtual Host Configuration
=> Open:
   C:\wamp64\bin\apache\apache2.4.xx\conf\extra\httpd-vhosts.conf
=> Add/modify a block like this:
   <VirtualHost *:80>
      DocumentRoot "C:/wamp64/www/Upos4.8/public"
      ServerName localhost

      <Directory "C:/wamp64/www/Upos4.8/public">
         Options Indexes FollowSymLinks
         AllowOverride All
         Require all granted
      </Directory>
   </VirtualHost>
-> The important line is:
   Require all granted
which allows access from LAN devices.

4. Open Firewall Port 80
=> Go to Windows Defender Firewall → Advanced Settings.
=> Create a new inbound rule:
   -> Type: Port
   -> Protocol: TCP
   -> Port: 80
   -> Action: Allow the connection
   -> Apply to Domain, Private, Public

5. Restart Wampserver
=> Left-click Wampserver tray icon → Restart All Services.

6. Access from Another Computer
On another PC connected to the same LAN/WiFi:
=> Open a browser and enter:
   http://192.168.1.101/Upos4.8/public/pos

   (replace 192.168.1.101 with your actual server IP from step 1).
You should now see the same POS system login/dashboard.
