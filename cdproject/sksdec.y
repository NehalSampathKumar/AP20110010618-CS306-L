%{
#include<stdio.h>
%}
%token dt id cm tm 
%%
D: T V tm{ printf("Valid declaration\n");};
T: dt;
V: id A;
A: cm V| ;
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