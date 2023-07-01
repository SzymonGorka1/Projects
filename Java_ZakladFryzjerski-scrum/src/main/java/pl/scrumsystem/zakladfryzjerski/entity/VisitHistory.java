package pl.scrumsystem.zakladfryzjerski.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
@Table(name="visit_history")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitHistory
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long visit_id;

    private Long customer_id;

    private Long employee_id;

    private String customer_name;

    private String customer_surname;

    private String gender;

    private Date date;

    private Time hour;

    private String service;

    private Boolean presence;

    private String additional_info;

}
