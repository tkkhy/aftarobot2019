// ######################################################################
// Add User to Firestore
// ######################################################################

import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { UserHelper } from "./register-user-helper";
//curl --header "Content-Type: application/json"   --request POST   --data '{"adminID": "32a26a20-bd30-11e8-84f5-63a97aaac795","debug":"true"}'  https://us-central1-aftarobot2019-dev1.cloudfunctions.net/addAssociation

export const registerUser = functions.https.onRequest(
  async (request, response) => {
    console.log(request.body);
    if (!request.body.user) {
      console.log("ERROR - request has no user");
      return response.status(400).send("Request has no user json object");
    }

    const fs = admin.firestore();
    try {
      const settings = { /* your settings... */ timestampsInSnapshots: true };
      fs.settings(settings);
    } catch (e) {}

    console.log(`##### Incoming user ${JSON.stringify(request.body.user)}`);
    console.log(
      `##### Incoming Firebase Auth userRecord ${JSON.stringify(
        request.body.userRecord
      )}`
    );
    try {
      const result = await UserHelper.writeUser(
        request.body.user,
        request.body.userRecord
      );
      response.status(200).send(result);
    } catch (e) {
      response.status(400).send(`Unable to add user ${e}`);
    }
    return null;
  }
);
