%{
#include "sksexp.tab.h"
%}
digit [0-9]*
identifier [a-zA-Z][a-zA-Z0-9]*
number [0-9]*\.[0-9]*
operator [+\-\*\/\%]
%%
dig|decimal|alpha|varchar|flag {printf("%s\t is a datatype\n",yytext);return dt;}
"=" {printf("%s\t is a Assignment operator\n",yytext);return op;}
 {operator} {printf("%s\t is a  operator\n",yytext);return operators;}
 {identifier} {printf("%s\t is a variable\n",yytext);return identifier;}
{digit} {yylval=atoi(yytext);printf("%d\t is a whole number\n",yylval);return digit;}
{number} {printf("%8.4f \t is a decimal number\n",(float)atof(yytext));return number;}
"$" {printf("%s\t is a terminator\n",yytext);return tm;}
" " ;
\n return 0;
. return yytext[0];
%%