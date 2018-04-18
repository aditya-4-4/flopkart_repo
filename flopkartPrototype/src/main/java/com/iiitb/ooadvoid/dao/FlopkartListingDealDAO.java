
package com.iiitb.ooadvoid.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.iiitb.ooadvoid.pojo.FlopkartListingDeal;

public class FlopkartListingDealDAO extends HibernateDAO<FlopkartListingDeal>
{
	String entity_name = "FlopkartListingDeal";
	
	public FlopkartListingDeal addFlopkartListingDeal(FlopkartListingDeal item)
	{
		super.add(item);
		return item;
	}
	
	public List<FlopkartListingDeal> getTodayFlopkartListingDeals() throws ParseException
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String todaydate = dateFormat.format(date);
		date = dateFormat.parse(todaydate);
		Date endDate, startDate;
		List<FlopkartListingDeal> deals = super.list(new FlopkartListingDeal());
		List<FlopkartListingDeal> todayDeals = new ArrayList<FlopkartListingDeal>();
		for(FlopkartListingDeal deal : deals) {
			endDate = dateFormat.parse(deal.getEnddate());
			startDate = dateFormat.parse(deal.getStartdate());
			if(endDate.before(date)) {
				super.remove(entity_name,deal.getId());
			}
			else if(startDate.after(date)) {
				//System.out.println(startDate+" "+endDate);
			}
			else {
				todayDeals.add(deal);
			}
		}
		return todayDeals;
	}
	
	public List<FlopkartListingDeal> getFlopkartListingDealsByListingId(int listingId)
	{
		List<FlopkartListingDeal> listingdeals =  super.findAll(entity_name, "listingid", listingId);
		return listingdeals;
	}
	
	public List<FlopkartListingDeal> getFlopkartListingDealsByComboId(String comboId)
	{
		List<FlopkartListingDeal> listingdeals =  super.findAll(entity_name, "comboid", comboId);
		return listingdeals;
	}
	
	public List<FlopkartListingDeal> getFlopkartListingDealsByDealId(int dealId)
	{
		List<FlopkartListingDeal> listingdeals =  super.findAll(entity_name, "dealid", dealId);
		return listingdeals;
	}
	
	public List<FlopkartListingDeal> getFlopkartListingDeals()
	{
		return super.list(new FlopkartListingDeal());
	}

	public FlopkartListingDeal getFlopkartListingDealById(int id)
	{
		return super.find(new FlopkartListingDeal(),id);
	}

  /*  public List<FlopkartListingDeal> getFlopkartListingDealByCategoty(FlopkartListingDeal item)
	{
		return super.findAll(entity_name,"category", item.getSubcategoryId());
	}
  */
	public int deleteFlopkartListingDeal(int id)
	{
		return super.remove(entity_name,id);
	}

	public int updateFlopkartListingDeal(int id, FlopkartListingDeal item)
	{
		if (id <= 0)
			return 0;	
		super.update(item,id);
		return 1;
	}
}
