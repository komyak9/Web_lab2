<%@ page import="java.util.ArrayList" %>
<%@ page import="utils.Result" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web lab 2</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/validate.js"></script>
    <style>
        html, body, div, p {
            padding: 0;
            margin: 0;
            top: 0;
        }

        .body {
            background-color: #FFF2F8;
        }

        div[class="header"] {
            background-color: #99004C;
            color: #FFF2F8;
            display: flex;
            justify-content: space-between;
            margin-bottom: 2%;
        }

        #text1 {
            text-align: left;
            margin-left: 5%;
        }

        #text2 {
            text-align: right;
            margin-right: 5%;
        }

        .head-text {
            font: italic small-caps 36px fantasy;
        }

        .img_content {
            float: left;
            margin: 1% 5% 4% 10%;
        }

        #pic-description {
            margin-bottom: 2%;
        }

        .form {
            float: left;
            margin: 1% 4% 4% 10%;
            display: inline-block;
        }

        .table-wrap {
            width: 80%;
            clear: both;
            margin-top: 22%;
            margin-left: 10%;
            margin-right: 10%;
        }

        caption {
            caption-side: bottom;
            text-align: right;
            padding: 10px 0;
        }

        table {
            border: 4px double #333;
            border-collapse: separate;
            width: 100%;
            border-spacing: 7px 11px;
        }

        td {
            padding: 5px;
            border: 1px solid #a52a2a;
        }

        p {
            font: bold 18px "Courier New";
        }

        p[class="value_text"] {
            margin-bottom: 2%;
        }

        input[type="radio"] {
            margin-left: 15px;
        }

        #X_form {
            margin-bottom: 6%;
        }

        #Y_form {
            margin-bottom: 6%;
        }

        #R_form {
            margin-bottom: 6%;
        }

        #confirmation_button {
            float: right;
            margin-right: 35%;
            background-color: rgb(255, 255, 255);
            color: rgb(0, 0, 0);
            font: bold 14px "Courier New";
            border: 2px solid #99004C;
            height: 35px;
        }

        #clear_button {
            float: right;
            margin-right: 38%;
            margin-top: 3%;
            background-color: rgb(255, 255, 255);
            color: rgb(0, 0, 0);
            font: bold 14px "Courier New";
            border: 2px solid #99004C;
            height: 35px;
        }

        #outputTable {
            background: rgb(255, 255, 255);
        }

        .value_message {
            font: bold 14px "Courier New";
            color: red;
            display: block;
        }

        button {
            cursor: pointer;
        }

        .svg-line-color {
            stroke: #99004C;
            stroke-width: 2px
        }

        .svg-figure-color {
            fill: #fff7fb;
            stroke: #99004C;
            stroke-width: 3px
        }

        .svg-point-color {
            fill: #99004C;
        }
    </style>
</head>
<body class="body">
<div class="main-block">
    <div class="header">
        <div id="text1">
            <p class="head-text">Лабораторная работа №2</p>
        </div>
        <div id="text2">
            <p class="head-text">Сюр Юлия, 312715, группа Р3233</p>
            <p class="head-text">Вариант 33480</p>
        </div>
    </div>

        <%
    ArrayList<Result> results = new ArrayList<>();
    if (request.getServletContext().getAttribute("results") != null) {
        results = (ArrayList<Result>) request.getServletContext().getAttribute("results");
    }
