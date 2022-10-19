# Algox

## Data structures and Algorithms using Elixir Language

[//]: # "Badges"
[![Dependabot][dependabot badge]][dependabot]
[![Actions Status][actions badge]][actions]
[![Coverage][coverage badge]][coverage]

[//]: # "Links"
[dependabot]: https://github.com/jaeyson/algox/pulls/app%2Fdependabot
[actions]: https://github.com/jaeyson/algox/actions
[coverage]: https://coveralls.io/github/jaeyson/algox?branch=main

[//]: # "Image sources"
[dependabot badge]: https://img.shields.io/badge/Dependabot-enabled-green
[actions badge]: https://github.com/jaeyson/algox/actions/workflows/ci.yml/badge.svg
[coverage badge]: https://coveralls.io/repos/github/jaeyson/algox/badge.svg?branch=main


[binary search link]: lib/algox/binary_search.ex
[linear search link]: lib/algox/linear_search.ex
[quick sort link]: lib/algox/quick_sort.ex
[walk on matrix link]: lib/algox/walk_on_matrix.ex

### Files

|     Name      |
|---------------|
| [Binary Search][binary search link] |
| [Linear Search][linear search link] |
| [Quick Sort][quick sort link] |
| [Walk on Matrix][walk on matrix link] |

### Benchmarks

using mix task:

```bash
# file names found in lib/algox dir
mix benchmark binary_search

mix benchmark quick_sort
```
