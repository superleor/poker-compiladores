const PEG = require("pegjs");
const readline = require("readline");

const fs = require("fs");

const grammar = fs.readFileSync("grammar2.pegjs", "utf8"); // mudar aqui para compilar gramáticas diferentes

const parser = PEG.generate(grammar);

/* const hand = [
    { value: "2", suit: "c" },
    { value: "5", suit: "c" },
    { value: "6", suit: "c" },
    { value: "10", suit: "c" },
    { value: "K", suit: "c" }
];

console.log(parser.parse(hand)) */

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("Digite a expressão aritmética: ", (input) => {
    const ast = parser.parse(input);

    console.log(ast);

    rl.close();
});