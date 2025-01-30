class PricingCalculator {
  static double calculateToatlPrice(double PruductPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = PruductPrice * taxRate;

    double shippingCost = getShippingCost(location);
    double totalPrice = PruductPrice + taxAmount + shippingCost;
    return totalPrice;
  }


  static String calculateShippingCost(String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    if (location == 'India') {
      return 0.18;
    } else if (location == 'USA') {
      return 0.15;
    } else if (location == 'UK') {
      return 0.20;
    } else {
      return 0.10;
    }
  }

  static double getShippingCost(String location) {
    if (location == 'India') {
      return 10.0;
    } else if (location == 'USA') {
      return 20.0;
    } else if (location == 'UK') {
      return 15.0;
    } else {
      return 25.0;
    }
  }
}
