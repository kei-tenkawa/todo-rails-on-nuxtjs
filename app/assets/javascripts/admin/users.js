document.addEventListener("turbolinks:load", () => {
    document
        .getElementById("user_department_id")
        .addEventListener("change", (event) => {
            $.get({
                url: `/admin/users/${event.target.value}/sections`,
                // data: { department_id: event.target.value },
            });
            // .done((res) => {
            //     document.getElementById("user_section_id").innerHTML(res);
            // });
        });
    // let departmentId = document.getElementById("user_department_id").value;
    // if (departmentId !== "") {
    //     let selectedTemplate = document.getElementById(
    //         `section-of-department${departmentId}`
    //     );
    //     document.getElementById("user_section_id").remove();
    //     console.log(selectedTemplate);
    //     document
    //         .getElementById("user_department_id")
    //         .after(selectedTemplate.innerHTML());
    // }

    // let defaultSectionSelectBox = `<select class="form-select" name="user[department_id]" id="user_department_id">
    // <option value>グループを選択してください</option>
    // </select>`;

    // document
    //     .getElementById("user_department_id")
    //     .addEventListener("change", () => {
    //         let departmentId =
    //             document.getElementById("user_department_id").value;
    //         if (departmentId !== "") {
    //             let selectedTemplate = document.getElementById(
    //                 `section-of-department${departmentId}`
    //             );
    //             document.getElementById("user_section_id").remove();
    //             document
    //                 .getElementById("user_department_id")
    //                 .after(selectedTemplate.innerHTML());
    //         } else {
    //             document.getElementById("user_section_id").remove();
    //             document
    //                 .getElementById("user_department_id")
    //                 .after(defaultSectionSelectBox);
    //         }
    //     });
});
