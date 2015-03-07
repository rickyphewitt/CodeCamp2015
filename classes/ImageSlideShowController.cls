public with sharing class ImageSlideShowController {

	//list that stores the images to show
	Public List<Image__c> images 	{get; set;}
	Public Integer imageCount 		{get; set;}

//https://developer.salesforce.com/forums/ForumsMain?id=906F00000008qukIAA

	//constructor
	public ImageSlideShowController()
	{
		images = getImages();
		imageCount = images.size() != null ? images.size() : 0;

	}


	//method that retreives images from database
	public static List<Image__c> getImages()
	{
		List<Image__c> imagesToReturn = new List<Image__c>();
		Try
		{
			imagesToReturn = [SELECT Id, Name, URL__c, Description__c, CreatedDate FROM Image__c ORDER BY CreatedDate ASC LIMIT 50];
		}Catch(Exception e)
		{
			//silently fail but show in debug logs
			System.debug('###Error getting images from DB: ' + e.getMessage());
		}

		return imagesToReturn;

	}
}
