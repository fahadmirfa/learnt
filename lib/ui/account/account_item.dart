class AccountItem {
  final String label;
  final String iconPath;

  AccountItem(this.label, this.iconPath);
}

List<AccountItem> accountItems = [
  AccountItem("Orders", "assets/icons/account_icons/orders_icon.svg"),
  AccountItem("My Details", "assets/icons/account_icons/details_icon.svg"),

  AccountItem("Payment Methods", "assets/icons/account_icons/payment_icon.svg"),

  AccountItem("Help", "assets/icons/account_icons/help_icon.svg"),
  AccountItem("About", "assets/icons/account_icons/about_icon.svg"),
];
