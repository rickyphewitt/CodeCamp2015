@isTest
private class ImageSlideShowControllerTest
{
	@isTest
	static void testRetrievalOfImages()
	{
		//instantinate controller
		ImageSlideShowController slideShowCon = new ImageSlideShowController();
		List<Image__c> imagesToInsert = new List<Image__c>();

		//testing method does not fail when no images are in the db
		//List<Image__c> imagesToRetrieve = ImageSlideShowController.getImages();

		//Assert an empty list
		System.assertEquals(new List<Image__c>(), slideShowCon.images);
		//Assert size as 0
		System.assertEquals(0, slideShowCon.imageCount);

		//Now add some data
		Integer imagesToCreate = 60;
		For(Integer i = 0; i < imagesToCreate; i++)
		{
			imagesToInsert.add(new image__c(name = 'image'+ i, URL__c = 'http://www.fakeurl.com/' + i, Description__c = 'This image ' + i + 'is amazing!.'));
		}
		//Bulk insert the images
		insert imagesToInsert;

		//Instantiate a second controller now that we have data
		ImageSlideShowController slideShowCon2 = new ImageSlideShowController();

		//verify 50 images are picked up
		System.assertEquals(50, slideShowCon2.imageCount);

	}
}
