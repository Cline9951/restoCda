<?php

namespace App\Entity;

use App\Repository\TableRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TableRepository::class)]
#[ORM\Table(name: '`table`')]
class Table
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $qr_code;

    #[ORM\OneToMany(mappedBy: 'table_id', targetEntity: Customer::class)]
    private $customers;

    #[ORM\ManyToOne(targetEntity: Waiter::class, inversedBy: 'tables')]
    private $waiter_id;

    public function __construct()
    {
        $this->customers = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQrCode(): ?string
    {
        return $this->qr_code;
    }

    public function setQrCode(string $qr_code): self
    {
        $this->qr_code = $qr_code;

        return $this;
    }

    /**
     * @return Collection<int, Customer>
     */
    public function getCustomers(): Collection
    {
        return $this->customers;
    }

    public function addCustomer(Customer $customer): self
    {
        if (!$this->customers->contains($customer)) {
            $this->customers[] = $customer;
            $customer->setTableId($this);
        }

        return $this;
    }

    public function removeCustomer(Customer $customer): self
    {
        if ($this->customers->removeElement($customer)) {
            // set the owning side to null (unless already changed)
            if ($customer->getTableId() === $this) {
                $customer->setTableId(null);
            }
        }

        return $this;
    }

    public function getWaiterId(): ?Waiter
    {
        return $this->waiter_id;
    }

    public function setWaiterId(?Waiter $waiter_id): self
    {
        $this->waiter_id = $waiter_id;

        return $this;
    }
}
