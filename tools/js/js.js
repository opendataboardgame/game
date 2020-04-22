function removeCard() {
	card = event.srcElement.parentElement.parentElement;
	card.querySelector("#cardImage").setAttribute('src','../components/Card_Backgrounds/ToolRecipe_Back.png');
}
function addCard() {
	var cardNumber = window.prompt("Please enter tool card number", "");
	if (cardNumber == null || cardNumber == "") {
	} else {
		cardNumber = cardNumber - 14;
		if (cardNumber < 0 || cardNumber > 62) {
			card.querySelector("#cardImage").setAttribute('src','../components/Card_Backgrounds/ToolRecipe_Back.png');
		} else {
			cardNumber = pad(cardNumber,2);
			card = event.srcElement.parentElement.parentElement;
			card.querySelector("#cardImage").setAttribute('src',"../_output/tool_"+cardNumber+".png");
		}
	}
}

function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}