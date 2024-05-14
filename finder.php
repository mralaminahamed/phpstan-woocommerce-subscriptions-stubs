<?php

return \StubsGenerator\Finder::create()
    ->in( array(
        'source/woocommerce-subscriptions/vendor/woocommerce/subscriptions-core',
        'source/woocommerce-subscriptions/includes',
    ) )
    ->append(
        \StubsGenerator\Finder::create()
            ->in(['source/woocommerce-subscriptions'])
            ->files()
            ->depth('< 1')
            ->path('woocommerce-subscriptions.php')
    )
    // ->notPath('customizer')
    // ->notPath('debug')
    ->sortByName(true)
;
