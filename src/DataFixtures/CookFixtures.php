<?php

namespace Cook\DataFixtures;


use App\Entity\Cook;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;

class CookFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        for ($i = 0; $i < 10; $i++) {
            $cook = new Cook('cook ' .$i);
            $cook->setName();
            // $cook->setOrderId($this->getReference(OrderFixtures::ORDER_REFERENCE));
            $manager->persist($cook);
        }

        $manager->flush();
    }

    // public function getDependencies()
    // {
    //     return [OrderFixtures::class];
    // }
}