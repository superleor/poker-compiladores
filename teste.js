const PEG = require("pegjs");
const readline = require("readline");

const fs = require("fs");

const grammar = fs.readFileSync("grammar2.pegjs", "utf8"); // mudar aqui para compilar gramáticas diferentes

const parser = PEG.generate(grammar);

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("Digite a expressão aritmética: ", (input) => {
    const ast = parser.parse(input);

    console.log(ast);

    rl.close();
});