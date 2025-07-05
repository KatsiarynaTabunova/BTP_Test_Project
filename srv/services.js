const cds = require('@sap/cds')

class ProcessorService extends cds.ApplicationService {
  /** Registering custom event handlers */
  init() {
    
    this.before("UPDATE", "Incidents", (req) => this.onUpdate(req));
    this.before("CREATE", "Incidents", (req) => this.changeUrgencyDueToSubject(req.data));
    //get Customers
    this.after("READ", "Incidents",(results, req) => this.logCustomers(req));

    this.on('getItemsByQuantity', (req) => this.getItemsByQuantity(req));

    this.on('createItem', (req) => this.createItemHandler(req));   
    this.before('createItem', (req) => this.validateQuantity(req));
    
    return super.init();
  }

  async logCustomers (req) {
    const db = await cds.connect.to('db');
    const customers = await db.run(SELECT.from('sap.capire.incidents.Customers'));
    console.log("Customers", customers);
  }

  changeUrgencyDueToSubject(data) {   
    if (data) {
      const incidents = Array.isArray(data) ? data : [data];
      incidents.forEach((incident) => {
        if (incident.title?.toLowerCase().includes("urgent")) {
          incident.urgency = { code: "H", descr: "High" };
        }
      });
    }
  }

  /** Custom Validation */
  async onUpdate (req) {
    const { status_code } = await SELECT.one(req.subject, i => i.status_code).where({ID: req.data.ID})
    if (status_code === 'C')
      return req.reject(`Can't modify a closed incident`)
  }

  async getItemsByQuantity(quantity) {   
    const items = await SELECT.from("ProcessorService.Items").where({ quantity });
    return items
  }

  async createItemHandler(req) {
    const { title, descr, quantity } = req.data; 
    const items =  await INSERT.into("ProcessorService.Items").entries({ title, descr, quantity });
    return items
  } 

  async validateQuantity(req) {
    if (req.data.quantity > 100) {
      return req.reject(400, 'Quantity cannot exceed 100');
    }
  }
}
module.exports = { ProcessorService }