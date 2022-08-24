package com.csm.Repository;

import com.csm.Model.PropertyRegistration;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PropertyRegistrationRepository extends JpaRepository<PropertyRegistration, Integer> {
	    PropertyRegistration getPropertyRegistrationByPropertyRegistrationId(Integer propertyRegistrationId);
	    void deletePropertyRegistrationByPropertyRegistrationId(Integer propertyRegistrationId);
}
