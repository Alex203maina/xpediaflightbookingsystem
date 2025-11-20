$(document).ready(function(){
    const countrymodal = $('#countrydetailsmodal'),
        addnewcountrybutton = $('#addnewcountry'),
        countryidfield =$("#countryid"),
        countrynamefield = $('#countryname'),
        savecountrybutton = $('#savecountry'),
        notifications = $('#notifications');
        countriestable= $('#countriestable');
        countrynotifications = $('#countrynotifications');

    // load countries as table
    getcountriesastable();

    addnewcountrybutton.on('click', function(){
        countrymodal.modal('show')
    })

    savecountrybutton.on('click', function(){

        const countryname = countrynamefield.val(),
            countryid = countryidfield.val();
        if(countryname == ""){
            notifications.html("<div class='alert alert-primary'> Please Enter Country Name</div>")
            countrynamefield.focus()
        }else{
            $.post("controllers/countryoperations.php", {
                savecountry:true,
                countryid:countryid,
                countryname:countryname,
            },
        function(data){
            if(isJSON(data)){
                data = JSON.parse(data)
                if(data.status == "success"){
                    notifications.html("<div class='alert alert-success'> Country save successfully</div>")
                    countrynamefield.val("")
                    countrynamefield.focus()
                    
                    // reload countries table
                    getcountriesastable()
                }else if (data.status == "exists"){
                    notifications.html("<div class='alert alert-info'>Country already exists in the system</div>")
                    countrynamefield.focus()
                }
            }else{
                notifications.html(`<div class='alert alert-danger'>Sorry an error occured ${data} </div>`)
            }
        })
        }
    })
    countrynamefield.on("input", function(){
        notifications.html("")
    })

    function isJSON(str) {
            try {
                return (JSON.parse(str) && !!str);
            } catch (e) {
                return false;
            }
        }

    function getcountriesastable(){
        $.getJSON(
            "controllers/countryoperations.php",
            {
                getcountries:true
            }
        ).done(function(data){
            let results = ""
            data.forEach(function(country,i){
                results+= `<t><td>${i+1}</td>`
                results+= `<td>${country.countryname}</td>`
                results+= `<td>${country.cities}</td>`
                results+= `<td>${country.airports}</td>`
                results+= `<td>${country.airlines}</td>`
                results+= `<td><a href='#'> <i class='fa fa-edit'></i></a></td></tr>`

            })
            // done looping through the data that was returned
            countriestable.find("tbody").html(results)

        }).fail(function(response,status,error){
            countrynotifications.html(`<div class='alert alert-danger'> Sorry an error occured while trying to get countries${response.responseText}</div>`)

        })
    }

})

