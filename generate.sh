#!/usr/bin/env bash
#
# Generate WooCommerce Subscriptions stubs from the source directory.
#

HEADER=$'/**\n * Generated stub declarations for WooCommerce Subscriptions.\n * @see https://www.woocommerce.com/products/woocommerce-subscriptions/\n * @see https://github.com/mralaminahamed/phpstan-woocommerce-subscriptions-stubs\n */'

FILE="woocommerce-subscriptions-stubs.php"
FILE_CONSTANTS="woocommerce-subscriptions-constants-stubs.php"

set -e

test -f "$FILE" || touch "$FILE"
test -f "$FILE_CONSTANTS" || touch "$FILE_CONSTANTS"
test -d "source/woocommerce-subscriptions"

# Exclude globals, constants.
"$(dirname "$0")/vendor/bin/generate-stubs" \
    --include-inaccessible-class-nodes \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --out="$FILE"

# Exclude functions, classes, interfaces, traits and globals.
"$(dirname "$0")/vendor/bin/generate-stubs" \
    --include-inaccessible-class-nodes \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --constants \
    --out="$FILE_CONSTANTS"
