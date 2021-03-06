// ######################################################################
// Add Vehicle to Firestore
// ######################################################################

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import * as constants from "../models/constants";
import { VehicleHelper } from "./add-vehicle-helper";
const uuid = require("uuid/v1");

export const addVehicle = functions.https.onRequest(
  async (request, response) => {
    if (!request.body) {
      console.log("ERROR - request has no body");
      return response.sendStatus(400);
    }
    const fs = admin.firestore();
    try {
      const settings = { /* your settings... */ timestampsInSnapshots: true };
      fs.settings(settings);
    } catch (e) {}

    console.log(`##### Incoming debug; ${request.body.debug}`);
    console.log(
      `##### Incoming vehicle: ${JSON.stringify(request.body.vehicle)}`
    );

    const vehicle = request.body.vehicle;
    if (!vehicle.vehicleType) {
      console.error("Vehicle has no type");
      return response.status(400).send("Vehicle does not have a type");
    }

    await writeVehicle();
    return null;

    async function writeVehicle() {
      try {
        const resultVehicle = await VehicleHelper.writeVehicle(vehicle);
        return response.status(200).send(resultVehicle);
      } catch (e) {
        console.log(e);
        return response.status(400).send(e);
      }
    }
  }
);
