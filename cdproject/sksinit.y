%{
#include<stdio.h>
%}
%token number digit identifier dt op tm string
%%
D: T A Y tm{ printf("Valid initialisation\n");};
T: dt| ;
A: identifier;
Y: op L;
L: number|digit|identifier|string;
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