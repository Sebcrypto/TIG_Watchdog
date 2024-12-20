# TIG WatchDog<br>
<br>

 ## How To Install TIG Watchdog (Comment installer le watchdog TIG)<br>
<br><br>

Copy the following commande in terminal (copiez la commande suivante dans le terminal)<br>
<br>
```
cd ~ && wget https://raw.githubusercontent.com/Sebcrypto/TIG_Watchdog/refs/heads/main/watchdog_tig.sh && chmod +x watchdog_tig.sh &&
(crontab -l; echo "* * * * * $HOME/watchdog_tig.sh >> $HOME/watchdog.log 2>&1") | crontab - &&
sudo wget -O /usr/local/bin/tig https://raw.githubusercontent.com/Sebcrypto/TIG_Watchdog/refs/heads/main/tig && sudo chmod +x /usr/local/bin/tig &&
tig restart
```
<br>

## Quick commands (Commandes rapides)<br>
<br>
With this script you use some quick commands:<br>

```
tig
```
if no argument is passed, script will display tig screen if exist or launch tig if it don't exist  <br>
(Si aucun argument n'est passé la command va affichier le screen si il existe ou le demarrer si il n'existe pas)<br>

___


```
tig start
```
Start the tig miner / (Démarre le mineur)<br>

___


```
tig stop
```
Stop the tig miner / (Stop le mineur)<br>

___


```
tig restart
```
Restart the tig miner / (Redemarre le mineur)<br>


___


```
tig watch
```
Show watchdog logs / (Affiche les logs du watchdog)<br>


