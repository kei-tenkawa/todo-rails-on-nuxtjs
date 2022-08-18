document.addEventListener("turbolinks:load", () => {
    let check1 = document.getElementById("daily_report_check_compliance1")
    let check2 = document.getElementById("daily_report_check_compliance2");
    let submitButton = document.getElementById("create_report");
console.log(check1, check2)
    check1.addEventListener("change", () => {
        console.log(check1.checked,check2.checked)
        if(check1.checked && check2.checked) {
            submitButton.disabled = false;
        } else {
            submitButton.disabled = true;
        }
    });
    check2.addEventListener("change", () => {
        if(check1.checked && check2.checked) {
            submitButton.disabled = false;
        } else {
            submitButton.disabled = true;
        }
    });
});
