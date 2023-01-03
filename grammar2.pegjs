Expression
  = head:Term tail:(_ ("+" / "-") _ Term)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
      }, head);
    }

Term
  = head:Factor tail:(_ ("*" / "/") _ Factor)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Power
  = _ base:Base "^" exponent:Factor { return Math.pow(base, exponent); }

Base
  = "(" _ expr:Expression _ ")" { return expr; }
  / Integer

Factor
  = "(" _ expr:Expression _ ")" { return expr; }
  / power:Power { return power; }
  / base:Base { return base; }

Integer "integer"
  = [0-9]+ { return parseInt(text(), 10); }

_ "whitespace"
  = [ \t\n\r]*