grammar
  = rule+ _

rule
  = _ identifier _ string? _ "=" _ choice (_ ";")?
  
choice
  = concatenation (_ "/" _ concatenation)*

concatenation
  = pluck (_ pluck !(_ string? _ "="))*

pluck
  = "@"? _ label

label
  = (identifier _ ":")? _ expression

expression
  = "$"? _ parsingExpression _ quantifier?

quantifier
  = [?+*]
  / "|" _ (number / identifier) _ "|"
  / "|" _ (number / identifier)? _ ".." _ (number / identifier)? _ "|"
  / "|" _ (number / identifier)? _ "," _ choice _ "|"
  / "|" _ (number / identifier)? _ ".." _ (number / identifier)? _ "," _ choice _ "|"

parsingExpression
  = identifier
  / string "i"?
  / range "i"?
  / group
  / anyChar
  / endOfInput
  / positiveAssertion 
  / negativeAssertion 

group
  = "(" _ choice _ ")"
  
anyChar 
	= "." {return {type: "anyChar", value: text() } ;
    }

endOfInput 
  = "!." {
      return { type: "endOfInput" };
    }

positiveAssertion 
  = "&" _ expr:expression { return { type: "positiveAssertion", expression: expr }; }

negativeAssertion 
  = "!" _ expr:expression { return { type: "negativeAssertion", expression: expr }; }

string
	= ["] [^"]* ["]
    / ['] [^']* [']
    
range = "[" input_range+ "]"

input_range = [^[\]-] "-" [^[\]-]
			/ [^[\]]+

identifier "identificador"
  = [_a-z]i[_a-z0-9]i*

_ "Espacios en blanco"
  = [ \t\n\r]*

number
  = [0-9]+

// Program = instructions*

// instructions = _ reglas _

// reglas = _ name _ "=" _ instanciaAgr+ _";"?_

// instanciaAgr "agrupada" =
//   "("_ instancia+ _")"
//   / instancia

// instancia  = (expresion unaria?)+ _  (_"/"_ (expresion unaria?)+ _)*

// expresion = 
//   "("_ expresion+ _")"
//   / _ literal _
//   / _ encadenado _
//   / _ rango _
//   / _ name _ 

//   unaria =  _("*"/"+"/"?")_

// literal = 
//   "\""c:[^\"]*"\""
//   /"'"c:[^\']*"'"{
//     console.log(c.join(''))
//   }

// rango = "[" [a-zA-Z0-9_]+("-"[a-zA-Z0-9_]+)* "]"//"[" _ (rangoContenido+ _ / _ encadenado+)+ _ "]" 

// encadenado = /*"["_ */r:[0-9A-Za-z_]+/*_"]"*/{
//   console.log(`ENCADENADO: ${r}`);
// }

// rangoContenido = 
//   _ i:[a-zA-Z_] _"-"_ f:[a-zA-Z_]_{ 
//     console.log(`RI: ${i} RF: ${f}`)}
//   /_ i:[0-9_]_"-"_ f:[0-9_]_{
//     console.log(`INICIO: ${i} FINAL: ${f}`);
//   }

// name "identificador"= 
//   [a-zA-Z_][a-zA-Z0-9_]*{
//     console.log(text())
//   }

// _ "espacios en blanco"= 
//   [ \t\n\r\f]*
