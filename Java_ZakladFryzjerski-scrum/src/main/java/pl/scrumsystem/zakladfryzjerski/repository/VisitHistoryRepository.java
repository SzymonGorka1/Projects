package pl.scrumsystem.zakladfryzjerski.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.scrumsystem.zakladfryzjerski.entity.VisitHistory;

import java.util.List;

@Repository
public interface VisitHistoryRepository extends JpaRepository<VisitHistory, Long>
{
    @Query(value = "select * from visit_history v where v.visit_id like %:keyword1% AND "
            + "v.customer_id like %:keyword2% AND v.employee_id like %:keyword3% AND "
            + "v.customer_name like %:keyword4% AND v.customer_surname like %:keyword5% AND "
            + "v.gender like %:keyword6% AND v.date like %:keyword7% AND "
            + "v.hour like %:keyword8% AND v.service like %:keyword9% AND "
            + "v.presence like %:keyword10%", nativeQuery = true)
    List<VisitHistory> findByKeywords(@Param("keyword1") String keyword1, @Param("keyword2") String keyword2,
                                      @Param("keyword3") String keyword3, @Param("keyword4") String keyword4,
                                      @Param("keyword5") String keyword5, @Param("keyword6") String keyword6,
                                      @Param("keyword7") String keyword7, @Param("keyword8") String keyword8,
                                      @Param("keyword9") String keyword9, @Param("keyword10") String keyword10);
}
