<?php

namespace App\Entity;

use App\Repository\CustomerRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CustomerRepository::class)]
class Customer
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: Table::class, inversedBy: 'customers')]
    private $table_id;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTableId(): ?Table
    {
        return $this->table_id;
    }

    public function setTableId(?Table $table_id): self
    {
        $this->table_id = $table_id;

        return $this;
    }
}
