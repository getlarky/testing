require 'calabash-android/calabash_steps'

Given /^I should see the correct redemption overlay$/ do
    redemptionOverlayMessage = evaluate_javascript("SystemWebView", "return (app.perkdetailView.viewModel.perk.organization.redeem_overlay)")[0]
    if redemptionOverlayMessage == "null"
        print("No redemption overlay present. Skip redemption check.")
    else
        uiredemptionOverlay = query("SystemWebView css:'.redeemMsg'")[0]["textContent"]
        if uiredemptionOverlay != redemptionOverlayMessage
            fail(msg="Redemption overlay not displayed properly")
        end
    end
    

end

Given /^I should see the correct redemption question$/ do
    redemptionMessage = evaluate_javascript("SystemWebView", "return (app.perkdetailView.viewModel.perk.organization.redeem_question)")[0]
    if redemptionMessage == "null"
        print("No redemption question present. Skip redemption check.")
    else
        uiredemptionMessage = query("TextView id:'message'")[0]['text']
        if uiredemptionMessage != redemptionMessage
            fail(msg="Redemption message not properly displayed")
        end
        touch("button")

    end
end