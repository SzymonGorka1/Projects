package pl.scrumsystem.zakladfryzjerski.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Time;

@Entity
@Table(name="availability")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Availability
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String date;

    private String fullname;

    private String starthour_h_m;

    private String endhour_h_m;

    private String workinghour;

}