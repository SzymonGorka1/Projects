package pl.scrumsystem.zakladfryzjerski.repository;

import pl.scrumsystem.zakladfryzjerski.entity.Availability;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AvailabilityRepository extends JpaRepository<Availability, Long>
{

}