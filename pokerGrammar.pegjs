{
    function getHandType(hand) {
    // Verifica se a mão é um flush (todas as cartas são do mesmo naipe)
    if (hand.every(card => card.suit === hand[0].suit)) {
    return "flush";
    }
    
    // Verifica se a mão é uma straight (os valores das cartas formam uma sequência)
    const values = hand.map(card => card.value);
    values.sort();
    if (values.every((value, index) => value === values[0] + index)) {
    return "straight";
    }
    
    // Se a mão não é nem um flush nem uma straight, então é uma mão comum
    return "common";
    }
}

Hand
= _ card:Card _ card:Card _ card:Card _ card:Card _ card:Card

Card
= value:CardValue suit:CardSuit

CardValue
= "2"
/ "3"
/ "4"
/ "5"
/ "6"
/ "7"
/ "8"
/ "9"
/ "10"
/ "J"
/ "Q"
/ "K"
/ "A"

CardSuit
= "c"
/ "d"
/ "h"
/ "s"

_ "whitespace"
= [ \t\n\r]*