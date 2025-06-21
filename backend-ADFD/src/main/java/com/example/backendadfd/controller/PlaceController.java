package com.example.backendadfd.controller;


import com.example.backendadfd.service.PlaceServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api")
@RestController
public class PlaceController {
    @Autowired
    private PlaceServiceImpl placeService;

    @GetMapping("/getAllPlace")
    public ResponseEntity<?> getAllPlace() {
        return ResponseEntity.ok(placeService.getAllPlaces());
    }
}
