# Conditional Merge CI

This repository implements a conditional merge policy that prevents merging to the `main` branch unless the "Check CIOK in txt files" CI check passes.

## How it works

1. **CI Workflow**: The `.github/workflows/check-ciok.yml` workflow runs on all pull requests and pushes to the `main` branch.
2. **Check Logic**: The workflow searches for the string `CIOK` in all `.txt` files in the repository root directory.
3. **Branch Protection**: GitHub's branch protection rules are configured to require the "Check CIOK in txt files" check to pass before allowing merges.

## Setting up Branch Protection

To ensure this CI check blocks merges when it fails, configure the branch protection rule for the `main` branch:

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Branches**
3. Click "Add rule" or edit existing rule for `main` branch
4. Enable the following options:
   - ✅ **Require status checks to pass before merging**
   - ✅ **Require branches to be up to date before merging**
   - ✅ In the status checks list, select: **check-ciok** (this is the job name from the workflow)

## Testing the Setup

### Scenario 1: CI Should Pass
1. Create a `.txt` file in the repository root
2. Include the string `CIOK` somewhere in the file
3. Create a pull request to `main`
4. The CI check should pass ✅

### Scenario 2: CI Should Fail
1. Remove all `.txt` files from the repository root, OR
2. Ensure no `.txt` files contain the string `CIOK`
3. Create a pull request to `main`
4. The CI check should fail ❌ and block the merge

## Current Status

The repository includes an `example.txt` file with the `CIOK` keyword, so the CI check should currently pass.