<?php

namespace App\Entity;

use App\Repository\OrderRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrderRepository::class)]
#[ORM\Table(name: '`order`')]
class Order
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'bigint')]
    private $order_num;

    #[ORM\Column(type: 'datetime_immutable')]
    private $created_at;

    #[ORM\Column(type: 'datetime_immutable')]
    private $updated_at;

    #[ORM\OneToMany(mappedBy: 'orders', targetEntity: Dish::class)]
    private $dish_id;

    #[ORM\ManyToOne(targetEntity: Status::class, inversedBy: 'orders')]
    private $status_id;

    #[ORM\OneToMany(mappedBy: 'order_id', targetEntity: Payment::class)]
    private $payment_id;

    #[ORM\OneToMany(mappedBy: 'order_id', targetEntity: Cook::class)]
    private $cooks;

    public function __construct()
    {
        $this->dish_id = new ArrayCollection();
        $this->payment_id = new ArrayCollection();
        $this->cooks = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOrderNum(): ?string
    {
        return $this->order_num;
    }

    public function setOrderNum(string $order_num): self
    {
        $this->order_num = $order_num;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(\DateTimeImmutable $updated_at): self
    {
        $this->updated_at = $updated_at;

        return $this;
    }

    /**
     * @return Collection<int, Dish>
     */
    public function getDishId(): Collection
    {
        return $this->dish_id;
    }

    public function addDishId(Dish $dishId): self
    {
        if (!$this->dish_id->contains($dishId)) {
            $this->dish_id[] = $dishId;
            $dishId->setOrders($this);
        }

        return $this;
    }

    public function removeDishId(Dish $dishId): self
    {
        if ($this->dish_id->removeElement($dishId)) {
            // set the owning side to null (unless already changed)
            if ($dishId->getOrders() === $this) {
                $dishId->setOrders(null);
            }
        }

        return $this;
    }

    public function getStatusId(): ?Status
    {
        return $this->status_id;
    }

    public function setStatusId(?Status $status_id): self
    {
        $this->status_id = $status_id;

        return $this;
    }

    /**
     * @return Collection<int, Payment>
     */
    public function getPaymentId(): Collection
    {
        return $this->payment_id;
    }

    public function addPaymentId(Payment $paymentId): self
    {
        if (!$this->payment_id->contains($paymentId)) {
            $this->payment_id[] = $paymentId;
            $paymentId->setOrderId($this);
        }

        return $this;
    }

    public function removePaymentId(Payment $paymentId): self
    {
        if ($this->payment_id->removeElement($paymentId)) {
            // set the owning side to null (unless already changed)
            if ($paymentId->getOrderId() === $this) {
                $paymentId->setOrderId(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Cook>
     */
    public function getCooks(): Collection
    {
        return $this->cooks;
    }

    public function addCook(Cook $cook): self
    {
        if (!$this->cooks->contains($cook)) {
            $this->cooks[] = $cook;
            $cook->setOrderId($this);
        }

        return $this;
    }

    public function removeCook(Cook $cook): self
    {
        if ($this->cooks->removeElement($cook)) {
            // set the owning side to null (unless already changed)
            if ($cook->getOrderId() === $this) {
                $cook->setOrderId(null);
            }
        }

        return $this;
    }
}
