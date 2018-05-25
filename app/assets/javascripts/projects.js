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