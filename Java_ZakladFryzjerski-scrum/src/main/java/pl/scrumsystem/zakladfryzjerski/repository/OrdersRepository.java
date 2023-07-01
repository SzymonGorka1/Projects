package pl.scrumsystem.zakladfryzjerski.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.scrumsystem.zakladfryzjerski.entity.Equipment;
import pl.scrumsystem.zakladfryzjerski.entity.Orders;

import java.util.List;

@Repository
public interface OrdersRepository extends JpaRepository<Orders, Long>
{

}


