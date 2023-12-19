require('dotenv').config()

$(function(){
    console.log("is this working?")
    const public_key = process.env.STRIPE_PUBLIC_KEY;

    const stripe = Stripe(public_key)
    
    // Creating an instance of the Stripe Elements library
    const elements = stripe.elements();
  
    // Creating a card element and mounting it to the specified HTML element
    const cardElement = elements.create('card');
    cardElement.mount('#card-element');
  
    // Selecting the donation form using jQuery
    const form = $('#donation-form');
  
    // Handling form submission
    form.on('submit', async (event) => {
      event.preventDefault();
  
      // Creating a token for the card using Stripe
      const { token, error } = await stripe.createToken(cardElement);
  
      // Checking for errors during token creation
      if (error) {
        console.error(error);
      } else {
        // If no errors, create a hidden input with the token information
        const hiddenInput = $('<input>').attr({
          type: 'hidden',
          name: 'stripe_token',
          value: token.id,
        });
  
        // Appending the hidden input to the form
        form.append(hiddenInput);
  
        // Submitting the form
        form.get(0).submit();
      }
    });
  });
