#!/bin/bash
# Test script to demonstrate CI behavior

echo "=== Testing CI Behavior ==="
echo

echo "Current txt files in repository root:"
ls *.txt 2>/dev/null || echo "No txt files found"
echo

echo "Testing current CI logic..."
cd "$(dirname "$0")"

if ls *.txt 1> /dev/null 2>&1; then
    if grep -q 'CIOK' *.txt; then
        echo "✅ CIOK found in txt files. CI check would PASS."
        exit 0
    else
        echo "❌ 'CIOK' not found in any txt file. CI check would FAIL and block merge." >&2
        exit 1
    fi
else
    echo "❌ No txt files found in repository root. CI check would FAIL and block merge." >&2
    exit 1
fi