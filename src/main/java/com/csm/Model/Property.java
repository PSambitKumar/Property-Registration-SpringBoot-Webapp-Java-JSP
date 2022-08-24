package com.csm.Model;

import javax.persistence.*;

@Entity
@Table(name = "property")
public class Property {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int propertyId;
	private String propertyName;
	private String propertyType;
	private String housingProject;
	private Double propertyPrice;

	public int getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getHousingProject() {
		return housingProject;
	}

	public void setHousingProject(String housingProject) {
		this.housingProject = housingProject;
	}

	public Double getPropertyPrice() {
		return propertyPrice;
	}

	public void setPropertyPrice(Double propertyPrice) {
		this.propertyPrice = propertyPrice;
	}

	@Override
	public String toString() {
		return "Property{" +
			   "propertyId=" + propertyId +
			   ", propertyName='" + propertyName + '\'' +
			   ", propertyType='" + propertyType + '\'' +
			   ", housingProject='" + housingProject + '\'' +
			   ", propertyPrice=" + propertyPrice +
			   '}';
	}
}
