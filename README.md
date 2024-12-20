How To Install TIG Watchdog / Comment installer le watchdog TIG


Copy the following commande in terminal / copiez la commande suivante dans le terminal

```
cd ~ && wget https://raw.githubusercontent.com/Sebcrypto/TIG_Watchdog/refs/heads/main/watchdog_tig.sh && chmod +x watchdog_tig.sh &&
(crontab -l; echo "* * * * * $HOME/watchdog_tig.sh >> $HOME/watchdog.log 2>&1") | crontab - &&
sudo wget -O /usr/local/bin/tig https://raw.githubusercontent.com/Sebcrypto/TIG_Watchdog/refs/heads/main/tig && sudo chmod +x /usr/local/bin/tig &&
tig restart
```

