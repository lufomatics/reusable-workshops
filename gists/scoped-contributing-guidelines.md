start: Tean

Quickstart: Team-Scoped Sparse-Checkout

Quickstart: Team-Scoped Sparse-Checkou Untitled-1

We've added two Git aliases to make working "scoped" to your team's directory frictionless.

1) Install the allases

Run once on your machine:

bash

#adds both sparse-clone and sparse-init to your ~/.gitconfig

curl -SL https://raw.githubusercontent.com/OWNER/REPO/main/scripts/install-sparse-aliases.sh I bash

Or copy paste these two commands:

bash

git config -global alias.sparse-clone 'Ibash -c '''

REPO-$(1:-); DIR=${2:-);

[ -z "$REPO"] 50 read -p "Repo URL: REPO;

[ -z "$DIR"] 60 read -p "Dir to sparse-checkout: " DIR;

git clone -filter-blob:none -sparse "$REPO" 66\

cd "$(basename "$REPO" .git)" 80 \

git sparse-checkout set "$DIR"

git config -global alias.sparse-init 'Ibash -c '''

DIR=$(1:-};

[ -z "$DIR"] 60 read -p "Directory to sparse-checkout: DIR;

git sparse-checkout init -cone 00

git sparse-checkout set "$DIR"

2) Clone for the first time

bash

#you can supply both args, one, or none:

git sparse-clone

#prompts for URL & dir

git sparse-clone https:///REPO.git

#prompts for dir

git sparse-clone https:///REPO.git teams/frontend

3) Convert an existing clone bash

cd path/to/your-already-cloned-repo

git sparse-init

git sparse-init teans/api

prompts for dir

#no prompt, uses teams/api

That's it! Your working tree will only ever contain the directory you care about-pulls/fetches still get full history, but blobs are only fetched on demand. That's it! Your working tree will only ever contain the directory you care about-pulls/fetches still get full history, but blobs are only
fetched on demand,