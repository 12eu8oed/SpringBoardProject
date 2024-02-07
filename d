[33mcommit f25e0b42dc6225b46628753fb327fa997950eb94[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m, [m[1;31morigin/main[m[33m)[m
Author: 12eu8oed <150359214+12eu8oed@users.noreply.github.com>
Date:   Tue Feb 6 04:40:21 2024 +0900

    파일 수정

[1mdiff --git a/df b/df[m
[1mdeleted file mode 100644[m
[1mindex 4d4eb3f..0000000[m
[1m--- a/df[m
[1m+++ /dev/null[m
[36m@@ -1,194 +0,0 @@[m
[31m-See 'git help <command>' to read about a specific subcommand[m
[31m-[m
[31m-Main Porcelain Commands[m
[31m-   add                     Add file contents to the index[m
[31m-   am                      Apply a series of patches from a mailbox[m
[31m-   archive                 Create an archive of files from a named tree[m
[31m-   bisect                  Use binary search to find the commit that introduced a bug[m
[31m-   branch                  List, create, or delete branches[m
[31m-   bundle                  Move objects and refs by archive[m
[31m-   checkout                Switch branches or restore working tree files[m
[31m-   cherry-pick             Apply the changes introduced by some existing commits[m
[31m-   citool                  Graphical alternative to git-commit[m
[31m-   clean                   Remove untracked files from the working tree[m
[31m-   clone                   Clone a repository into a new directory[m
[31m-   commit                  Record changes to the repository[m
[31m-   describe                Give an object a human readable name based on an available ref[m
[31m-   diff                    Show changes between commits, commit and working tree, etc[m
[31m-   fetch                   Download objects and refs from another repository[m
[31m-   format-patch            Prepare patches for e-mail submission[m
[31m-   gc                      Cleanup unnecessary files and optimize the local repository[m
[31m-   gitk                    The Git repository browser[m
[31m-   grep                    Print lines matching a pattern[m
[31m-   gui                     A portable graphical interface to Git[m
[31m-   init                    Create an empty Git repository or reinitialize an existing one[m
[31m-   log                     Show commit logs[m
[31m-   maintenance             Run tasks to optimize Git repository data[m
[31m-   merge                   Join two or more development histories together[m
[31m-   mv                      Move or rename a file, a directory, or a symlink[m
[31m-   notes                   Add or inspect object notes[m
[31m-   pull                    Fetch from and integrate with another repository or a local branch[m
[31m-   push                    Update remote refs along with associated objects[m
[31m-   range-diff              Compare two commit ranges (e.g. two versions of a branch)[m
[31m-   rebase                  Reapply commits on top of another base tip[m
[31m-   reset                   Reset current HEAD to the specified state[m
[31m-   restore                 Restore working tree files[m
[31m-   revert                  Revert some existing commits[m
[31m-   rm                      Remove files from the working tree and from the index[m
[31m-   scalar                  A tool for managing large Git repositories[m
[31m-   shortlog                Summarize 'git log' output[m
[31m-   show                    Show various types of objects[m
[31m-   sparse-checkout         Reduce your working tree to a subset of tracked files[m
[31m-   stash                   Stash the changes in a dirty working directory away[m
[31m-   status                  Show the working tree status[m
[31m-   submodule               Initialize, update or inspect submodules[m
[31m-   switch                  Switch branches[m
[31m-   tag                     Create, list, delete or verify a tag object signed with GPG[m
[31m-   worktree                Manage multiple working trees[m
[31m-[m
[31m-Ancillary Commands / Manipulators[m
[31m-   config                  Get and set repository or global options[m
[31m-   fast-export             Git data exporter[m
[31m-   fast-import             Backend for fast Git data importers[m
[31m-   filter-branch           Rewrite branches[m
[31m-   mergetool               Run merge conflict resolution tools to resolve merge conflicts[m
[31m-   pack-refs               Pack heads and tags for efficient repository access[m
[31m-   prune                   Prune all unreachable objects from the object database[m
[31m-   reflog                  Manage reflog information[m
[31m-   remote                  Manage set of tracked repositories[m
[31m-   repack                  Pack unpacked objects in a repository[m
[31m-   replace                 Create, list, delete refs to replace objects[m
[31m-[m
[31m-Ancillary Commands / Interrogators[m
[31m-   annotate                Annotate file lines with commit information[m
[31m-   blame                   Show what revision and author last modified each line of a file[m
[31m-   bugreport               Collect information for user to file a bug report[m
[31m-   count-objects           Count unpacked number of objects and their disk consumption[m
[31m-   diagnose                Generate a zip archive of diagnostic information[m
[31m-   difftool                Show changes using common diff tools[m
[31m-   fsck                    Verifies the connectivity and validity of the objects in the database[m
[31m-   gitweb                  Git web interface (web frontend to Git repositories)[m
[31m-   help                    Display help information about Git[m
[31m-   instaweb                Instantly browse your working repository in gitweb[m
[31m-   merge-tree              Perform merge without touching index or working tree[m
[31m-   rerere                  Reuse recorded resolution of conflicted merges[m
[31m-   show-branch             Show branches and their commits[m
[31m-   verify-commit           Check the GPG signature of commits[m
[31m-   verify-tag              Check the GPG signature of tags[m
[31m-   version                 Display version information about Git[m
[31m-   whatchanged             Show logs with differences each commit introduces[m
[31m-[m
[31m-Interacting with Others[m
[31m-   archimport              Import a GNU Arch repository into Git[m
[31m-   cvsexportcommit         Export a single commit to a CVS checkout[m
[31m-   cvsimport               Salvage your data out of another SCM people love to hate[m
[31m-   cvsserver               A CVS server emulator for Git[m
[31m-   imap-send               Send a collection of patches from stdin to an IMAP folder[m
[31m-   p4                      Import from and submit to Perforce repositories[m
[31m-   quiltimport             Applies a quilt patchset onto the current branch[m
[31m-   request-pull            Generates a summary of pending changes[m
[31m-   send-email              Send a collection of patches as emails[m
[31m-   svn                     Bidirectional operation between a Subversion repository and Git[m
[31m-[m
[31m-Low-level Commands / Manipulators[m
[31m-   apply                   Apply a patch to files and/or to the index[m
[31m-   checkout-index          Copy files from the index to the working tree[m
[31m-   commit-graph            Write and verify Git commit-graph files[m
[31m-   commit-tree             Create a new commit object[m
[31m-   hash-object             Compute object ID and optionally create an object from a file[m
[31m-   index-pack              Build pack index file for an existing packed archive[m
[31m-   merge-file              Run a three-way file merge[m
[31m-   merge-index             Run a merge for files needing merging[m
[31m-   mktag                   Creates a tag object with extra validation[m
[31m-   mktree                  Build a tree-object from ls-tree formatted text[m
[31m-   multi-pack-index        Write and verify multi-pack-indexes[m
[31m-   pack-objects            Create a packed archive of objects[m
[31m-   prune-packed            Remove extra objects that are already in pack files[m
[31m-   read-tree               Reads tree information into the index[m
[31m-   symbolic-ref            Read, modify and delete symbolic refs[m
[31m-   unpack-objects          Unpack objects from a packed archive[m
[31m-   update-index            Register file contents in the working tree to the index[m
[31m-   update-ref              Update the object name stored in a ref safely[m
[31m-   write-tree              Create a tree object from the current index[m
[31m-[m
[31m-Low-level Commands / Interrogators[m
[31m-   cat-file                Provide contents or details of repository objects[m
[31m-   cherry                  Find commits yet to be applied to upstream[m
[31m-   diff-files              Compares files in the working tree and the index[m
[31m-   diff-index              Compare a tree to the working tree or index[m
[31m-   diff-tree               Compares the content and mode of blobs found via two tree objects[m
[31m-   for-each-ref            Output information on each ref[m
[31m-   for-each-repo           Run a Git command on a list of repositories[m
[31m-   get-tar-commit-id       Extract commit ID from an archive created using git-archive[m
[31m-   ls-files                Show information about files in the index and the working tree[m
[31m-   ls-remote               List references in a remote repository[m
[31m-   ls-tree                 List the contents of a tree object[m
[31m-   merge-base              Find as good common ancestors as possible for a merge[m
[31m-   name-rev                Find symbolic names for given revs[m
[31m-   pack-redundant          Find redundant pack files[m
[31m-   rev-list                Lists commit objects in reverse chronological order[m
[31m-   rev-parse               Pick out and massage parameters[m
[31m-   show-index              Show packed archive index[m
[31m-   show-ref                List references in a local repository[m
[31m-   unpack-file             Creates a temporary file with a blob's contents[m
[31m-   var                     Show a Git logical variable[m
[31m-   verify-pack             Validate packed Git archive files[m
[31m-[m
[31m-Low-level Commands / Syncing Repositories[m
[31m-   daemon                  A really simple server for Git repositories[m
[31m-   fetch-pack              Receive missing objects from another repository[m
[31m-   http-backend            Server side implementation of Git over HTTP[m
[31m-   send-pack               Push objects over Git protocol to another repository[m
[31m-   update-server-info      Update auxiliary info file to help dumb servers[m
[31m-[m
[31m-Low-level Commands / Internal Helpers[m
[31m-   check-attr              Display gitattributes information[m
[31m-   check-ignore            Debug gitignore / exclude files[m
[31m-   check-mailmap           Show canonical names and email addresses of contacts[m
[31m-   check-ref-format        Ensures that a reference name is well formed[m
[31m-   column                  Display data in columns[m
[31m-   credential              Retrieve and store user credentials[m
[31m-   credential-cache        Helper to temporarily store passwords in memory[m
[31m-   credential-store        Helper to store credentials on disk[m
[31m-   fmt-merge-msg           Produce a merge commit message[m
[31m-   hook                    Run git hooks[m
[31m-   interpret-trailers      Add or parse structured information in commit messages[m
[31m-   mailinfo                Extracts patch and authorship from a single e-mail message[m
[31m-   mailsplit               Simple UNIX mbox splitter program[m
[31m-   merge-one-file          The standard helper program to use with git-merge-index[m
[31m-   patch-id                Compute unique ID for a patch[m
[31m-   sh-i18n                 Git's i18n setup code for shell scripts[m
[31m-   sh-setup                Common Git shell script setup code[m
[31m-   stripspace              Remove unnecessary whitespace[m
[31m-[m
[31m-User-facing repository, command and file interfaces[m
[31m-   attributes              Defining attributes per path[m
[31m-   cli                     Git command-line interface and conventions[m
[31m-   hooks                   Hooks used by Git[m
[31m-   ignore                  Specifies intentionally untracked files to ignore[m
[31m-   mailmap                 Map author/committer names and/or E-Mail addresses[m
[31m-   modules                 Defining submodule properties[m
[31m-   repository-layout       Git Repository Layout[m
[31m-   revisions               Specifying revisions and ranges for Git[m
[31m-[m
[31m-Developer-facing file formats, protocols and other interfaces[m
[31m-   format-bundle           The bundle file format[m
[31m-   format-chunk            Chunk-based file formats[m
[31m-   format-commit-graph     Git commit-graph format[m
[31m-   format-index            Git index format[m
[31m-   format-pack             Git pack format[m
[31m-   format-signature        Git cryptographic signature formats[m
[31m-   protocol-capabilities   Protocol v0 and v1 capabilities[m
[31m-   protocol-common         Things common to various protocols[m
[31m-   protocol-http           Git HTTP-based protocols[m
[31m-   protocol-pack           How packs are transferred over-the-wire[m
[31m-   protocol-v2             Git Wire Protocol, Version 2[m
[31m-[m
[31m-External commands[m
[31m-   askpass[m
[31m-   askyesno[m
[31m-   credential-helper-selector[m
[31m-   credential-manager[m
[31m-   flow[m
[31m-   lfs[m
[31m-   update-git-for-windows[m
