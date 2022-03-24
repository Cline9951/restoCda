<?php

namespace App\Entity;

use App\Repository\PaymentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PaymentRepository::class)]
class Payment
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'float')]
    private $amount;

    #[ORM\Column(type: 'datetime_immutable')]
    private $created_at;

    #[ORM\Column(type: 'datetime_immutable')]
    private $updated_at;

    #[ORM\ManyToOne(targetEntity: Order::class, inversedBy: 'payment_id')]
    private $order_id;

    #[ORM\OneToMany(mappedBy: 'payment', targetEntity: PaymentMethod::class)]
    private $payment_method_id;

    public function __construct()
    {
        $this->payment_method_id = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAmount(): ?float
    {
        return $this->amount;
    }

    public function setAmount(float $amount): self
    {
        $this->amount = $amount;

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

    public function getOrderId(): ?Order
    {
        return $this->order_id;
    }

    public function setOrderId(?Order $order_id): self
    {
        $this->order_id = $order_id;

        return $this;
    }

    /**
     * @return Collection<int, PaymentMethod>
     */
    public function getPaymentMethodId(): Collection
    {
        return $this->payment_method_id;
    }

    public function addPaymentMethodId(PaymentMethod $paymentMethodId): self
    {
        if (!$this->payment_method_id->contains($paymentMethodId)) {
            $this->payment_method_id[] = $paymentMethodId;
            $paymentMethodId->setPayment($this);
        }

        return $this;
    }

    public function removePaymentMethodId(PaymentMethod $paymentMethodId): self
    {
        if ($this->payment_method_id->removeElement($paymentMethodId)) {
            // set the owning side to null (unless already changed)
            if ($paymentMethodId->getPayment() === $this) {
                $paymentMethodId->setPayment(null);
            }
        }

        return $this;
    }
}
