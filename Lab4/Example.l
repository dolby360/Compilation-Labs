
%%
[0-9] {yylval = atoi(yytext);
return NUM;
}

.		return yytext[0];
%%

