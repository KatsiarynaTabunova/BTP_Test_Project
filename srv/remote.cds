using { API_BUSINESS_PARTNER as S4 } from './external/API_BUSINESS_PARTNER';
using { Northwind_metadata as NW } from './external/Northwind_metadata';

service RemoteService {

  entity BusinessPartner as projection on S4.A_BusinessPartner {
    key BusinessPartner as ID,
    FirstName as firstName,
    LastName as lastName,
    BusinessPartnerName as name,
    to_BusinessPartnerAddress as addresses
  }

  entity BusinessPartnerAddress as projection on S4.A_BusinessPartnerAddress {
    BusinessPartner as ID,
    AddressID as addressId,
    to_EmailAddress as email,
    to_PhoneNumber as phoneNumber
  }

  entity EmailAddress as projection on S4.A_AddressEmailAddress {
    key AddressID as addressId,
    EmailAddress as email
  }

  entity PhoneNumber as projection on S4.A_AddressPhoneNumber {
    key AddressID as addressId,
    PhoneNumber as phone
  }

  entity Orders as projection on NW.Orders;

  function getOrders(Top: Integer default 10, Skip: Integer default 0)
    returns array of Orders;

  function getOrders2(Top: Integer default 100, Skip: Integer default 0)
    returns array of Orders;
}
