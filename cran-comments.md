## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

I ran `revdepcheck::revdep_check(num_workers = 4)`.

Results:

- 3 reverse dependencies checked
- 0 new problems
- 2 packages failed to check: `DataSimilarity`, `S4DM`

Both failed packages timed out in `R CMD check` both before and after the changes.
`S4DM` also had a pre-existing DESCRIPTION NOTE.
Therefore, no new reverse dependency problems appear to be introduced by this version.
