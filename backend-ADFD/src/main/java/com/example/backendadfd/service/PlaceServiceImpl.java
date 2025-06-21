package com.example.backendadfd.service;

import com.example.backendadfd.model.Place;
import com.example.backendadfd.repository.PlaceRepository;
import com.example.backendadfd.service.placeService.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceServiceImpl implements PlaceService {
    @Autowired
    private PlaceRepository placeRepository;

    @Override
    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }
}
