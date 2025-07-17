/* checksum : 4d0b251a17c3a597839a04dbd2dc1f47 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
service Northwind_metadata {};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Categories {
  key CategoryID : Integer not null;
  CategoryName : String(15) not null;
  Description : LargeString;
  Picture : LargeBinary;
  Products : Association to many Northwind_metadata.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.CustomerDemographics {
  key CustomerTypeID : String(10) not null;
  CustomerDesc : LargeString;
  Customers : Association to many Northwind_metadata.Customers {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Customers {
  key CustomerID : String(5) not null;
  CompanyName : String(40) not null;
  ContactName : String(30);
  ContactTitle : String(30);
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  Phone : String(24);
  Fax : String(24);
  Orders : Association to many Northwind_metadata.Orders {  };
  CustomerDemographics : Association to many Northwind_metadata.CustomerDemographics {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Employees {
  key EmployeeID : Integer not null;
  LastName : String(20) not null;
  FirstName : String(10) not null;
  Title : String(30);
  TitleOfCourtesy : String(25);
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  BirthDate : Timestamp;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  HireDate : Timestamp;
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  HomePhone : String(24);
  Extension : String(4);
  Photo : LargeBinary;
  Notes : LargeString;
  ReportsTo : Integer;
  PhotoPath : String(255);
  Employees1 : Association to many Northwind_metadata.Employees {  };
  Employee1 : Association to Northwind_metadata.Employees {  };
  Orders : Association to many Northwind_metadata.Orders {  };
  Territories : Association to many Northwind_metadata.Territories {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Order_Details {
  key OrderID : Integer not null;
  key ProductID : Integer not null;
  UnitPrice : Decimal(19, 4) not null;
  Quantity : Integer not null;
  @odata.Type : 'Edm.Single'
  Discount : Double not null;
  Order : Association to Northwind_metadata.Orders {  };
  Product : Association to Northwind_metadata.Products {  };
};

@cds.external : true
@cds.odata.v2.proxy
@cds.persistence.skip : true
entity Northwind_metadata.Orders {
  key OrderID : Integer not null;
  CustomerID : String(5);
  EmployeeID : Integer;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  OrderDate : Timestamp;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  RequiredDate : Timestamp;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  ShippedDate : Timestamp;
  ShipVia : Integer;
  Freight : Decimal(19, 4);
  ShipName : String(40);
  ShipAddress : String(60);
  ShipCity : String(15);
  ShipRegion : String(15);
  ShipPostalCode : String(10);
  ShipCountry : String(15);
  Customer : Association to Northwind_metadata.Customers {  };
  Employee : Association to Northwind_metadata.Employees {  };
  Order_Details : Association to many Northwind_metadata.Order_Details {  };
  Shipper : Association to Northwind_metadata.Shippers {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Products {
  key ProductID : Integer not null;
  ProductName : String(40) not null;
  SupplierID : Integer;
  CategoryID : Integer;
  QuantityPerUnit : String(20);
  UnitPrice : Decimal(19, 4);
  UnitsInStock : Integer;
  UnitsOnOrder : Integer;
  ReorderLevel : Integer;
  Discontinued : Boolean not null;
  Category : Association to Northwind_metadata.Categories {  };
  Order_Details : Association to many Northwind_metadata.Order_Details {  };
  Supplier : Association to Northwind_metadata.Suppliers {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Regions {
  key RegionID : Integer not null;
  RegionDescription : String(50) not null;
  Territories : Association to many Northwind_metadata.Territories {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Shippers {
  key ShipperID : Integer not null;
  CompanyName : String(40) not null;
  Phone : String(24);
  Orders : Association to many Northwind_metadata.Orders {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Suppliers {
  key SupplierID : Integer not null;
  CompanyName : String(40) not null;
  ContactName : String(30);
  ContactTitle : String(30);
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  Phone : String(24);
  Fax : String(24);
  HomePage : LargeString;
  Products : Association to many Northwind_metadata.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Territories {
  key TerritoryID : String(20) not null;
  TerritoryDescription : String(50) not null;
  RegionID : Integer not null;
  Region : Association to Northwind_metadata.Regions {  };
  Employees : Association to many Northwind_metadata.Employees {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Alphabetical_list_of_products {
  key CategoryName : String(15) not null;
  key Discontinued : Boolean not null;
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
  SupplierID : Integer;
  CategoryID : Integer;
  QuantityPerUnit : String(20);
  UnitPrice : Decimal(19, 4);
  UnitsInStock : Integer;
  UnitsOnOrder : Integer;
  ReorderLevel : Integer;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Category_Sales_for_1997 {
  key CategoryName : String(15) not null;
  CategorySales : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Current_Product_Lists {
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Customer_and_Suppliers_by_Cities {
  key CompanyName : String(40) not null;
  key Relationship : String(9) not null;
  City : String(15);
  ContactName : String(30);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Invoices {
  key CustomerName : String(40) not null;
  @odata.Type : 'Edm.Single'
  key Discount : Double not null;
  key OrderID : Integer not null;
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
  key Quantity : Integer not null;
  key Salesperson : String(31) not null;
  key ShipperName : String(40) not null;
  key UnitPrice : Decimal(19, 4) not null;
  ShipName : String(40);
  ShipAddress : String(60);
  ShipCity : String(15);
  ShipRegion : String(15);
  ShipPostalCode : String(10);
  ShipCountry : String(15);
  CustomerID : String(5);
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  OrderDate : Timestamp;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  RequiredDate : Timestamp;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  ShippedDate : Timestamp;
  ExtendedPrice : Decimal(19, 4);
  Freight : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Order_Details_Extendeds {
  @odata.Type : 'Edm.Single'
  key Discount : Double not null;
  key OrderID : Integer not null;
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
  key Quantity : Integer not null;
  key UnitPrice : Decimal(19, 4) not null;
  ExtendedPrice : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Order_Subtotals {
  key OrderID : Integer not null;
  Subtotal : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Orders_Qries {
  key CompanyName : String(40) not null;
  key OrderID : Integer not null;
  CustomerID : String(5);
  EmployeeID : Integer;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  OrderDate : Timestamp;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  RequiredDate : Timestamp;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  ShippedDate : Timestamp;
  ShipVia : Integer;
  Freight : Decimal(19, 4);
  ShipName : String(40);
  ShipAddress : String(60);
  ShipCity : String(15);
  ShipRegion : String(15);
  ShipPostalCode : String(10);
  ShipCountry : String(15);
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Product_Sales_for_1997 {
  key CategoryName : String(15) not null;
  key ProductName : String(40) not null;
  ProductSales : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Products_Above_Average_Prices {
  key ProductName : String(40) not null;
  UnitPrice : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Products_by_Categories {
  key CategoryName : String(15) not null;
  key Discontinued : Boolean not null;
  key ProductName : String(40) not null;
  QuantityPerUnit : String(20);
  UnitsInStock : Integer;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Sales_by_Categories {
  key CategoryID : Integer not null;
  key CategoryName : String(15) not null;
  key ProductName : String(40) not null;
  ProductSales : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Sales_Totals_by_Amounts {
  key CompanyName : String(40) not null;
  key OrderID : Integer not null;
  SaleAmount : Decimal(19, 4);
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  ShippedDate : Timestamp;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Summary_of_Sales_by_Quarters {
  key OrderID : Integer not null;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  ShippedDate : Timestamp;
  Subtotal : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind_metadata.Summary_of_Sales_by_Years {
  key OrderID : Integer not null;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 3
  ShippedDate : Timestamp;
  Subtotal : Decimal(19, 4);
};

// @cds.external : true
// @cds.persistence.skip
// service My_Northwind {}
