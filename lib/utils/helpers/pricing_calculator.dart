class PricingCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }


  static String calculateTax(double subTotal, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static String calculateShippingCost(double subTotal,String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    if (location == 'Ghana') {
      return 0.00;
    } else if (location == 'USA') {
      return 0.15;
    } else if (location == 'UK') {
      return 0.20;
    } else {
      return 0.10;
    }
  }

  static double getShippingCost(String location) {
    if (location == 'Ghana') {
      return 0.00;
    } else if (location == 'USA') {
      return 20.0;
    } else if (location == 'UK') {
      return 15.0;
    } else {
      return 25.0;
    }
  }
}
