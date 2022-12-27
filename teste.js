const PEG = require("pegjs");
const readline = require("readline");

const fs = require("fs");

const grammar = fs.readFileSync("grammar.pegjs", "utf8");

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