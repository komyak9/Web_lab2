$(function () {
    let x_value;
    let y_value;

    $("form").submit(function (event) {
        event.preventDefault();
        if (validate_data()) {
            requestWithArgs(getX().value, getY().value);
        }
    })

    function getX() {
        return document.forms.coordinates.elements.namedItem("x-value");
    }

    function getY() {
        return document.getElementById("y");
    }

    function getR() {
        return document.forms.coordinates.elements.namedItem("r-value");
    }

    function requestWithArgs(argX, argY) {
        $.ajax({
            url: "controller",
            type: "POST",
            data: {x: argX, y: argY, r: getR().value},
            success: function (data) {
                $("table").html(data);
                drawPoints();
            }
        });
    }

    function validate_data() {
        if (check_filled()) {
            if (Y_validation(-5, 5))
                return true;
        }
        return false;
    }

    function check_filled() {
        let isFilled = true;
        x_value = getX().value;
        y_value = getY().value;

        if (!x_value) {
            document.getElementById("messageX").innerHTML = "Выбор Х обязателен.";
            isFilled = false;
        } else
            document.getElementById("messageX").innerHTML = "";

        if (!y_value) {
            getY().style.border = "1px solid red";
            document.getElementById("messageY").innerHTML = "Ввод Y обязателен.";
            isFilled = false;
        } else {
            document.getElementById("messageY").innerHTML = "";
            getY().style.border = "1px solid black";
        }

        if (!getR().value) {
            document.getElementById("messageR").innerHTML = "Выбор R обязателен.";
            isFilled = false;
        } else
            document.getElementById("messageR").innerHTML = "";

        return isFilled;
    }

    function Y_validation(min, max) {
        if (y_value >= min && y_value <= max) {
            document.getElementById("messageY").innerHTML = "";
            getY().style.border = "1px solid black";
            return true;
        } else {
            getY().style.border = "1px solid red";
            document.getElementById("messageY").innerHTML = "Проверьте ввод значения Y.";
            return false;
        }
    }

    function clearTable() {
        $.ajax({
            url: "controller",
            type: "POST",
            data: {clear: "true"},
            success: function (data) {
                $("table").html(data);
                clearPoints();
            }
        });
    }

    function drawPoints() {
        const svg = document.getElementById('graph');
        let circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
        circle.setAttributeNS(null, 'cx', (193 + 140 * x_value/getR().value).toString());
        circle.setAttributeNS(null, 'cy', (193 - 140 * y_value/getR().value).toString());
        circle.setAttributeNS(null, 'r', '4');
        circle.setAttributeNS(null, 'fill', '#99004C');
        svg.appendChild(circle);
    }

    function clearPoints() {
        [].forEach.call(  document.querySelectorAll('circle')  , function(c){
            c.remove();
        })

    }

    $("input[name='r-value']").click(function () {
        if ($(this).hasClass("selected-r")) {
            $(this).removeClass("selected-r");
            $("#R_form").removeClass("ready");
        } else {
            $(this).addClass("selected-r");
            $(this).siblings("input.selected-r").removeClass("selected-r");
            $("#R_form").addClass("ready");
        }
    });

    $("button[type='reset']").click(function () {
        if ($("input[name='r-value']").hasClass("selected-r")) {
            $("input[name='r-value']").removeClass("selected-r");
            $("#R_form").removeClass("ready");
        }
        clearTable();
    })

    $("svg").click(function (e) {
        if ($("#R_form").hasClass("ready")) {
            x_value = ((e.offsetX - 193) * getR().value / 140).toFixed(1);
            y_value = ((193 - e.offsetY) * getR().value / 140).toFixed(1);
            let x = (e.offsetX - 193) * getR().value / 140;
            let y = (193 - e.offsetY) * getR().value / 140;
            requestWithArgs(x_value, y_value);
        } else {
            alert("Выберите значение R.");
        }
    })
});