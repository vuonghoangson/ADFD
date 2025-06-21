package com.example.backendadfd.service.placeService;

import com.example.backendadfd.model.Place;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface PlaceService {
    List<Place> getAllPlaces();
}
