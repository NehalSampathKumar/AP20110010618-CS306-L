%{
#include<stdio.h>
%}
%token number digit identifier dt op tm operators
%%
S: E { printf("Valid Expression\n");};
E: T identifier D tm;
T: dt| ;
D: op L| ;
C: operators L| ;
L: Y C | ;
Y: identifier | digit | number;
%%
int main(){
yyparse();
}
int yywrap(){
return 1;
}
void yyerror(char *s){
printf("\nError %s",s);
}