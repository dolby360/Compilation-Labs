%{
#include <stdlib.h>
#include <string.h>
void yyerror(const char *);
%}
%%
if              {return KEY_IF;}
else            {return KEY_ELSE;}
\{              {return BRA_O;}
\}              {return BRA_C;}
\(              {return PARAN_O;}
\)              {return PARAN_C;}
\;              {return SEMICOLON;}
\=              {return ASSIGN;}
\=\=            {return EQ;}
0|[1-9][0-9]*	{return INT;}
[a-zA-Z][a-zA-Z0-9_]*			{return IDENTIFIER;}
.				{return yytext[0];}
.|\n
%%