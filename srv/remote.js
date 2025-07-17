const cds = require('@sap/cds')

class RemoteService extends cds.ApplicationService {
  /** Registering custom event handlers */
  async init() {
    
    this.on('getOrders', req => this.getOrders1(req));  
    this.on('getOrders2', req => this.getOrders21(req));     

    this.northwind = await cds.connect.to('Northwind_metadata')
   this.northwindDestination = await cds.connect.to('Northwind_metadata');
    return super.init();
  }

  async getOrders1(req) {
    
    const { Orders } = this.northwind.entities;  
    const top = req.data?.Top ?? 2;
    const skip = req.data?.Skip ?? 0;
    const result = await this.northwind.run(SELECT.from(Orders).limit(top, skip));
    return result;
  }

  async getOrders21 (req) {
    try {
      const orders = await this.northwindDestination.get("/Orders");
      return orders;
    } catch (err) {
        console.log(err);
    }
    // const { Orders } = this.northwindDestination.entities;
    // const top  = req.data?.Top  ?? 100;
    // const skip = req.data?.Skip ?? 0;

    // const result = await this.northwindDestination.run(SELECT.from(Orders).limit(top, skip));  
    // console.log(result)
    // return result;
  };
  
}
module.exports = { RemoteService }