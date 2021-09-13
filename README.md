# Dotfiles

My personal collection of dotfiles managed by [chezmoi](https://www.chezmoi.io).

## Applying

```bash
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply overtfuture
```

After applying, add a `$HOME/.zshrc_private` to set your zsh preferences

## Adding / Updating Files

```bash
# Add File
chezmoi add ~/.zshrc
# Manage git controlled dir
chezmoi cd
# Add, commit, push
git add .; git commit; git push
# Exit chezmoi dir
exit
```

## Updating

```bash
chezmoi update
```

## Secure Files

My private files are stored securely in 1Password and referenced via uuid. The documentation for 1Password templates can be found [here](https://www.chezmoi.io/docs/how-to/#use-1password).

Before applying, log into 1Password to retrieve the appropriate encrypted documents.
