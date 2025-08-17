
### Create a SSH key for github 

`>ssh-keygen -t ed25519 -C "your_email@example.com"`

### Managing a NixOS configuration with Git while avoiding the need to run Git commands as root

`>mkdir ~/git`

Create a small .git file in /etc/nixos pointing to the user's Git directory:
`>sudo git init /etc/nixos --separate-git-dir ~/git`

Now in the user's Git directory:
`>git config --path core.worktree /etc/nixos`