%{
int yychars=1;
%}
%option yylineno

INT8 0([0-7]+)
INT16 0[xX]([0-9|A-F|a-f]+)
INT8_ERROR 0([0-9|a-wyz|A-WYZ][0-9|A-Z|a-z]*)
INT16_ERROR 0[xX]([0-9|A-Z|a-z]+)
%%
" " {yychars+=1;}
\t {yychars+=4;}
\n {yychars=1;}
{INT8} {printf("INT8 at line %d,char %d:%s\n",yylineno,yychars,yytext);yychars+=yyleng;}
{INT16} {printf("INT16 at line %d,char %d:%s\n",yylineno,yychars,yytext);yychars+=yyleng;}
{INT8_ERROR} {printf("Error type A at line %d,char %d:Illegal octal number '%s'\n",yylineno,yychars,yytext);yychars+=yyleng;}
{INT16_ERROR} {printf("Error type A at line %d,char %d:Illegal hexadecimal number '%s'\n",yylineno,yychars,yytext);yychars+=yyleng;}
%%
int main(int argc,char**argv){
	if(argc>1){
		if(!(yyin=fopen(argv[1],"r"))){
			perror(argv[1]);
			return 1;
		}
	}
        while(yylex()!=0);
	return 0;
}
