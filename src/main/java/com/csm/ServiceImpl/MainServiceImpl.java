package com.csm.ServiceImpl;

import com.csm.Model.Property;
import com.csm.Model.PropertyRegistration;
import com.csm.Repository.PropertyRegistrationRepository;
import com.csm.Repository.PropertyRepository;
import com.csm.Service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private PropertyRepository propertyRepository;
	@Autowired
	private PropertyRegistrationRepository propertyRegistrationRepository;

	@Override
	public List<Property> getAllProperty() {
		return propertyRepository.findAll();
	}

	@Override
	public List<PropertyRegistration> getAllPropertyRegistration() {
		return propertyRegistrationRepository.findAll();
	}

	@Override
	public Property getPropertyByPropertyId(Integer propertyId) {
		return propertyRepository.getPropertyByPropertyId(propertyId);
	}

	@Override
	public PropertyRegistration savePropertyRegistration(PropertyRegistration propertyRegistration) {
		return propertyRegistrationRepository.save(propertyRegistration);
	}

	@Override
	public PropertyRegistration getPropertyRegistrationByPropertyRegistrationId(Integer propertyRegistrationId) {
		return propertyRegistrationRepository.getPropertyRegistrationByPropertyRegistrationId(propertyRegistrationId);
	}

	@Override
	public void deletePropertyRegistrationByPropertyRegistrationId(Integer propertyRegistrationId) {
		PropertyRegistration propertyRegistration = propertyRegistrationRepository.getPropertyRegistrationByPropertyRegistrationId(propertyRegistrationId);
		propertyRegistrationRepository.delete(propertyRegistration);
	}
}
