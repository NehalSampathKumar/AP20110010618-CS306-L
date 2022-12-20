%{
#include<stdio.h>
%}
%token number digit identifier dt assign operators con show relations ob cb op cp tm string split
%%
C: S { printf("Valid condition\n"); return 0;}
S: con ob Dec tm E tm P tm cb  Y;
Dec: T identifier J;
J: assign O;
E: identifier relations O
P: identifier assign identifier operators O
O: identifier| number | digit;
T: dt| ;
B: relations|operators;
Y: show op U cp tm | Expression;
Expression: T O D
D: B L | ;
L: O D | ;
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