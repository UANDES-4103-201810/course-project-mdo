function clickDonate() {
    let donation_button = document.getElementById("donation_button");
    let donation_input = document.getElementById("donation_input");
    let project_input = document.getElementById("project_id");

    let user_id = donation_button.value;
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