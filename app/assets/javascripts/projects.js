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
        dataType: "json"
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
        }
    });
}

function removeFromWishlist(wishlist_id) {
    $.ajax({
        type: "POST",
        url: "/wishlists/"+wishlist_id.toString()+".json",
        dataType: "json",
        data: {"_method":"delete"},
        success: function(data){
            modifyWishlistButton("none", wishlist_button, 'btn btn-info', 'Add to Wishlist');
        }
    });
}

function modifyWishlistButton(wishlist_id, wishlist_button, class_type, text) {
    wishlist_button.value = wishlist_id;
    wishlist_button.setAttribute('class', class_type);
    wishlist_button.innerHTML = text;
}

