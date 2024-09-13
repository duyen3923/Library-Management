$(function() {

	function findMaxAndMinCategory(data) {
		var maxCategory = "";
		var minCategory = "";
		var maxAmount = 0;
		var minAmount = Infinity;

		for (var i = 0; i < data.length; i++) {
			var amount = data[i].amount;
			if (amount > maxAmount) {
				maxAmount = amount;
				maxCategory = data[i].categoryName;
			}
			if (amount < minAmount) {
				minAmount = amount;
				minCategory = data[i].categoryName;
			}
		}

		return {
			maxCategory : maxCategory,
			minCategory : minCategory,
			maxAmount   : maxAmount,
			minAmount   : minAmount
		};
	}
})
