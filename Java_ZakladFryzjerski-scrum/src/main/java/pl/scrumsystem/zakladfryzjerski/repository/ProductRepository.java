package pl.scrumsystem.zakladfryzjerski.repository;

import pl.scrumsystem.zakladfryzjerski.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>
{

}
