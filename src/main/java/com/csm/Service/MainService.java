package com.csm.Service;

import com.csm.Model.Property;
import com.csm.Model.PropertyRegistration;

import java.util.List;

public interface MainService {
	List<Property> getAllProperty();
	List<PropertyRegistration> getAllPropertyRegistration();
	Property getPropertyByPropertyId(Integer propertyId);
	PropertyRegistration savePropertyRegistration(PropertyRegistration propertyRegistration);
	PropertyRegistration getPropertyRegistrationByPropertyRegistrationId(Integer propertyRegistrationId);
	void deletePropertyRegistrationByPropertyRegistrationId(Integer propertyRegistrationId);
}
