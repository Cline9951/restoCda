<?php

namespace App\Entity;

use App\Repository\WaiterRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: WaiterRepository::class)]
class Waiter
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $name;

    #[ORM\OneToMany(mappedBy: 'waiter_id', targetEntity: Table::class)]
    private $tables;

    #[ORM\OneToMany(mappedBy: 'waiter', targetEntity: Notice::class)]
    private $notice_id;

    public function __construct()
    {
        $this->tables = new ArrayCollection();
        $this->notice_id = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, Table>
     */
    public function getTables(): Collection
    {
        return $this->tables;
    }

    public function addTable(Table $table): self
    {
        if (!$this->tables->contains($table)) {
            $this->tables[] = $table;
            $table->setWaiterId($this);
        }

        return $this;
    }

    public function removeTable(Table $table): self
    {
        if ($this->tables->removeElement($table)) {
            // set the owning side to null (unless already changed)
            if ($table->getWaiterId() === $this) {
                $table->setWaiterId(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Notice>
     */
    public function getNoticeId(): Collection
    {
        return $this->notice_id;
    }

    public function addNoticeId(Notice $noticeId): self
    {
        if (!$this->notice_id->contains($noticeId)) {
            $this->notice_id[] = $noticeId;
            $noticeId->setWaiter($this);
        }

        return $this;
    }

    public function removeNoticeId(Notice $noticeId): self
    {
        if ($this->notice_id->removeElement($noticeId)) {
            // set the owning side to null (unless already changed)
            if ($noticeId->getWaiter() === $this) {
                $noticeId->setWaiter(null);
            }
        }

        return $this;
    }
}
