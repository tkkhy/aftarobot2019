"use strict";
// ######################################################################
// Accept Invoice to BFN and Firestore
// ######################################################################
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const functions = require("firebase-functions");
const admin = require("firebase-admin");
exports.addVehicleType = functions.https.onRequest((request, response) => __awaiter(this, void 0, void 0, function* () {
    if (!request.body) {
        console.log("ERROR - request has no body");
        return response.sendStatus(400);
    }
    try {
        const firestore = admin.firestore();
        const settings = { /* your settings... */ timestampsInSnapshots: true };
        firestore.settings(settings);
    }
    catch (e) {
    }
    console.log(`##### Incoming debug ${request.body.debug}`);
    console.log(`##### Incoming vehicleType ${JSON.stringify(request.body.vehicleType)}`);
    const vehicleType = request.body.vehicleType;
    const fs = admin.firestore();
    yield writeType();
    return null;
    function writeType() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const ref = yield fs.collection('vehicleTypes').add(vehicleType);
                vehicleType.path = ref.path;
                yield ref.set(vehicleType);
                console.log(`car type written to Firestore ${ref.path}`);
                return response.status(200).send(vehicleType);
            }
            catch (e) {
                console.error(e);
                return response.status(400).send(e);
            }
        });
    }
}));
//# sourceMappingURL=add-vehicle.type.js.map