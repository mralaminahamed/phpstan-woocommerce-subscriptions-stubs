<?php

use StubsGenerator\Finder;

/**
 * Where WooCommerce Subscriptions keeps its PHP.
 *
 * `subscriptions-core` used to arrive as a Composer dependency at
 * `vendor/woocommerce/subscriptions-core`, and the finder pointed there. As of 9.0 the
 * plugin ships that code inline under `includes/` and `src/`, and Symfony's Finder throws on
 * a directory that does not exist — so the old path did not merely miss classes, it broke
 * generation outright.
 */
return Finder::create()
    ->in( array(
        'source/woocommerce-subscriptions/includes',
        'source/woocommerce-subscriptions/src',
    ) )
    ->append(
        Finder::create()
            ->in(['source/woocommerce-subscriptions'])
            ->files()
            ->depth('< 1')
            ->path('woocommerce-subscriptions.php')
    )
    // Templates are markup with no declarations to stub, and their bare variables confuse
    // the generator's parser for no gain.
    ->notPath('templates')
    ->sortByName(true)
;
