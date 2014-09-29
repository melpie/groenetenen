package be.vdab.valueobjects;

import javax.validation.constraints.NotNull;

import be.vdab.constraints.Postcode;

public class PostcodeReeks {
	@NotNull @Postcode
	private int vanpostcode;
	@NotNull @Postcode
	private int totpostcode;

	public int getVanpostcode() {
		return vanpostcode;
	}

	public void setVanpostcode(int vanpostcode) {
		this.vanpostcode = vanpostcode;
	}

	public int getTotpostcode() {
		return totpostcode;
	}

	public void setTotpostcode(int totpostcode) {
		this.totpostcode = totpostcode;
	}

	public boolean bevat(int postcode) {
		return postcode >= vanpostcode && postcode <= totpostcode;
	}

}