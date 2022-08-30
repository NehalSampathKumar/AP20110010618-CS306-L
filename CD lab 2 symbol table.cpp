#include<stdio.h>
#include<string.h>
int main()
{
	char str[100],ch;
	int i=0;
	printf("Enter Expression (terminated by $):");
	for(i=0;;i++) 
	{
		scanf("%c",&ch);
		if(ch=='$')
		break;
		str[i]=ch;
	}
	str[i]='\0';
	printf("Given Expression:%s\n",str);
	int l=strlen(str);
	i=0;
	static int j=0;
	printf("Lexxems\tAddress\tType\n");
	while(i<l)
	{
		int o=0;
	    for(j=i;str[j]!='+' && str[j]!='-' && str[j]!='*' && str[j]!='/' && str[j]!='=' && str[j]!='\0';j++)
		{
		   printf("%c",str[j]);
	}
	if((str[i]<=90 && str[i]>=65) || (str[i]<=122 && str[i]>=97))
	printf("\t%p\tIdentifier\n",&str[i]);
	else if(str[i]<=57 && str[i]>=48)
	{
		int z=0;
		for(int x=i+1;x<j;x++)
		{
			if(str[x]<=57 && str[x]>=48)
			continue;
			else
			z=-1;
		}
		if(z!=0)
		printf("\t%p\tInvalid Token\n",&str[i]);
		else
		printf("\t%p\tConstant\n",&str[i]);
	}
	if(str[j]=='+' || str[j]=='-' || str[j]=='*' || str[j]=='/' || str[j]=='=')
	{
		if(str[j]==' ' && str[j+1]==' ')
		{
			printf("%c%c\t%p\t'**' Operator\n",str[j],str[j+1],&str[j]);
			o=-1;
		}
		else
		printf("%c\t%p\tOperator\n",str[j],&str[j]);
	}
	if(o==0)
		i=j+1;
	else
		i=j+2;
  }
}
