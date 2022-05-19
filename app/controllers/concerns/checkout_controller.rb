class CheckoutController < ApplicationController
    
    def create 
        tutor_creation = TutorCreation.find(params[:id])
        @session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
            line_items: [{
                name: tutor_creation.first_name,
                amount: tutor_creation.price,
                currency: "aud",
                quantity: 1
            }],
    mode: 'payment',
    success_url: root_url,
    cancel_url: root_url,
    })

    repsond_do do |format|
        format.js 
    end
    end
end