%token NUM
%left '+' '-'
%left '*' '/'
%%
s: 		expr {printf("The result is %d\n",$1);}
expr: 		expr '+' expr {$$ = $1 + $3;}|
		expr '-' expr {$$ = $1 - $3;}|
		expr '*' expr {$$ = $1 * $3;}|
		expr '/' expr {$$ = $1 / $3;}|
		NUM   {$$=$1;};
%%

#include "lex.yy.c"
main()	{return yyparse();}
int yyparse();
int yyerror(){
	printf ("Error in expression\n");
	return 0;
}
