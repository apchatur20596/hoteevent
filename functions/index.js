const functions = require("firebase-functions");
const cors = require("cors");
const express = require("express");
const config = require("./config.json");
const stripe = require("stripe")(config.stripe_secret_key_test);
// const smtpTransport = require("nodemailer-smtp-transport");
// setup nodemailer
const nodemailer = require("nodemailer");
const {google} = require("googleapis");

/* Express with CORS */
const app2 = express();
app2.use(cors({origin: true}));

// app2.get("*", (request, response) => {
//   response.send("Hello from Express on Firebase with CORS!");
// });
app2.post("/send-mail", async (req, res) => {
  const OAuth2 = google.auth.OAuth2;
  const clientID = config.client_id;
  const clientSecret = config.client_secret;
  const refreshToken = config.refresh_token;
  let mailOptions;

  const oauth2Client = new OAuth2(
      clientID, // client Id
      clientSecret, // Client Secret
      config.redirect_url, // Redirect URL
  );

  oauth2Client.setCredentials({
    refresh_token: refreshToken,
  });
  const tokens = await oauth2Client.refreshAccessToken();
  const accessToken = tokens.credentials.access_token;

  const smtpTransport = nodemailer.createTransport({
    service: "gmail",
    auth: {
      type: "OAuth2",
      user: "ajinkya.chatur20596@gmail.com",
      clientId: clientID,
      clientSecret: clientSecret,
      refreshToken: refreshToken,
      accessToken: accessToken,
    },
  });

  switch (req.body.choice) {
    case 1:
      mailOptions = {
        from: "<ajinkya.chatur20596@gmail.com>",
        to: req.body.to,
        subject: "Receipt for order number ${req.body.orderNumber}",
        text: "Please click on the link below for receipt",
      };
      break;
    case 2:
      mailOptions = {
        from: "<ajinkya.chatur20596@gmail.com>",
        to: req.body.to,
        subject: req.body.subject,
        text: req.body.issueBody,
      };
      break;
    default:
      mailOptions = {
        from: "<ajinkya.chatur20596@gmail.com>",
        to: "chatur@usc.edu, ajinkya.chatur20596@gmail.com",
        subject: "default mail",
        text: "default mail.",
      };
  }

  smtpTransport.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log(error.message);
      smtpTransport.close();
    }
    return "mail sent";
  });
});

app2.get("/", (req, res) => {
  res.send("Hello World!");
});
app2.post("/create-checkout-session", async (request, response) => {
  console.log(request.body);
  console.log(request.body.name);
  const session = await stripe.checkout.sessions.create({
    payment_method_types: ["card"],
    line_items: [{
      name: request.body.name,
      amount: request.body.amount,
      currency: "usd",
      quantity: 1,
    }],
    mode: "payment",
    success_url: "https://hoteapp-8b290.web.app?session_id={CHECKOUT_SESSION_ID}",
    cancel_url: "https://hoteapp-8b290.web.app/failure",
  });
  response.json({
    sessionURL: session.url,
  });
});
app2.get("/onboard-user", async (req, res) => {
  const account = await stripe.accounts.create({
    type: "express",
  });
  const accountLinks = await stripe.accountLinks.create({
    account: account.id,
    refresh_url: "https://example.com/reauth",
    return_url: "http://localhost:7357/#/successRegister",
    type: "account_onboarding",
  });
  res.json({
    url: accountLinks.url,
  });
});
const api2 = functions.https.onRequest(app2);
module.exports = {
  api2,
};
