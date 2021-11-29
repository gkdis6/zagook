function numberFormatting(number){
    var inputNumber  = number < 0 ? false : number;
    var unitWords    = ['k', 'm', 'b'];
    var splitUnit    = 1000;
    var splitCount   = unitWords.length;
    var resultArray  = [];
    var resultString = '';
    var unitResult = null;
    var i = 0;
    
    if (inputNumber < splitUnit)
    	return inputNumber;

    for (; i < splitCount; i++){
        unitResult = inputNumber / Math.pow(splitUnit, i + 1);
        unitResult = unitResult.toFixed(1);
        if (unitResult < splitUnit){
            return unitResult + unitWords[i];
        }
    }
    return unitResult + unitWords[i];
}