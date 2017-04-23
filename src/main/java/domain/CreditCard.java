package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Embeddable;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.CreditCardNumber;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;


@Embeddable
@Access(AccessType.PROPERTY)
public class CreditCard{

	// Constructors -----------------------------------------------------------

	// Attributes -------------------------------------------------------------
	private String holderName;
	private String brandName;
	private String number;
	private Integer expirationMonth;
	private Integer expirationYear;
	private Integer cvvCode;
	
	@NotBlank
	@NotNull
	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	
	@NotBlank
	@NotNull
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
	@NotBlank
	@CreditCardNumber
	@NotNull
	@Valid
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
	@Range(min = 1, max = 12)
	public Integer getExpirationMonth() {
		return expirationMonth;
	}
	public void setExpirationMonth(Integer expirationMonth) {
		this.expirationMonth = expirationMonth;
	}

	@Range(min = 2017, max = 3000)
	public Integer getExpirationYear() {
		return expirationYear;
	}
	public void setExpirationYear(Integer expirationYear) {
		this.expirationYear = expirationYear;
	}
	
	@Range(min = 0, max = 999)
	public Integer getCvvCode() {
		return cvvCode;
	}
	public void setCvvCode(Integer cvvCode) {
		this.cvvCode = cvvCode;
	}

	// Relationships ----------------------------------------------------------

}
