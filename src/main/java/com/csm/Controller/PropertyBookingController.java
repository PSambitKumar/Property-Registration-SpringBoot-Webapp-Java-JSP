package com.csm.Controller;

import com.csm.Model.Property;
import com.csm.Model.PropertyRegistration;
import com.csm.Service.MainService;
import com.csm.Utils.CommonFileUpload;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class PropertyBookingController {

	@Autowired
	private MainService mainService;

	@GetMapping(value = "/propertyRegistration")
	public String propertyRegistration(Model model) {
		System.out.println("Inside Property Registration----------->");
		List<Property> propertyList = mainService.getAllProperty();
		List<PropertyRegistration> propertyRegistrationList = mainService.getAllPropertyRegistration();
		model.addAttribute("propertyList", propertyList);
		model.addAttribute("propertyRegistrationList", propertyRegistrationList);
		return "propertyRegistration";
	}

	@ResponseBody
	@GetMapping(value = "/getPropertyPrice")
	public String getPropertyPrice(Integer propertyId) {
		System.out.println("Inside getPropertyPrice----------->");
		Property property =  mainService.getPropertyByPropertyId(propertyId);
		return new JSONObject(property).toString();
	}

	@PostMapping(value = "/propertyRegistration")
	public String propertyRegistration(PropertyRegistration propertyRegistration, Property property,
	                                   @RequestParam(value = "idProof", required = false)MultipartFile idProof,
	                                   @RequestParam(value = "registrationId", required = false)String registrationId) throws IOException {
		System.out.println("Inside Save Property Registration----------->");
		PropertyRegistration saveProperyRegistration;
		System.out.println("Property Details : " + property);
		System.out.println("Property Registration Details : " + propertyRegistration);
		System.out.println("Id Proof : " + idProof );
		System.out.println("Property RegistrationId : " + registrationId);
		if (registrationId != null){
			String applicantIdUploadPath = CommonFileUpload.singleFileUplaod(idProof, "idProof");
			propertyRegistration.setPropertyRegistrationId(Integer.parseInt(registrationId));
			propertyRegistration.setProperty(property);
			propertyRegistration.setApplicantIdUploadPath(applicantIdUploadPath);
			saveProperyRegistration =  mainService.savePropertyRegistration(propertyRegistration);
		}else {
			String applicantIdUploadPath = CommonFileUpload.singleFileUplaod(idProof, "idProof");
			propertyRegistration.setProperty(property);
			propertyRegistration.setApplicantIdUploadPath(applicantIdUploadPath);
			propertyRegistration.setPropertyRegistrationId(Integer.parseInt(registrationId));
			saveProperyRegistration =  mainService.savePropertyRegistration(propertyRegistration);
		}
		if (saveProperyRegistration != null){
			System.out.println("Registration Successfully.");
		}
		return "redirect:/propertyRegistration";
	}

	@GetMapping(value = "/edit/{propertyRegistrationId}")
	public String editPropertyRegistration(Model model, @PathVariable(value = "propertyRegistrationId") Integer propertyRegistrationId) {
		System.out.println("Inside Edit Property Registration----------->");
		PropertyRegistration propertyRegistration = mainService.getPropertyRegistrationByPropertyRegistrationId(propertyRegistrationId);
		System.out.println("Property Registration Details : " + propertyRegistration);
		List<Property> propertyList = mainService.getAllProperty();
		List<PropertyRegistration> propertyRegistrationList = mainService.getAllPropertyRegistration();
		model.addAttribute("propertyList", propertyList);
		model.addAttribute("propertyRegistrationList", propertyRegistrationList);
		model.addAttribute("propertyRegistration", propertyRegistration);
		return "propertyRegistration";
	}

	@GetMapping(value = "/delete/{propertyRegistrationId}")
	public String deletePropertyRegistration(Model model, @PathVariable(value = "propertyRegistrationId") Integer propertyRegistrationId) {
		System.out.println("Inside Delete Property Registration----------->");
		mainService.deletePropertyRegistrationByPropertyRegistrationId(propertyRegistrationId);
		List<PropertyRegistration> propertyRegistrationList = mainService.getAllPropertyRegistration();
		model.addAttribute("propertyRegistrationList", propertyRegistrationList);
		return "propertyRegistration";
	}
}
