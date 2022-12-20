digit [0-9]*
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]*\.[0-9]*
signed  -{digit}*
signednum -{num}
op [\+\-\*\%\/]
%{
#include<stdio.h>
#include<string.h>
int cnt=0,i=0,j=0,q=0;
char st[10][10];
int look_up(char st[10][10],char *id,int n);
%}
%%
\\n
\ 
\" {q=q+1;}
-- {if((q%2)==0) fprintf(yyout,"\n%s ===>decrement\n",yytext);}
"++" {if((q%2)==0) fprintf(yyout,"\n%s ===> is the increment\n",yytext);}
dig |
decimal |
varchar |
flag |
bool |
if |
then |
upto |
otherif |
otherwise |
from |
\|  {if((q%2)==0)  fprintf(yyout," \n %s ===>keyword\n",yytext);}
"//" { if((q%2)==0) fprintf(yyout,"\n %s ===> comment line\n",yytext);}
"/*" {if((q%2)==0)  fprintf(yyout,"\n %s ===> multi line comment opened\n",yytext);}
"*/" {if((q%2)==0) fprintf(yyout,"\n %s ===>comment line opened\n",yytext);}
{signed} {if((q%2)==0) fprintf(yyout,"\n %s ===>signed digit",yytext);}
{num} {if((q%2)==0) fprintf(yyout,"\n %s ===>float",yytext);}
{digit} {if((q%2)==0) fprintf(yyout,"\n %s ===>digit",yytext);}
"=" {if((q%2)==0) fprintf(yyout,"\n%s ===> assignment operator\n",yytext);}
{id} {{if((q%2)==0){ fprintf(yyout,"\n %s ===>identifier",yytext);
if(!look_up(st,yytext,i)){
strcpy(st[i++],yytext);
cnt++;}}
}
}
"<=" |
"<" |
">" |
">=" |
"==" |
"!=" {if((q%2)==0) fprintf(yyout,"\n%s===> relational operator\n",yytext);}
{op} {if((q%2)==0) fprintf(yyout,"\n%s ===>arthematic operator\n",yytext);}
. {if((q%2)==0) fprintf(yyout,"\n %s===>delimiter",yytext);}
%%
main(int argc, char **argv) {
yyin=fopen(argv[1],"r"); // passing input file name as argv[1]
yyout=fopen(argv[2],"w");
yylex();
fprintf(yyout,"\n========================\n%d is the no of identifiers",cnt);
for( j=0;j<i;j++){
fprintf(yyout,"\n%s",st[j]); 
}
return 0;
}
int yywrap()
{
return 1;
}
int look_up(char st[10][10],char *id,int n)
{
for(j=0;j<n;j++)
if(!strcmp(st[j],id)){
return 1;}
return 0;
}