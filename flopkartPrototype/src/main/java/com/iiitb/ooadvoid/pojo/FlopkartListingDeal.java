package com.iiitb.ooadvoid.pojo;

public class FlopkartListingDeal
{
	private Integer id;
	private Integer listingid;
	private Integer dealid;
	private String startdate;
	private String enddate;
	private String comboid;
	private String comboDesc;

	public void setComboDesc(String comboDesc)
	{
		this.comboDesc = comboDesc;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getComboid()
	{
		return comboid;
	}
	
	public void setComboid(String comboid)
	{
		this.comboid = comboid;
	}
	
	public String getComboDesc()
	{
		return comboDesc;
	}
	
	public Integer getListingid()
	{
		return listingid;
	}

	public void setListingid(Integer listingid)
	{
		this.listingid = listingid;
	}

	public Integer getDealid()
	{
		return dealid;
	}

	public void setDealid(Integer dealid)
	{
		this.dealid = dealid;
	}

	public String getStartdate()
	{
		return startdate;
	}

	public void setStartdate(String startdate)
	{
		this.startdate = startdate;
	}

	public String getEnddate()
	{
		return enddate;
	}

	public void setEnddate(String enddate)
	{
		this.enddate = enddate;
	}
}
