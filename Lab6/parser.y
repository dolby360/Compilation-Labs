
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <ctype.h>
    void yyerror(const char *c);

    #define YYSTRPE struct node*
%}


%token BRA_O BRA_C
%token KEY_IF,KEY_ELSE
%token SEMICOLON
%token PARAN_O PARAN_C
%token IDENTIFIER
%token EQ
%token ASSIGN

%%
S:      KEY_IF PARAN_O EXPR PARAN_C |KEY_IF PARAN_O EXPR PARAN_C BRA_O BLOCK BRA_C KEY_ELSE BRA_O BLOCK BRA_C;
EXPR:   IDENTIFIER EQ IDENTIFIER {printf(" %s == %s ",yytext,yytext);};
BLOCK:;
%%


#include "lex.yy.c"
main(){

    //BRA_O BLOCK BRA_C

    return yyparse();
}

void yyerror(const char *c){
	fprintf(stderr,"line %d: %s\n",yylineno - 1,c);
	
}


