package pl.scrumsystem.zakladfryzjerski.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.scrumsystem.zakladfryzjerski.entity.Equipment;
import pl.scrumsystem.zakladfryzjerski.entity.Report;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long>
{

}
