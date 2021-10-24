<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Learning Quiz</title>
    </head>
    <body>

        <form action="<c:url value="/member/learningQuiz"/>" method="post">
            <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 1000px;">
                <tr style="border: 1px black solid; background-color: #ed7d31; color: white">
                    <th style="width: 20px">${categorySession}</th>
                    <th>
                        <div style="float: left">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <div style="text-align: center; float: left">Learning Quiz</div>
                        <div style="text-align: right">Time Left <span id="timeLeft"></span></div>
                    </th>
                    <th style="width: 20px"></th>
                </tr>
                <tr>
                    <td colspan="3"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <div style="font-weight: bold">
                            Question ${quizes.indexOf(quizes.get(index))+1} of ${quizes.size()}
                        </div>
                        <br>
                        <div style="font-weight: bold">
                            &#8680;&nbsp;
                            ${quizes.get(index).questionContent}
                        </div>
                        <br>
                        <input type="number" name="index" value="${quizes.indexOf(quizes.get(index))}" hidden/>
                        <div><input type="radio" name="answer" value="A" ${quizes.get(index).answer == "A" ? "checked":""}/>A. ${quizes.get(index).a}</div>
                        <div><input type="radio" name="answer" value="B" ${quizes.get(index).answer == "B" ? "checked":""}/>B. ${quizes.get(index).b}</div>
                        <div><input type="radio" name="answer" value="C" ${quizes.get(index).answer == "C" ? "checked":""}/>C. ${quizes.get(index).c}</div>
                        <div><input type="radio" name="answer" value="D" ${quizes.get(index).answer == "D" ? "checked":""}/>D. ${quizes.get(index).d}</div>
                        <input type="number" id="totalDuration" name="totalDuration" value="${totalDuration}" hidden />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <div  style="text-align: left; float: left">
                            <input type="submit" name="command" value="END" style="background-color: #4472c4; color: white; 
                                   border-radius: 5px; padding: 10px; width: 180px; font-weight: bold"
                                   id="end"/>
                        </div>
                        <div  style="text-align: right">
                            <input type="submit" name="command" value="Previous" style="background-color: #4472c4; color: white; 
                                   border-radius: 5px; padding: 10px; width: 180px; font-weight: bold" 
                                   ${quizes.indexOf(quizes.get(index)) <= 0 ? "hidden":""}
                                   onclick="return saveLeftTime();"/>

                            <input type="submit" name="command" value="Next" style="background-color: #4472c4; color: white; 
                                   border-radius: 5px; padding: 10px; width: 180px; font-weight: bold" 
                                   ${quizes.indexOf(quizes.get(index)) >= quizes.size()-1 ? "hidden":""}
                                   onclick="return saveLeftTime();"/>
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
            </table>
        </form>

        <script src="<c:url value="/resources-management/jquery/jquery.min.js"/>"></script>
        <script>
            let distance = ${totalDuration} * 1000;
            let countDownDate = new Date().getTime() + distance;
            let interval = setInterval(myTimer, 1000);

            function myTimer() {
                let now = new Date().getTime();
                distance = countDownDate - now;

                let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                hours = ((hours < 10) ? '0' : '') + hours;

                let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                minutes = ((minutes < 10) ? '0' : '') + minutes;

                let seconds = Math.floor((distance % (1000 * 60)) / 1000);
                seconds = ((seconds < 10) ? '0' : '') + seconds;
                
                document.getElementById("timeLeft").innerHTML = hours + ":"
                        + minutes + ":" + seconds;

                if (distance < 0) {
                    clearInterval(interval);
                    $('#end').click();
                    document.getElementById("timeLeft").innerHTML = "00:00:00";
                }
            }

            function saveLeftTime() {
                $("#totalDuration").val(distance);
            }
        </script>    
    </body>
</html>
