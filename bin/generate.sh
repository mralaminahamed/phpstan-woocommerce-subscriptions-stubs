#!/usr/bin/env bash
#
# Generate WooCommerce Subscriptions stubs from the source directory.
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

HEADER=$'/**\n * Generated stub declarations for WooCommerce Subscriptions.\n * @see https://woocommerce.com/products/woocommerce-subscriptions/\n * @see https://github.com/mralaminahamed/phpstan-woocommerce-subscriptions-stubs\n */'

FILE="$ROOT_DIR/woocommerce-subscriptions-stubs.php"
FILE_CONSTANTS="$ROOT_DIR/woocommerce-subscriptions-constants-stubs.php"
GENERATOR_BIN="$ROOT_DIR/vendor/bin/generate-stubs"
FINDER_FILE="$ROOT_DIR/configs/finder.php"

set -e

test -f "$FILE" || touch "$FILE"
test -f "$FILE_CONSTANTS" || touch "$FILE_CONSTANTS"
test -d "$ROOT_DIR/source/woocommerce-subscriptions"

"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$FINDER_FILE" \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --out="$FILE"

"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$FINDER_FILE" \
    --header="$HEADER" \
    --constants \
    --out="$FILE_CONSTANTS"
