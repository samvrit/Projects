#include<stdio.h>

int main()
{
	
	int map[7] = {3,1,1,0,0,1,2};
	int pos[7] = {0};
	int mea[7] = {0};
	int n = 0;
	int pos_count=0;
	int i,j=0,k,found;
	
	printf("\nThis is a 1-D Localization Problem. The map is shown below. \nPlease input the sensor values (0s and/or 1s). \nOnce the robot figures out where it started, it will display the same. \n'3' is the starting point and '2' is the ending point.\n\nThis program is written by Samvrit Srinivas (samvrit.goku@gmail.com).\n");
	printf("\n===============================\n");
	printf("Map: ");
	for(i = 0; i<7; i++)
	printf("%d ",map[i]);
	printf("\n===============================\n");
	
	for(i=0;pos_count!=1;i++)
	{
		
		pos_count=0;
		printf("\n===============================\n");
		printf("Input Sensor value: ");
		scanf("%d",&mea[i]);
		printf("===============================\n");
		
		if(mea[0]==3)
		{
			pos[0] = 0;
			break;	
		}
		if(mea[0]==2)
		{
			pos[0] = 6;
			break;
		}
		
		for(j = 0; j <= 6-i; j++)
		{
			found = 1;
			
			for(k = 0; k <= i; k++)
			{
				if(mea[k] != map[j+k])
					found = 0;
			}
			
						
			if(found == 1)
			{
				pos[pos_count] = j;
				pos_count++;
			}
			else
			continue;
			
						
		}
		
		for(j = 7; j >= 0+i; j--)
		{
			found = 1;
			
			for(k = 0; k <= i; k++)
			{
				if(mea[k] != map[j-k])
					found = 0;
			}
			
						
			if(found == 1)
			{
				pos[pos_count] = j;
				pos_count++;
			}
			else
			continue;
			
						
		}
		
			
		printf("\n===============================\n");		
		printf("Comb. Count: %d\n",pos_count);
		
		for(k = 0; k<= 6; k++)
		printf("%d ",pos[k]);
		printf("\n===============================\n");
		
		
		
				
	}
	
	printf("\n===============================\n");
	printf("Final position: %d",pos[0]);
	printf("\n===============================\n");

	return(0);
}
