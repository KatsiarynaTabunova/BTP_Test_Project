sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/core/Fragment",
  "sap/m/MessageToast",
  "sap/m/MessageBox"
], function (Controller, Fragment, MessageToast, MessageBox) {
  "use strict";

  return Controller.extend("ns.controller.ListReport", {

    onOpenCreateDialog: function () {
      if (!this._oDialog) {
        this._oDialog = Fragment.load({
          id: "createDialog",
          name: "ns.itemsfreesyle.view.fragments.CreateItemDialog",
          controller: this
        }).then(function (oDialog) {
          this.getView().addDependent(oDialog);
          this._oDialogInstance = oDialog;
          return oDialog;
        }.bind(this));
      }

      this._oDialog.then(function (oDialog) {
        oDialog.open();
      });
    },

    onCloseDialog: function () {
      this._oDialog.then(function (oDialog) {
        oDialog.close();
      });
    },

    onCreateItemFromDialog: async function () {
      const oModel = this.getOwnerComponent().getModel();

      const oTitleInput = Fragment.byId("createDialog", "inputTitle");
      const oDescrInput = Fragment.byId("createDialog", "inputDescr");
      const oQuantityInput = Fragment.byId("createDialog", "inputQuantity");
      const sTitle = oTitleInput.getValue();
      const sDescr = oDescrInput.getValue();
      const iQuantity = parseInt(oQuantityInput.getValue());

      const oContextBinding = oModel.bindContext("/ProcessorService.createItem(...)");
      oContextBinding.setParameter("title", sTitle);
      oContextBinding.setParameter("descr", sDescr);
      oContextBinding.setParameter("quantity", iQuantity);

      try {
        await oContextBinding.execute();
        this.onCloseDialog();
        const oTable = this.byId("idProductsTable");
        const oBinding = oTable.getBinding("items");
        if (oBinding) {
          oBinding.refresh();
        }
        MessageToast.show("Item created successfully");
      } catch (oError) {
        console.error("❌ Failed to create item:", oError);
        MessageBox.error("Error: " + oError.message);
      }
    }

  });
});