
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