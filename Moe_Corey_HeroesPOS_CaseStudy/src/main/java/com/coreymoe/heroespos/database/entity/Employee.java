package com.coreymoe.heroespos.database.entity;

import lombok.*;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "employees")
public class Employee {

    @Id
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Integer id;

    @Column(
            name = "first_name",
            nullable = false,
            length = 30
    )
    private String firstName;

    @Column(
            name = "last_name",
            nullable = false,
            length = 30
    )
    private String lastName;

    @Column(
            nullable = false,
            length = 30
    )
    private String email;

    @Column(name = "phone_number",
    nullable = false)
    private Integer phoneNumber;

    @Column(length = 30)
    private String address1;

    @Column(length = 30)
    private String address2;

    @Column(length = 50)
    private String city;

    @Column(length = 15)
    private String state;

    @Column(name = "zip_code", length = 5)
    private Integer zipCode;

    @Column(name="active", columnDefinition = "BIT")
    private Integer active;

    @ManyToOne
    @JoinColumn(
            name = "reports_to",
            nullable = false
    )
    private Employee reportsTo;

    @Column(length = 20)
    private String password;

    @Temporal(TemporalType.TIMESTAMP)
    private Date created;

    @Temporal(TemporalType.TIMESTAMP)
    private Date updated;
}
