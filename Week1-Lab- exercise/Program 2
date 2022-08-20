#include <stdio.h>
#include <stdlib.h>
int main() 
{
    int state=0,i;   
    char arr[50],input;
printf("Enter the string: ");
scanf("%s",&arr);

    for(i=0;arr[i]!='\0';i++)   //If arr[i] != '\0' enter the loop
	{
        switch(state)
        {
            case 0:
            if(arr[i]=='a')
            {  
                state=1;            
            }
            else if(arr[i]=='b')
            {
                state=3;
            }
            else
            {
                printf("Invalid input!!!");
                 exit(0);
            }
            break;
            case 1:
            if(arr[i]=='a')
            {
                state=2;
            }
            else if(arr[i]=='b')
            {
                state=3;
            }
            else
            {
                printf("Invalid input!!!");
                 exit(0);
            }
            break;
            case 2:
            if(arr[i]=='a')
            {
                state=2;
            }
            else if(arr[i]=='b')
            {
                state=3;
            }
            else
            {
                printf("Invalid input!!!");
                 exit(0);
            }
            break;
            case 3:
            if(arr[i]=='a')
            {
                state=1;
            }
            else if(arr[i]=='b')
            {
                state=4;
            }
            else
            {
                printf("Invalid input!!!");
                exit(0);
            }
            break;
            case 4:
            if(arr[i]=='a')
            {
                state=1;
            }
            else if(arr[i]=='b')
            {
                state=4;
            }
            else
            {
                printf("Invalid input!!!");
                exit(0);
            }
            break;
        }
    }
    if((state==2) || (state==4))
    {
        printf("String is valid");
    }
    else
    {
        printf("String is not valid");
    }
    
    return 0;
}
