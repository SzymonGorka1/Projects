package pl.scrumsystem.zakladfryzjerski.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Time;

@Entity
@Table(name="schedule")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String date;

    private String fullname;

    private String workinghours;
}
