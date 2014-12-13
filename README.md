## GitHub to BitBucket : migration tools

A set of bash scripts to migrate repos from github to bitbucket. Ideal for private repos.

### Setup

Make sure your `~/.netrc` contains credentials for :

* `github.com` and `api.github.com`
* `bitbucket.org` and `api.bitbucket.org`

These credentials are used to authenticate `git clone`s and `git push`s and API calls.

### Conventions

The scripts expect their arguments to be repository IDs formatted as `owner/repo`.

### Batch migration

The scripts were built with batch migration in mind. (and are intended to be composed via `xargs`)

Here's a few examples that demonstrate a typical migration process (assuming you have a `repos.txt` file with your repoIDs to migrate, in lowercase) :

#### 1. Prepare: Create new bitbucket repos

```
cat repos.txt | xargs -I {} ./bitbucket_create.sh {}
```

#### 2. Migrate: Clone old GitHub repos and push (mirror) them to BitBucket

This assumes that your repoIds are the same for both GitHub and BitBucket.

```
cat repos.txt | xargs -I {} ./migrate.sh {} {}
```

#### 3. Cleanup: Delete GitHub repos

```
cat repos.txt | xargs -I {} ./github_delete.sh {}
```


#### Hint : Speed up migration

In order to speed up the migration process, each process can't be run in parallel, do so simply give `xargs` a `-P` argument such as `-P 10` (migrate 10 repos at a time).

GitHub is awesome, but if you have lots of private repos like us, that are no longer used in production you might want to migrate to BitBucket in order to "archive" then and reduce your GitHub costs.
