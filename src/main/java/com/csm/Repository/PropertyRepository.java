package com.csm.Repository;

import com.csm.Model.Property;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PropertyRepository extends JpaRepository<Property, Integer> {
	Property getPropertyByPropertyId(int propertyId);
}
