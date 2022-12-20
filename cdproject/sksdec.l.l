%{
#include "parser.tab.h"
%}
%%
dig|decimal|alpha|varchar|flag {printf("%s\t is a datatype\n",yytext);return dt;}
[a-zA-Z]+[a-zA-Z0-9]* {printf("%s\t is a variable\n",yytext);return id;}
"," {printf("%s\t is a comma\n",yytext);return cm;}
"$" {printf("%s\t is a terminator\n",yytext);return tm;}
\  ;
\n return 0;
. return yytext[0];
%%