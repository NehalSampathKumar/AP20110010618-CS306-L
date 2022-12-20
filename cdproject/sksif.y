%{
#include<stdio.h>
%}
%token number digit identifier dt  operators con st show relations ob cb op cp tm string split
%%
C: S { printf("Valid condition\n"); return 0;}
S: con ob E cb st Y;
E: T O D
O: identifier| number | digit;
T: dt| ;
D:B L| ;
B: relations|operators;
L: O D| ;
Y: show op U cp tm | E;
U: string|O K| ;
K: split U | U;
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