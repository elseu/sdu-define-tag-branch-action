# Define tag and branch based on ref variable action

This will help to get a branch and tag name out of the \${{ github.ref }}

## Usage

### Directory structure

You need to have in the root of your project having a directory called `deploy` within this directory there should be a `values.yaml` file that will be used for the helm chart.

### Action

#### Action options

| Prop  | description                                        |
| ----- | -------------------------------------------------- |
| ref\* | the `${{ github.ref }}` can be used for this field |

\* = required

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: elseu/sdu-define-tag-branch-action@v1
        id: branch_tag
        with:
          ref: ${{ github.ref }}
```

#### Outputs

| Prop                    | description                                                               |
| ----------------------- | ------------------------------------------------------------------------- |
| branch\*                | The branch name if it is a tag the branch name will be empty              |
| tag\*                   | If it is a tag it will return here a tag other wise it is the branch name |
| type\*                  | Defines what type it is branch or tag (branch / tag)                      |
| branch_not_formatted \* | Branch name not formatted                                                 |
