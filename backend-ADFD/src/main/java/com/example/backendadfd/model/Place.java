package com.example.backendadfd.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "place")
public class Place {
    @Id
    private long id;

    @Column(name = "place_name")
    private String placeName;
    @Column(name = "address")
    private String address;
    @Column(name = "img")
    private String img;
}
