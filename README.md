
### Create a SSH key for github 

Create a key:

```
ssh-keygen -t ed25519 -C "your_email@example.com"`
chmod 400 ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```  

Now add the public key to Github.

### Managing a NixOS configuration with Git while avoiding the need to run Git commands as root

The only thing we have to do for this is to create a directory `.git` and change the ownership to the user:

```
cd /etc/nixos
sudo mkdir .git
sudo chown USERNAME:users .git
git init
```

### First commit

Now create an empty Github repository and then add all files, commit them and push to `main`:

```
git add .
git commit -m "Initial commit of config files."
git remote add origin git@github.com:GITHUB_USERNAME/REPOSITORY.git
git branch -M main
git push -u origin main
```
### Git problems

If one gets an `error: insufficient permission for adding an object to repository database .git/objects` occurs when Git cannot modify files within the `.git/objects` directory due to incorrect file ownership or permissions, typically caused by accidentally using `sudo` with a Git command in the past. This results in the files being owned by root or another user, preventing the current user from making changes.

To resolve this issue, you need to restore ownership of the .git directory to your current user. The most common and recommended solution is to run the following command from within the project's root directory:

```
sudo chown -R $(id -u):$(id -g) "$(git rev-parse --show-toplevel)/.git"
```

### OpenDNS

```
cd /etc
sudo touch ddclient_opendns.conf
```

Now edit `ddclient_opendns.conf`:

```
protocol=dyndns2
use=web, web=myip.dnsomatic.com
ssl=yes
server=updates.opendns.com
login=opendns_username
password='opendns_password'
opendns_network_label
```
Finally restrict the permissions:

```
sudo chmod 600 ddclient_opendns.conf
```

Now we can refer to this file in `opendns.nix`.

### Hybrid graphics with PRIME

Determine the PCI bus IDs of the two GPUs:
```
nix shell nixpkgs#pciutils -c lspci -d ::03xx
```
