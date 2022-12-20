%{
#include "sksinit.tab.h"
%}
digit [0-9]*
identifier [a-zA-Z][a-zA-Z0-9]*
string [\"][a-zA-Z][a-zA-Z0-9]*[\"]
number [0-9]*\.[0-9]*
%%
dig|decimal|alpha|varchar|flag {printf("%s\t is a datatype\n",yytext);return dt;}
 {identifier} {printf("%s\t is a variable\n",yytext);return identifier;}
"=" {printf("%s\t is a assignment operator\n",yytext);return op;}
{digit} {yylval=atoi(yytext);printf("%d\t is a whole number\n",yylval);return digit;}
{number} {printf("%8.4f \t is a decimal number\n",(float)atof(yytext));return number;}
{string} {printf("%s\t is the string\n",yytext);return string;}
"$" {printf("%s\t is a terminator\n",yytext);return tm;}
" " ;
\n return 0;
. return yytext[0];
%%