%>

    <div class="img_content">
        <p id="pic-description">График области попадания точки:</p>
        <svg width="386" height="386" id="graph" xmlns="http://www.w3.org/2000/svg">
            <rect width="386" height="386" style="fill: white; stroke: #99004C; stroke-width: 8px"></rect>

            <polygon points="123,193 193,193 193,263" class="svg-figure-color" stroke-width="2"></polygon>
            <polygon points="193,53 333,53 333,193 193,193" class="svg-figure-color" stroke-width="2"></polygon>
            <path d="M193,193 v+70 a70,70 0 0,0 70,-70z" class="svg-figure-color" stroke-width="2"></path>

            <line class="svg-figure-color" x1="193" y1="0" x2="193" y2="386"
                  style="stroke: black; stroke-width: 3px"></line>
            <line class="svg-figure-color" x1="0" y1="193" x2="386" y2="193"
                  style="stroke: black; stroke-width: 3px"></line>
            <polygon class="svg-point-color" points="383 193 367 183 367 203" style="fill: black"></polygon>
            <polygon class="svg-point-color" points="193 3 183 20 203 20" style="fill: black"></polygon>

            <line class="svg-line-color" x1="263" y1="198" x2="263" y2="188"></line>
            <line class="svg-line-color" x1="333" y1="198" x2="333" y2="188"></line>
            <line class="svg-line-color" x1="123" y1="198" x2="123" y2="188"></line>
            <line class="svg-line-color" x1="53" y1="198" x2="53" y2="188"></line>
            <line class="svg-line-color" x1="198" y1="263" x2="188" y2="263"></line>
            <line class="svg-line-color" x1="198" y1="333" x2="188" y2="333"></line>
            <line class="svg-line-color" x1="198" y1="123" x2="188" y2="123"></line>
            <line class="svg-line-color" x1="198" y1="53" x2="188" y2="53"></line>

            <text class="axis" x="367" y="177">X</text>
            <text class="axis" x="204" y="19">Y</text>
            <text x="204" y="58">R</text>
            <text x="204" y="128">R/2</text>
            <text x="204" y="268">-R/2</text>
            <text x="204" y="338">-R</text>
            <text x="328" y="177">R</text>
            <text x="250" y="177">R/2</text>
            <text x="105" y="177">-R/2</text>
            <text x="42" y="177">-R</text>

            <%
                for (Result result : results) {
            %>
            <circle r="4" cx="<%=193 + Math.round(140 * result.getX() / result.getR())%>"
                    cy="<%=193 - Math.round(140 * result.getY() / result.getR())%>"
                    fill=#99004C fill-opacity="0.85"></circle>
            <%
                }
            %>
        </svg>
    </div>

    <div class="form">
        <form method="post" name="coordinates">
            <div id="X_form">
                <p class="value_text">Выберите значение X:</p>
                <input name="x-value" type="radio" value="-2"> -2 </input>
                <input name="x-value" type="radio" value="-1.5"> -1.5 </input>
                <input name="x-value" type="radio" value="-1"> -1 </input>
                <input name="x-value" type="radio" value="-0.5"> -0.5 </input>
                <input name="x-value" type="radio" value="0"> 0 </input>
                <input name="x-value" type="radio" value="0.5"> 0.5 </input>
                <input name="x-value" type="radio" value="1"> 1 </input>
                <input name="x-value" type="radio" value="1.5"> 1.5 </input>
                <input name="x-value" type="radio" value="2"> 2 </input>
                <p class="value_message" id="messageX"></p>
            </div>

            <div id="Y_form">
                <p class="value_text">Введите значение Y (от -5 до 5 включительно):</p>
                <input id="y" maxlength="15" name="y-value" placeholder="Введите Y..." type="text">
                <p class="value_message" id="messageY"></p>
            </div>

            <div id="R_form">
                <p class="value_text">Выберите значение R:</p>
                <input name="r-value" type="radio" value="1"> 1 </input>
                <input name="r-value" type="radio" value="1.5"> 1.5 </input>
                <input name="r-value" type="radio" value="2"> 2 </input>
                <input name="r-value" type="radio" value="2.5"> 2.5 </input>
                <input name="r-value" type="radio" value="3"> 3 </input>
                <p class="value_message" id="messageR"></p>
            </div>

            <button type="submit" id="confirmation_button">Подтвердить</button>
            <button type="reset" id="clear_button">Очистить</button>
        </form>
    </div>

    <div class="table-wrap">
        <table id="outputTable">
            <thead>
            <tr>
                <th class="coords-column">X</th>
                <th class="coords-column">Y</th>
                <th class="coords-column">R</th>
                <th>Answer</th>
                <th>Figure</th>
                <th class="time-column">Execution time</th>
                <th class="time-column">Current time</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Result result : results) {
            %>
            <tr>
                <td id="xT"><%=result.getX()%>
                </td>
                <td id="yT"><%=result.getY()%>
                </td>
                <td id="rT"><%=result.getR()%>
                </td>
                <td><%=result.getAnswer()%>
                </td>
                <td><%=result.getFigure()%>
                </td>
                <td><%=result.getExecutionTime()%>
                </td>
                <td><%=result.getCurrentTime()%>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>