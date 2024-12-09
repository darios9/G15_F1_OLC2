Program = instructions*
instructions = _ reglas _
reglas = _ name _ "=" _ instanciaAgr+ _";"_
instanciaAgr "agrupada" =
"("_ instancia+ _")"
/ instancia
instancia  = (expresion unaria?)+ _  (_"/"_ (expresion unaria?)+ _)*
expresion = 
"("_ expresion+ _")"
/ _ literal _
/ _ encadenado _
/ _ rango _
/ _ name _ 



unaria =  _("*"/"+"/"?")_
literal = 
"\""c:[^\"]*"\""
/"'"c:[^\']*"'"{
  console.log(c.join(''))
}
rango = "[" [a-zA-Z0-9_]+("-"[a-zA-Z0-9_]+)* "]"//"[" _ (rangoContenido+ _ / _ encadenado+)+ _ "]" 
encadenado = /*"["_ */r:[0-9A-Za-z_]+/*_"]"*/{
  console.log(`ENCADENADO: ${r}`);
}
rangoContenido = 
_ i:[a-zA-Z_] _"-"_ f:[a-zA-Z_]_{ 
  console.log(`RI: ${i} RF: ${f}`)}
/_ i:[0-9_]_"-"_ f:[0-9_]_{
  console.log(`INICIO: ${i} FINAL: ${f}`);
  }
name "identificador"
 = [a-zA-Z_][a-zA-Z0-9_]*{ console.log(text())}



/*grammar
  = rule (_ rule)*

rule
  = name _ "=" _ choice _ ";"
  
choice
  = concatenation (_ "/" _ concatenation)*

concatenation
  = expression (_ expression)*

expression
  = parsingExpression [?+*]?

parsingExpression
  = name
  / string
  / range
  / group
  / zeroOrMore


    
range = "[" input_range+ "]"

input_range = [^[\]-] "-" [^[\]-]
			/ [^[\]]+

group
  = "(" _ choice _ ")"

zeroOrMore
  = string _ "*" { return { type: 'zeroOrMore', value: text() }; }


string
	= ["] [^"]* ["]
    / ['] [^']* [']

name "identificador"
  = [a-zA-Z_][a-zA-Z0-9_]*{return text()}/*[_a-z]i[_a-z0-9]i**/

_ "espacios en blanco"
  = [ \t\n\r\f]*

/*nl "nueva linea"
  = [ \t\n\r]**/