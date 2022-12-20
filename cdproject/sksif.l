%{
#include "sksif.tab.h"
%}
digit [0-9]*
identifier [a-zA-Z][a-zA-Z0-9]*
string \"[a-zA-Z][a-zA-Z0-9]*\" 
number [0-9]*\.[0-9]*
operator [\+\-\*\/\%\=]
%%
dig|decimal|alpha|varchar|flag {printf("%s\t is a datatype\n",yytext);return dt;}
if {printf("%s\t is a if keyword\n",yytext); return con;}
then {printf("%s\t is a keywork next to if \n",yytext); return st;}
show {printf("%s\t is a print statement\n",yytext); return show;}
 {identifier} {printf("%s\t is a variable\n",yytext);return identifier;}
{digit} {yylval=atoi(yytext);printf("%d\t is a whole number\n",yylval);return digit;}
{number} {printf("%8.4f \t is a decimal number\n",(float)atof(yytext));return number;}
 {operator} {printf("%s\t is a operator\n",yytext);return operators;}
"<"|">"|"<="|">="|"=="|"!=" {printf("%s\t is the relation op\n",yytext);return relations;}
"[" {printf("%s\t is the open bracket\n",yytext);return ob;}
"]" {printf("%s\t is the close bracket\n",yytext);return cb;}
"(" {printf("%s\t is the open parenthesis\n",yytext);return op;}
")" {printf("%s\t is the closed parenthesis\n",yytext);return cp;}
"|" {printf("%s\t is the splitter\n",yytext);return split;}
{string} {printf("%s\t is the string\n",yytext);return string;}
"$" {printf("%s\t is a terminator\n",yytext);return tm;}
" " ;
\n return 0;
. return yytext[0];
%%