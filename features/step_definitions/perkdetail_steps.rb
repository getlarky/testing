require 'calabash-android/calabash_steps'
redemptionMessage = ""

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
    end
end

Given /^I touch a redemption button$/ do
    if redemptionMessage == "null"
        print("No redemption question present. Skip redemption check.")
    else
        touch("button")
    end
end

Given /^The perk detail page has loaded$/ do
    wait_for(:timeout=>8){
        query("SystemWebView css:'#perkdetail .product'").size > 0
    }
end

Given /^I tap the location of the perk$/ do 
    touch("SystemWebView css:'[data-bind=\"text: closestLocationText\"]'")
end

Given /^I click the online redemption url$/ do
    touch("SystemWebView css:'#redeem a input'")
end