package pl.scrumsystem.zakladfryzjerski.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
@Table(name="grafik_wizyt")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Booking
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String data_wizyty;
    private String czas_wizyty;
    private String Imie;
    private String nazwisko;
    private String plec;
    private Long  nr_tel;
    private String rodzaj_wizyty;
    private String uwagi;

}