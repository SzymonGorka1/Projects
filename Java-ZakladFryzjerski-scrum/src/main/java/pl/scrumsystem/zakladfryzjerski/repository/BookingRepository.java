package pl.scrumsystem.zakladfryzjerski.repository;

import pl.scrumsystem.zakladfryzjerski.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface BookingRepository extends JpaRepository<Booking, Long>
{


}