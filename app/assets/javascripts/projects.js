function clickDonate() {
    let donation_input = document.getElementById("donation_input");
    let project_input = document.getElementById("project_id");
    let user_input = document.getElementById("user_id");

    let user_id = user_input.value;
    let donation_value = donation_input.value;
    let project_id = project_input.value;

    $.ajax({
        type: "POST",
        url: "/funds.json",
        data: {
            fund: {
                money: donation_value,
                approved: true,
                user_id: user_id,
                project_id: project_id,
                authenticity_token: window._token
            }
        },
        dataType: "json",
        success: function(){
            sendNotice("Donation successful");
            getFundedAmount(project_id);
        }
    });
}

function clickOutstanding() {
    let project_input = document.getElementById("project_id");
    let outstanding_button = document.getElementById("outstanding_button");
    let user_input = document.getElementById("owner_id");

    let user_id = user_input.value;
    let project_id = project_input.value;
    let outstanding_value = outstanding_button.value;

    setOutstandingValue(project_id, outstanding_value, outstanding_button, user_id);
}

function setOutstandingValue(project_id, outstanding_value, outstanding_button, user_id) {
    let button_class;
    let button_text;

    if (outstanding_value === "true"){
        button_class = "btn btn-danger";
        button_text = "Remove from Outstanding Projects";
    } else {
        button_class = "btn btn-info";
        button_text = "Mark as outstanding";
    }

    $.ajax({
        type: "PATCH",
        dataType: "json",
        url: '/projects/'+project_id.toString()+'.json',
        contentType: 'application/json',
        data: JSON.stringify({
            "project": {
                outstanding: outstanding_value,
                user_id: user_id,
                authenticity_token: window._token
            }
        }),
        success: function(){
            modifyOutstandigButton(outstanding_value, outstanding_button, button_class, button_text);
            sendNotice("Change saved");
        }
    });
}

function modifyOutstandigButton(outstanding_value, outstanding_button, class_type, text) {
    let value = "true";
    if (outstanding_value === "true") value = "false";
    outstanding_button.value = value;
    outstanding_button.setAttribute('class', class_type);
    outstanding_button.innerHTML = text;
}

function clickWishlist() {
    let project_input = document.getElementById("project_id");
    let user_input = document.getElementById("user_id");
    let wishlist_button = document.getElementById("wishlist_button");

    let user_id = user_input.value;
    let project_id = project_input.value;
    let wishlist_id = wishlist_button.value;

    if (wishlist_id === "none"){
        addToWishlist(user_id, project_id, wishlist_button);
    } else {
        removeFromWishlist(wishlist_id);
    }

}

function addToWishlist(user_id, project_id, wishlist_button) {
    $.ajax({
        type: "POST",
        url: "/wishlists.json",
        data: {
            wishlist: {
                user_id: user_id,
                project_id: project_id,
                authenticity_token: window._token
            }
        },
        dataType: "json",
        success: function(data){
            let $response=$(data);
            let wishlist_id = $response[0].id;
            modifyWishlistButton(wishlist_id, wishlist_button, 'btn btn-danger', 'Remove from Wishlist');
            sendNotice("Added to wishlist");
        }
    });
}

function removeFromWishlist(wishlist_id) {
    $.ajax({
        type: "POST",
        url: "/wishlists/"+wishlist_id.toString()+".json",
        dataType: "json",
        data: {"_method":"delete"},
        success: function(){
            modifyWishlistButton("none", wishlist_button, 'btn btn-info', 'Add to Wishlist');
            sendNotice("Removed from wishlist");
        }
    });
}

function modifyWishlistButton(wishlist_id, wishlist_button, class_type, text) {
    wishlist_button.value = wishlist_id;
    wishlist_button.setAttribute('class', class_type);
    wishlist_button.innerHTML = text;
}


function buyPromise(promise_id) {
    let user_input = document.getElementById("user_id");
    let project_input = document.getElementById("project_id");

    let user_id = user_input.value;
    let project_id = project_input.value;


    $.ajax({
        type: "POST",
        url: "/buys.json",
        data: {
            buy: {
                approved: true,
                user_id: user_id,
                promise_id: promise_id,
                authenticity_token: window._token
            }
        },
        dataType: "json",
        success: function(){
            sendNotice("Promise purchased successfully");
            getFundedAmount(project_id);
        }
    });
}

function getFundedAmount(project_id) {
    $.ajax({
        type: "GET",
        url: "/projects/"+project_id.toString()+".json",
        success: function(data){
            let $response=$(data);
            let amount = $response[0].picture.record.funded_amount;
            setFundedAmount(amount.toString());
        }
    });
}

function setFundedAmount(amount) {
    let amount_text = document.getElementById("funded_amount");
    amount_text.innerHTML = "<strong>Funded so far:</strong> " + amount;
}

function categoryFilter() {
    let category_select = document.getElementById("selected_category");
    let selected_category_index = category_select.selectedIndex;
    let category_id = category_select.options[selected_category_index].value;

    $.ajax({
        type: "GET",
        url: "/projects.json?category="+category_id.toString(),
        success: function(data){
            let $response=$(data);
            updateShownProjects($response)
        }
    });
}

function updateShownProjects(projects){
    let projects_container = document.getElementById("projects_container");
    projects_container.innerHTML = "";
    for (let i=0; i<projects.length; i++){
        let project_id = projects[i].id.toString();
        let project_title = projects[i].title.toString();
        let project_picture = projects[i].picture.record.image_url.toString();
        projects_container.innerHTML += '<div class="col-md-3"><img class="img img-responsive" src="'+project_picture+'"><h2><a href="/projects/'+project_id+'">'+project_title+'</a></h2></div>';
    }
}

function addPromise(project_id){
    let price_input = document.getElementById("promise_price");
    let description_input = document.getElementById("promise_description");
    let date_input = document.getElementById("promise_release_date");
    let quantity_input = document.getElementById("promise_quantity");

    let price = price_input.value;
    let description = description_input.value;
    let release_date = date_input.value;
    let quantity = quantity_input.value;


    $.ajax({
        type: "POST",
        url: "/promises.json",
        data: {
            promise: {
                project_id: project_id,
                price: price,
                description: description,
                release_date: release_date,
                quantity:quantity,
                authenticity_token: window._token
            }
        },
        dataType: "json",
        success: function(){
            sendNotice("Promise created successfully");
            getFundedAmount(project_id);
        }
    });
}

