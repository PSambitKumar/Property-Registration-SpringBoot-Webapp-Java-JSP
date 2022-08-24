package com.csm.Model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "property_registration")
public class PropertyRegistration {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int propertyRegistrationId;
	private String applicantName;
	private String applicantEmail;
	private String applicantPhone;
	private Date applicantDOB;
	private String applicantGender;
	private String applicantIdUploadPath;
	private String propertyType;
	@ManyToOne
	@JoinColumn(name = "property_id")
	private Property property;



	public int getPropertyRegistrationId() {
		return propertyRegistrationId;
	}

	public void setPropertyRegistrationId(int propertyRegistrationId) {
		this.propertyRegistrationId = propertyRegistrationId;
	}

	public String getApplicantName() {
		return applicantName;
	}

	public void setApplicantName(String applicantName) {
		this.applicantName = applicantName;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getApplicantEmail() {
		return applicantEmail;
	}

	public void setApplicantEmail(String applicantEmail) {
		this.applicantEmail = applicantEmail;
	}

	public String getApplicantPhone() {
		return applicantPhone;
	}

	public void setApplicantPhone(String applicantPhone) {
		this.applicantPhone = applicantPhone;
	}

	public Date getApplicantDOB() {
		return applicantDOB;
	}

	public void setApplicantDOB(Date applicantDOB) {
		this.applicantDOB = applicantDOB;
	}

	public String getApplicantGender() {
		return applicantGender;
	}

	public void setApplicantGender(String applicantGender) {
		this.applicantGender = applicantGender;
	}

	public String getApplicantIdUploadPath() {
		return applicantIdUploadPath;
	}

	public void setApplicantIdUploadPath(String applicantIdUploadPath) {
		this.applicantIdUploadPath = applicantIdUploadPath;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	@Override
	public String toString() {
		return "PropertyRegistration{" +
			   "propertyRegistrationId=" + propertyRegistrationId +
			   ", applicantName='" + applicantName + '\'' +
			   ", applicantEmail='" + applicantEmail + '\'' +
			   ", applicantPhone='" + applicantPhone + '\'' +
			   ", applicantDOB=" + applicantDOB +
			   ", applicantGender='" + applicantGender + '\'' +
			   ", applicantIdUploadPath='" + applicantIdUploadPath + '\'' +
			   ", property=" + property +
			   '}';
	}
}
