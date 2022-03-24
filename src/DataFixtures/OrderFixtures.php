<?php

namespace Order\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class OrderFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {

        // create 20 products! Bam!
        // for ($i = 0; $i < 20; $i++) {
        //     $product = new Product();
        //     $product->setName('product '.$i);
        //     $product->setPrice(mt_rand(10, 100));
        //     $manager->persist($product);
        // }

        // for ($i = 0; $i < 20; $i++) {
        //     $order = new Order();
        //     $order->setOrderNum();
        //     $cook->setOrderId($this->getReference(OrderFixtures::ORDER_REFERENCE));
        //     $manager->persist($cook);
        // }

        $manager->flush();
    }

    // public function getDependencies()
    // {
    //     return [DishFixtures::class];
    // }
}