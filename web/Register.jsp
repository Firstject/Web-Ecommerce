<%-- 
    Document   : Register
    Created on : Oct 2, 2018, 12:36:37 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <div class="container">
            <h1>Register</h1>
            <p class="lead">Register now! It's fast and free!</p>
            <hr>
            <form action="Register" method="post">
                <fieldset>
                    <div class="row d-flex justify-content-between">
                        <div class="col-lg-5">
                            <div class="bs-component">
                                <div class="form-group">
                                    <label>
                                        <i class="fas fa-user"></i>
                                        Username
                                    </label>
                                    <input type="text" name="username" class="form-control" value="${requestScope.usernameField}" placeholder="Enter a new username" minlength="4" required="">
                                    <small id="userHelp" class="form-text text-muted">This will be your username. Make sure it's at least 4 characters and no more than 16 characters</small>
                                    <c:if test="${errorCode == 'USER_EMPTY' || errorCode == 'USER_TOOSHORT'
                                                  || errorCode == 'USER_TOOLONG' || errorCode == 'USER_HASWHITESPACE'
                                                  || errorCode == 'USER_EXISTS'}">
                                          <font style="color: red">${errorDesc}</font>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label>
                                        <i class="fas fa-at"></i>
                                        Email address
                                    </label>
                                    <input type="email" name="email" class="form-control" value="${requestScope.emailField}" placeholder="Enter email address">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    <c:if test="${errorCode == 'EMAIL_EMPTY' || errorCode == 'EMAIL_EXISTS'}">
                                        <font style="color: red">${errorDesc}</font>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <i class="fas fa-key"></i>
                                        Password
                                    </label>
                                    <input type="password" name="password1" class="form-control" id="exampleInputPassword1" placeholder="Password" minlength="7" required="">
                                    <small id="passwordHelp" class="form-text text-muted">Make sure it's at least 7 characters</small>
                                    <c:if test="${errorCode == 'PASSWORD_EMPTY' || errorCode == 'PASSWORD_TOOSHORT'
                                                  || errorCode == 'PASSWORD_TOOLONG'}">
                                          <font style="color: red">${errorDesc}</font>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <i class="fas fa-key"></i>
                                        Confirm Password
                                    </label>
                                    <input type="password" name="password2" class="form-control" id="exampleInputPassword1" placeholder="Re-enter password" minlength="7" required="">
                                    <c:if test="${errorCode == 'PASSWORD_EMPTY' || errorCode == 'PASSWORD_NOTMATCH'}">
                                        <font style="color: red">${errorDesc}</font>
                                    </c:if>
                                </div>
                                <br>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="bs-component">
                                <h1>Profile</h1>
                                <small>These information will be used when checking out an order.</small>
                                <hr>
                                <br>
                                <input type="hidden" value="" name="submit" />
                                <div class="form-group row">
                                    <div class="col-lg-5">
                                        <label>First Name</label>
                                        <input type="text" name="fname" class="form-control" id="exampleInputUser" value="${requestScope.fname}">
                                    </div>
                                    <div class="col-lg-5">
                                        <label>Last Name</label>
                                        <input type="text" name="lname" class="form-control" id="exampleInputUser" value="${requestScope.lname}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-5">
                                        <label>City</label>
                                        <input type="text" name="city" class="form-control" id="exampleInputUser" value="${requestScope.city}">
                                    </div>
                                    <div class="col-lg-5">
                                        <label>Address</label>
                                        <input type="text" name="address" class="form-control" id="exampleInputUser" value="${requestScope.address}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-5">
                                        <label>Country</label>
                                        <select class="form-control" name="country">
                                            <option ${requestScope.country == 'United States' ? 'selected' : ''} value="United States">
                                                United States
                                            </option>

                                            <option ${requestScope.country == 'Afghanistan' ? 'selected' : ''} value="Afghanistan">
                                                Afghanistan
                                            </option>

                                            <option ${requestScope.country == 'Aland Islands' ? 'selected' : ''} value="Aland Islands">
                                                Aland Islands
                                            </option>

                                            <option ${requestScope.country == 'Albania' ? 'selected' : ''} value="Albania">
                                                Albania
                                            </option>

                                            <option ${requestScope.country == 'Algeria' ? 'selected' : ''} value="Algeria">
                                                Algeria
                                            </option>

                                            <option ${requestScope.country == 'American Samoa' ? 'selected' : ''} value="American Samoa">
                                                American Samoa
                                            </option>

                                            <option ${requestScope.country == 'Andorra' ? 'selected' : ''} value="Andorra">
                                                Andorra
                                            </option>

                                            <option ${requestScope.country == 'Angola' ? 'selected' : ''} value="Angola">
                                                Angola
                                            </option>

                                            <option ${requestScope.country == 'Anguilla' ? 'selected' : ''} value="Anguilla">
                                                Anguilla
                                            </option>

                                            <option ${requestScope.country == 'Antarctica' ? 'selected' : ''} value="Antarctica">
                                                Antarctica
                                            </option>

                                            <option ${requestScope.country == 'Antigua and Barbuda' ? 'selected' : ''} value="Antigua and Barbuda">
                                                Antigua and Barbuda
                                            </option>

                                            <option ${requestScope.country == 'Argentina' ? 'selected' : ''} value="Argentina">
                                                Argentina
                                            </option>

                                            <option ${requestScope.country == 'Armenia' ? 'selected' : ''} value="Armenia">
                                                Armenia
                                            </option>

                                            <option ${requestScope.country == 'Aruba' ? 'selected' : ''} value="Aruba">
                                                Aruba
                                            </option>

                                            <option ${requestScope.country == 'Australia' ? 'selected' : ''} value="Australia">
                                                Australia
                                            </option>

                                            <option ${requestScope.country == 'Austria' ? 'selected' : ''} value="Austria">
                                                Austria
                                            </option>

                                            <option ${requestScope.country == 'Azerbaijan' ? 'selected' : ''} value="Azerbaijan">
                                                Azerbaijan
                                            </option>

                                            <option ${requestScope.country == 'Bahamas' ? 'selected' : ''} value="Bahamas">
                                                Bahamas
                                            </option>

                                            <option ${requestScope.country == 'Bonaire, Sint Eustatius and Saba' ? 'selected' : ''} value="Bonaire, Sint Eustatius and Saba">
                                                Bonaire, Sint Eustatius and Saba
                                            </option>

                                            <option ${requestScope.country == 'Bahrain' ? 'selected' : ''} value="Bahrain">
                                                Bahrain
                                            </option>

                                            <option ${requestScope.country == 'Bangladesh' ? 'selected' : ''} value="Bangladesh">
                                                Bangladesh
                                            </option>

                                            <option ${requestScope.country == 'Barbados' ? 'selected' : ''} value="Barbados">
                                                Barbados
                                            </option>

                                            <option ${requestScope.country == 'Belarus' ? 'selected' : ''} value="Belarus">
                                                Belarus
                                            </option>

                                            <option ${requestScope.country == 'Belgium' ? 'selected' : ''} value="Belgium">
                                                Belgium
                                            </option>

                                            <option ${requestScope.country == 'Belize' ? 'selected' : ''} value="Belize">
                                                Belize
                                            </option>

                                            <option ${requestScope.country == 'Benin' ? 'selected' : ''} value="Benin">
                                                Benin
                                            </option>

                                            <option ${requestScope.country == 'Bermuda' ? 'selected' : ''} value="Bermuda">
                                                Bermuda
                                            </option>

                                            <option ${requestScope.country == 'Bhutan' ? 'selected' : ''} value="Bhutan">
                                                Bhutan
                                            </option>

                                            <option ${requestScope.country == 'Bolivia' ? 'selected' : ''} value="Bolivia">
                                                Bolivia
                                            </option>

                                            <option ${requestScope.country == 'Bosnia and Herzegovina' ? 'selected' : ''} value="Bosnia and Herzegovina">
                                                Bosnia and Herzegovina
                                            </option>

                                            <option ${requestScope.country == 'Botswana' ? 'selected' : ''} value="Botswana">
                                                Botswana
                                            </option>

                                            <option ${requestScope.country == 'Bouvet Island' ? 'selected' : ''} value="Bouvet Island">
                                                Bouvet Island
                                            </option>

                                            <option ${requestScope.country == 'Brazil' ? 'selected' : ''} value="Brazil">
                                                Brazil
                                            </option>

                                            <option ${requestScope.country == 'British Indian Ocean Territory' ? 'selected' : ''} value="British Indian Ocean Territory">
                                                British Indian Ocean Territory
                                            </option>

                                            <option ${requestScope.country == 'Brunei' ? 'selected' : ''} value="Brunei">
                                                Brunei
                                            </option>

                                            <option ${requestScope.country == 'Bulgaria' ? 'selected' : ''} value="Bulgaria">
                                                Bulgaria
                                            </option>

                                            <option ${requestScope.country == 'Burkina Faso' ? 'selected' : ''} value="Burkina Faso">
                                                Burkina Faso
                                            </option>

                                            <option ${requestScope.country == 'Burundi' ? 'selected' : ''} value="Burundi">
                                                Burundi
                                            </option>

                                            <option ${requestScope.country == 'Cambodia' ? 'selected' : ''} value="Cambodia">
                                                Cambodia
                                            </option>

                                            <option ${requestScope.country == 'Cameroon' ? 'selected' : ''} value="Cameroon">
                                                Cameroon
                                            </option>

                                            <option ${requestScope.country == 'Canada' ? 'selected' : ''} value="Canada">
                                                Canada
                                            </option>

                                            <option ${requestScope.country == 'Cape Verde' ? 'selected' : ''} value="Cape Verde">
                                                Cape Verde
                                            </option>

                                            <option ${requestScope.country == 'Cayman Islands' ? 'selected' : ''} value="Cayman Islands">
                                                Cayman Islands
                                            </option>

                                            <option ${requestScope.country == 'Central African Republic' ? 'selected' : ''} value="Central African Republic">
                                                Central African Republic
                                            </option>

                                            <option ${requestScope.country == 'Chad' ? 'selected' : ''} value="Chad">
                                                Chad
                                            </option>

                                            <option ${requestScope.country == 'Chile' ? 'selected' : ''} value="Chile">
                                                Chile
                                            </option>

                                            <option ${requestScope.country == 'China' ? 'selected' : ''} value="China">
                                                China
                                            </option>

                                            <option ${requestScope.country == 'Christmas Island' ? 'selected' : ''} value="Christmas Island">
                                                Christmas Island
                                            </option>

                                            <option ${requestScope.country == 'Cocos (Keeling) Islands' ? 'selected' : ''} value="Cocos (Keeling) Islands">
                                                Cocos (Keeling) Islands
                                            </option>

                                            <option ${requestScope.country == 'Colombia' ? 'selected' : ''} value="Colombia">
                                                Colombia
                                            </option>

                                            <option ${requestScope.country == 'Comoros' ? 'selected' : ''} value="Comoros">
                                                Comoros
                                            </option>

                                            <option ${requestScope.country == 'Congo' ? 'selected' : ''} value="Congo">
                                                Congo
                                            </option>

                                            <option ${requestScope.country == 'Congo, The Democratic Republic of the' ? 'selected' : ''} value="Congo, The Democratic Republic of the">
                                                Congo, The Democratic Republic of the
                                            </option>

                                            <option ${requestScope.country == 'Cook Islands' ? 'selected' : ''} value="Cook Islands">
                                                Cook Islands
                                            </option>

                                            <option ${requestScope.country == 'Costa Rica' ? 'selected' : ''} value="Costa Rica">
                                                Costa Rica
                                            </option>

                                            <option ${requestScope.country == 'Cote d\'Ivoire' ? 'selected' : ''} value="Cote d'Ivoire">
                                                Cote d'Ivoire
                                            </option>

                                            <option ${requestScope.country == 'Croatia' ? 'selected' : ''} value="Croatia">
                                                Croatia
                                            </option>

                                            <option ${requestScope.country == 'Cuba' ? 'selected' : ''} value="Cuba">
                                                Cuba
                                            </option>

                                            <option ${requestScope.country == 'Cyprus' ? 'selected' : ''} value="Cyprus">
                                                Cyprus
                                            </option>

                                            <option ${requestScope.country == 'Czech Republic' ? 'selected' : ''} value="Czech Republic">
                                                Czech Republic
                                            </option>

                                            <option ${requestScope.country == 'Denmark' ? 'selected' : ''} value="Denmark">
                                                Denmark
                                            </option>

                                            <option ${requestScope.country == 'Djibouti' ? 'selected' : ''} value="Djibouti">
                                                Djibouti
                                            </option>

                                            <option ${requestScope.country == 'Dominica' ? 'selected' : ''} value="Dominica">
                                                Dominica
                                            </option>

                                            <option ${requestScope.country == 'Dominican Republic' ? 'selected' : ''} value="Dominican Republic">
                                                Dominican Republic
                                            </option>

                                            <option ${requestScope.country == 'Ecuador' ? 'selected' : ''} value="Ecuador">
                                                Ecuador
                                            </option>

                                            <option ${requestScope.country == 'Egypt' ? 'selected' : ''} value="Egypt">
                                                Egypt
                                            </option>

                                            <option ${requestScope.country == 'El Salvador' ? 'selected' : ''} value="El Salvador">
                                                El Salvador
                                            </option>

                                            <option ${requestScope.country == 'Equatorial Guinea' ? 'selected' : ''} value="Equatorial Guinea">
                                                Equatorial Guinea
                                            </option>

                                            <option ${requestScope.country == 'Eritrea' ? 'selected' : ''} value="Eritrea">
                                                Eritrea
                                            </option>

                                            <option ${requestScope.country == 'Estonia' ? 'selected' : ''} value="Estonia">
                                                Estonia
                                            </option>

                                            <option ${requestScope.country == 'Ethiopia' ? 'selected' : ''} value="Ethiopia">
                                                Ethiopia
                                            </option>

                                            <option ${requestScope.country == 'Falkland Islands (Malvinas)' ? 'selected' : ''} value="Falkland Islands (Malvinas)">
                                                Falkland Islands (Malvinas)
                                            </option>

                                            <option ${requestScope.country == 'Faroe Islands' ? 'selected' : ''} value="Faroe Islands">
                                                Faroe Islands
                                            </option>

                                            <option ${requestScope.country == 'Fiji' ? 'selected' : ''} value="Fiji">
                                                Fiji
                                            </option>

                                            <option ${requestScope.country == 'Finland' ? 'selected' : ''} value="Finland">
                                                Finland
                                            </option>

                                            <option ${requestScope.country == 'France' ? 'selected' : ''} value="France">
                                                France
                                            </option>

                                            <option ${requestScope.country == 'French Guiana' ? 'selected' : ''} value="French Guiana">
                                                French Guiana
                                            </option>

                                            <option ${requestScope.country == 'French Polynesia' ? 'selected' : ''} value="French Polynesia">
                                                French Polynesia
                                            </option>

                                            <option ${requestScope.country == 'French Southern Territories' ? 'selected' : ''} value="French Southern Territories">
                                                French Southern Territories
                                            </option>

                                            <option ${requestScope.country == 'Gabon' ? 'selected' : ''} value="Gabon">
                                                Gabon
                                            </option>

                                            <option ${requestScope.country == 'Gambia' ? 'selected' : ''} value="Gambia">
                                                Gambia
                                            </option>

                                            <option ${requestScope.country == 'Georgia' ? 'selected' : ''} value="Georgia">
                                                Georgia
                                            </option>

                                            <option ${requestScope.country == 'Germany' ? 'selected' : ''} value="Germany">
                                                Germany
                                            </option>

                                            <option ${requestScope.country == 'Ghana' ? 'selected' : ''} value="Ghana">
                                                Ghana
                                            </option>

                                            <option ${requestScope.country == 'Gibraltar' ? 'selected' : ''} value="Gibraltar">
                                                Gibraltar
                                            </option>

                                            <option ${requestScope.country == 'Greece' ? 'selected' : ''} value="Greece">
                                                Greece
                                            </option>

                                            <option ${requestScope.country == 'Greenland' ? 'selected' : ''} value="Greenland">
                                                Greenland
                                            </option>

                                            <option ${requestScope.country == 'Grenada' ? 'selected' : ''} value="Grenada">
                                                Grenada
                                            </option>

                                            <option ${requestScope.country == 'Guadeloupe' ? 'selected' : ''} value="Guadeloupe">
                                                Guadeloupe
                                            </option>

                                            <option ${requestScope.country == 'Guam' ? 'selected' : ''} value="Guam">
                                                Guam
                                            </option>

                                            <option ${requestScope.country == 'Guatemala' ? 'selected' : ''} value="Guatemala">
                                                Guatemala
                                            </option>

                                            <option ${requestScope.country == 'Guernsey' ? 'selected' : ''} value="Guernsey">
                                                Guernsey
                                            </option>

                                            <option ${requestScope.country == 'Guinea' ? 'selected' : ''} value="Guinea">
                                                Guinea
                                            </option>

                                            <option ${requestScope.country == 'Guinea-Bissau' ? 'selected' : ''} value="Guinea-Bissau">
                                                Guinea-Bissau
                                            </option>

                                            <option ${requestScope.country == 'Guyana' ? 'selected' : ''} value="Guyana">
                                                Guyana
                                            </option>

                                            <option ${requestScope.country == 'Haiti' ? 'selected' : ''} value="Haiti">
                                                Haiti
                                            </option>

                                            <option ${requestScope.country == 'Heard Island and McDonald Islands' ? 'selected' : ''} value="Heard Island and McDonald Islands">
                                                Heard Island and McDonald Islands
                                            </option>

                                            <option ${requestScope.country == 'Vatican City' ? 'selected' : ''} value="Vatican City">
                                                Vatican City
                                            </option>

                                            <option ${requestScope.country == 'Honduras' ? 'selected' : ''} value="Honduras">
                                                Honduras
                                            </option>

                                            <option ${requestScope.country == 'Hong Kong' ? 'selected' : ''} value="Hong Kong">
                                                Hong Kong
                                            </option>

                                            <option ${requestScope.country == 'Hungary' ? 'selected' : ''} value="Hungary">
                                                Hungary
                                            </option>

                                            <option ${requestScope.country == 'Iceland' ? 'selected' : ''} value="Iceland">
                                                Iceland
                                            </option>

                                            <option ${requestScope.country == 'India' ? 'selected' : ''} value="India">
                                                India
                                            </option>

                                            <option ${requestScope.country == 'Indonesia' ? 'selected' : ''} value="Indonesia">
                                                Indonesia
                                            </option>

                                            <option ${requestScope.country == 'Iran' ? 'selected' : ''} value="Iran">
                                                Iran
                                            </option>

                                            <option ${requestScope.country == 'Iraq' ? 'selected' : ''} value="Iraq">
                                                Iraq
                                            </option>

                                            <option ${requestScope.country == 'Ireland' ? 'selected' : ''} value="Ireland">
                                                Ireland
                                            </option>

                                            <option ${requestScope.country == 'Isle of Man' ? 'selected' : ''} value="Isle of Man">
                                                Isle of Man
                                            </option>

                                            <option ${requestScope.country == 'Israel' ? 'selected' : ''} value="Israel">
                                                Israel
                                            </option>

                                            <option ${requestScope.country == 'Italy' ? 'selected' : ''} value="Italy">
                                                Italy
                                            </option>

                                            <option ${requestScope.country == 'Jamaica' ? 'selected' : ''} value="Jamaica">
                                                Jamaica
                                            </option>

                                            <option ${requestScope.country == 'Japan' ? 'selected' : ''} value="Japan">
                                                Japan
                                            </option>

                                            <option ${requestScope.country == 'Jersey' ? 'selected' : ''} value="Jersey">
                                                Jersey
                                            </option>

                                            <option ${requestScope.country == 'Jordan' ? 'selected' : ''} value="Jordan">
                                                Jordan
                                            </option>

                                            <option ${requestScope.country == 'Kazakhstan' ? 'selected' : ''} value="Kazakhstan">
                                                Kazakhstan
                                            </option>

                                            <option ${requestScope.country == 'Kenya' ? 'selected' : ''} value="Kenya">
                                                Kenya
                                            </option>

                                            <option ${requestScope.country == 'Kiribati' ? 'selected' : ''} value="Kiribati">
                                                Kiribati
                                            </option>

                                            <option ${requestScope.country == 'North Korea' ? 'selected' : ''} value="North Korea">
                                                North Korea
                                            </option>

                                            <option ${requestScope.country == 'South Korea' ? 'selected' : ''} value="South Korea">
                                                South Korea
                                            </option>

                                            <option ${requestScope.country == 'Kuwait' ? 'selected' : ''} value="Kuwait">
                                                Kuwait
                                            </option>

                                            <option ${requestScope.country == 'Kyrgyzstan' ? 'selected' : ''} value="Kyrgyzstan">
                                                Kyrgyzstan
                                            </option>

                                            <option ${requestScope.country == 'Laos' ? 'selected' : ''} value="Laos">
                                                Laos
                                            </option>

                                            <option ${requestScope.country == 'Latvia' ? 'selected' : ''} value="Latvia">
                                                Latvia
                                            </option>

                                            <option ${requestScope.country == 'Lebanon' ? 'selected' : ''} value="Lebanon">
                                                Lebanon
                                            </option>

                                            <option ${requestScope.country == 'Lesotho' ? 'selected' : ''} value="Lesotho">
                                                Lesotho
                                            </option>

                                            <option ${requestScope.country == 'Liberia' ? 'selected' : ''} value="Liberia">
                                                Liberia
                                            </option>

                                            <option ${requestScope.country == 'Libya' ? 'selected' : ''} value="Libya">
                                                Libya
                                            </option>

                                            <option ${requestScope.country == 'Liechtenstein' ? 'selected' : ''} value="Liechtenstein">
                                                Liechtenstein
                                            </option>

                                            <option ${requestScope.country == 'Lithuania' ? 'selected' : ''} value="Lithuania">
                                                Lithuania
                                            </option>

                                            <option ${requestScope.country == 'Luxembourg' ? 'selected' : ''} value="Luxembourg">
                                                Luxembourg
                                            </option>

                                            <option ${requestScope.country == 'Macao' ? 'selected' : ''} value="Macao">
                                                Macao
                                            </option>

                                            <option ${requestScope.country == 'Macedonia, The Former Yugoslav Republic of' ? 'selected' : ''} value="Macedonia, The Former Yugoslav Republic of">
                                                Macedonia, The Former Yugoslav Republic of
                                            </option>

                                            <option ${requestScope.country == 'Madagascar' ? 'selected' : ''} value="Madagascar">
                                                Madagascar
                                            </option>

                                            <option ${requestScope.country == 'Malawi' ? 'selected' : ''} value="Malawi">
                                                Malawi
                                            </option>

                                            <option ${requestScope.country == 'Malaysia' ? 'selected' : ''} value="Malaysia">
                                                Malaysia
                                            </option>

                                            <option ${requestScope.country == 'Maldives' ? 'selected' : ''} value="Maldives">
                                                Maldives
                                            </option>

                                            <option ${requestScope.country == 'Mali' ? 'selected' : ''} value="Mali">
                                                Mali
                                            </option>

                                            <option ${requestScope.country == 'Malta' ? 'selected' : ''} value="Malta">
                                                Malta
                                            </option>

                                            <option ${requestScope.country == 'Marshall Islands' ? 'selected' : ''} value="Marshall Islands">
                                                Marshall Islands
                                            </option>

                                            <option ${requestScope.country == 'Martinique' ? 'selected' : ''} value="Martinique">
                                                Martinique
                                            </option>

                                            <option ${requestScope.country == 'Mauritania' ? 'selected' : ''} value="Mauritania">
                                                Mauritania
                                            </option>

                                            <option ${requestScope.country == 'Mauritius' ? 'selected' : ''} value="Mauritius">
                                                Mauritius
                                            </option>

                                            <option ${requestScope.country == 'Mayotte' ? 'selected' : ''} value="Mayotte">
                                                Mayotte
                                            </option>

                                            <option ${requestScope.country == 'Mexico' ? 'selected' : ''} value="Mexico">
                                                Mexico
                                            </option>

                                            <option ${requestScope.country == 'Micronesia, Federated States of' ? 'selected' : ''} value="Micronesia, Federated States of">
                                                Micronesia, Federated States of
                                            </option>

                                            <option ${requestScope.country == 'Moldova' ? 'selected' : ''} value="Moldova">
                                                Moldova
                                            </option>

                                            <option ${requestScope.country == 'Monaco' ? 'selected' : ''} value="Monaco">
                                                Monaco
                                            </option>

                                            <option ${requestScope.country == 'Mongolia' ? 'selected' : ''} value="Mongolia">
                                                Mongolia
                                            </option>

                                            <option ${requestScope.country == 'Montenegro' ? 'selected' : ''} value="Montenegro">
                                                Montenegro
                                            </option>

                                            <option ${requestScope.country == 'Montserrat' ? 'selected' : ''} value="Montserrat">
                                                Montserrat
                                            </option>

                                            <option ${requestScope.country == 'Morocco' ? 'selected' : ''} value="Morocco">
                                                Morocco
                                            </option>

                                            <option ${requestScope.country == 'Mozambique' ? 'selected' : ''} value="Mozambique">
                                                Mozambique
                                            </option>

                                            <option ${requestScope.country == 'Myanmar' ? 'selected' : ''} value="Myanmar">
                                                Myanmar
                                            </option>

                                            <option ${requestScope.country == 'Namibia' ? 'selected' : ''} value="Namibia">
                                                Namibia
                                            </option>

                                            <option ${requestScope.country == 'Nauru' ? 'selected' : ''} value="Nauru">
                                                Nauru
                                            </option>

                                            <option ${requestScope.country == 'Nepal' ? 'selected' : ''} value="Nepal">
                                                Nepal
                                            </option>

                                            <option ${requestScope.country == 'Netherlands' ? 'selected' : ''} value="Netherlands">
                                                Netherlands
                                            </option>

                                            <option ${requestScope.country == 'Netherlands Antilles' ? 'selected' : ''} value="Netherlands Antilles">
                                                Netherlands Antilles
                                            </option>

                                            <option ${requestScope.country == 'New Caledonia' ? 'selected' : ''} value="New Caledonia">
                                                New Caledonia
                                            </option>

                                            <option ${requestScope.country == 'New Zealand' ? 'selected' : ''} value="New Zealand">
                                                New Zealand
                                            </option>

                                            <option ${requestScope.country == 'Nicaragua' ? 'selected' : ''} value="Nicaragua">
                                                Nicaragua
                                            </option>

                                            <option ${requestScope.country == 'Niger' ? 'selected' : ''} value="Niger">
                                                Niger
                                            </option>

                                            <option ${requestScope.country == 'Nigeria' ? 'selected' : ''} value="Nigeria">
                                                Nigeria
                                            </option>

                                            <option ${requestScope.country == 'Niue' ? 'selected' : ''} value="Niue">
                                                Niue
                                            </option>

                                            <option ${requestScope.country == 'Norfolk Island' ? 'selected' : ''} value="Norfolk Island">
                                                Norfolk Island
                                            </option>

                                            <option ${requestScope.country == 'Northern Mariana Islands' ? 'selected' : ''} value="Northern Mariana Islands">
                                                Northern Mariana Islands
                                            </option>

                                            <option ${requestScope.country == 'Norway' ? 'selected' : ''} value="Norway">
                                                Norway
                                            </option>

                                            <option ${requestScope.country == 'Oman' ? 'selected' : ''} value="Oman">
                                                Oman
                                            </option>

                                            <option ${requestScope.country == 'Pakistan' ? 'selected' : ''} value="Pakistan">
                                                Pakistan
                                            </option>

                                            <option ${requestScope.country == 'Palau' ? 'selected' : ''} value="Palau">
                                                Palau
                                            </option>

                                            <option ${requestScope.country == 'Palestine, State of' ? 'selected' : ''} value="Palestine, State of">
                                                Palestine, State of
                                            </option>

                                            <option ${requestScope.country == 'Panama' ? 'selected' : ''} value="Panama">
                                                Panama
                                            </option>

                                            <option ${requestScope.country == 'Papua New Guinea' ? 'selected' : ''} value="Papua New Guinea">
                                                Papua New Guinea
                                            </option>

                                            <option ${requestScope.country == 'Paraguay' ? 'selected' : ''} value="Paraguay">
                                                Paraguay
                                            </option>

                                            <option ${requestScope.country == 'Peru' ? 'selected' : ''} value="Peru">
                                                Peru
                                            </option>

                                            <option ${requestScope.country == 'Philippines' ? 'selected' : ''} value="Philippines">
                                                Philippines
                                            </option>

                                            <option ${requestScope.country == 'Pitcairn' ? 'selected' : ''} value="Pitcairn">
                                                Pitcairn
                                            </option>

                                            <option ${requestScope.country == 'Poland' ? 'selected' : ''} value="Poland">
                                                Poland
                                            </option>

                                            <option ${requestScope.country == 'Portugal' ? 'selected' : ''} value="Portugal">
                                                Portugal
                                            </option>

                                            <option ${requestScope.country == 'Puerto Rico' ? 'selected' : ''} value="Puerto Rico">
                                                Puerto Rico
                                            </option>

                                            <option ${requestScope.country == 'Qatar' ? 'selected' : ''} value="Qatar">
                                                Qatar
                                            </option>

                                            <option ${requestScope.country == 'Reunion' ? 'selected' : ''} value="Reunion">
                                                Reunion
                                            </option>

                                            <option ${requestScope.country == 'Romania' ? 'selected' : ''} value="Romania">
                                                Romania
                                            </option>

                                            <option ${requestScope.country == 'Russia' ? 'selected' : ''} value="Russia">
                                                Russia
                                            </option>

                                            <option ${requestScope.country == 'Rwanda' ? 'selected' : ''} value="Rwanda">
                                                Rwanda
                                            </option>

                                            <option ${requestScope.country == 'Saint Barthelemy' ? 'selected' : ''} value="Saint Barthelemy">
                                                Saint Barthelemy
                                            </option>

                                            <option ${requestScope.country == 'Saint Helena' ? 'selected' : ''} value="Saint Helena">
                                                Saint Helena
                                            </option>

                                            <option ${requestScope.country == 'Saint Kitts and Nevis' ? 'selected' : ''} value="Saint Kitts and Nevis">
                                                Saint Kitts and Nevis
                                            </option>

                                            <option ${requestScope.country == 'Saint Lucia' ? 'selected' : ''} value="Saint Lucia">
                                                Saint Lucia
                                            </option>

                                            <option ${requestScope.country == 'Saint Martin' ? 'selected' : ''} value="Saint Martin">
                                                Saint Martin
                                            </option>

                                            <option ${requestScope.country == 'Saint Pierre and Miquelon' ? 'selected' : ''} value="Saint Pierre and Miquelon">
                                                Saint Pierre and Miquelon
                                            </option>

                                            <option ${requestScope.country == 'Saint Vincent and the Grenadines' ? 'selected' : ''} value="Saint Vincent and the Grenadines">
                                                Saint Vincent and the Grenadines
                                            </option>

                                            <option ${requestScope.country == 'Samoa' ? 'selected' : ''} value="Samoa">
                                                Samoa
                                            </option>

                                            <option ${requestScope.country == 'San Marino' ? 'selected' : ''} value="San Marino">
                                                San Marino
                                            </option>

                                            <option ${requestScope.country == 'Sao Tome and Principe' ? 'selected' : ''} value="Sao Tome and Principe">
                                                Sao Tome and Principe
                                            </option>

                                            <option ${requestScope.country == 'Saudi Arabia' ? 'selected' : ''} value="Saudi Arabia">
                                                Saudi Arabia
                                            </option>

                                            <option ${requestScope.country == 'Senegal' ? 'selected' : ''} value="Senegal">
                                                Senegal
                                            </option>

                                            <option ${requestScope.country == 'Serbia' ? 'selected' : ''} value="Serbia">
                                                Serbia
                                            </option>

                                            <option ${requestScope.country == 'Seychelles' ? 'selected' : ''} value="Seychelles">
                                                Seychelles
                                            </option>

                                            <option ${requestScope.country == 'Sierra Leone' ? 'selected' : ''} value="Sierra Leone">
                                                Sierra Leone
                                            </option>

                                            <option ${requestScope.country == 'Singapore' ? 'selected' : ''} value="Singapore">
                                                Singapore
                                            </option>

                                            <option ${requestScope.country == 'Slovakia' ? 'selected' : ''} value="Slovakia">
                                                Slovakia
                                            </option>

                                            <option ${requestScope.country == 'Slovenia' ? 'selected' : ''} value="Slovenia">
                                                Slovenia
                                            </option>

                                            <option ${requestScope.country == 'Solomon Islands' ? 'selected' : ''} value="Solomon Islands">
                                                Solomon Islands
                                            </option>

                                            <option ${requestScope.country == 'Somalia' ? 'selected' : ''} value="Somalia">
                                                Somalia
                                            </option>

                                            <option ${requestScope.country == 'South Africa' ? 'selected' : ''} value="South Africa">
                                                South Africa
                                            </option>

                                            <option ${requestScope.country == 'South Georgia and the South Sandwich Islands' ? 'selected' : ''} value="South Georgia and the South Sandwich Islands">
                                                South Georgia and the South Sandwich Islands
                                            </option>

                                            <option ${requestScope.country == 'South Sudan' ? 'selected' : ''} value="South Sudan">
                                                South Sudan
                                            </option>

                                            <option ${requestScope.country == 'Spain' ? 'selected' : ''} value="Spain">
                                                Spain
                                            </option>

                                            <option ${requestScope.country == 'Sri Lanka' ? 'selected' : ''} value="Sri Lanka">
                                                Sri Lanka
                                            </option>

                                            <option ${requestScope.country == 'Sudan' ? 'selected' : ''} value="Sudan">
                                                Sudan
                                            </option>

                                            <option ${requestScope.country == 'Suriname' ? 'selected' : ''} value="Suriname">
                                                Suriname
                                            </option>

                                            <option ${requestScope.country == 'Svalbard and Jan Mayen' ? 'selected' : ''} value="Svalbard and Jan Mayen">
                                                Svalbard and Jan Mayen
                                            </option>

                                            <option ${requestScope.country == 'Swaziland' ? 'selected' : ''} value="Swaziland">
                                                Swaziland
                                            </option>

                                            <option ${requestScope.country == 'Sweden' ? 'selected' : ''} value="Sweden">
                                                Sweden
                                            </option>

                                            <option ${requestScope.country == 'Switzerland' ? 'selected' : ''} value="Switzerland">
                                                Switzerland
                                            </option>

                                            <option ${requestScope.country == 'Syria' ? 'selected' : ''} value="Syria">
                                                Syria
                                            </option>

                                            <option ${requestScope.country == 'Taiwan' ? 'selected' : ''} value="Taiwan">
                                                Taiwan
                                            </option>

                                            <option ${requestScope.country == 'Tajikistan' ? 'selected' : ''} value="Tajikistan">
                                                Tajikistan
                                            </option>

                                            <option ${requestScope.country == 'Tanzania' ? 'selected' : ''} value="Tanzania">
                                                Tanzania
                                            </option>

                                            <option ${requestScope.country == 'Thailand' ? 'selected' : ''} value="Thailand">
                                                Thailand
                                            </option>

                                            <option ${requestScope.country == 'Timor-Leste' ? 'selected' : ''} value="Timor-Leste">
                                                Timor-Leste
                                            </option>

                                            <option ${requestScope.country == 'Togo' ? 'selected' : ''} value="Togo">
                                                Togo
                                            </option>

                                            <option ${requestScope.country == 'Tokelau' ? 'selected' : ''} value="Tokelau">
                                                Tokelau
                                            </option>

                                            <option ${requestScope.country == 'Tonga' ? 'selected' : ''} value="Tonga">
                                                Tonga
                                            </option>

                                            <option ${requestScope.country == 'Trinidad and Tobago' ? 'selected' : ''} value="Trinidad and Tobago">
                                                Trinidad and Tobago
                                            </option>

                                            <option ${requestScope.country == 'Tunisia' ? 'selected' : ''} value="Tunisia">
                                                Tunisia
                                            </option>

                                            <option ${requestScope.country == 'Turkey' ? 'selected' : ''} value="Turkey">
                                                Turkey
                                            </option>

                                            <option ${requestScope.country == 'Turkmenistan' ? 'selected' : ''} value="Turkmenistan">
                                                Turkmenistan
                                            </option>

                                            <option ${requestScope.country == 'Turks and Caicos Islands' ? 'selected' : ''} value="Turks and Caicos Islands">
                                                Turks and Caicos Islands
                                            </option>

                                            <option ${requestScope.country == 'Tuvalu' ? 'selected' : ''} value="Tuvalu">
                                                Tuvalu
                                            </option>

                                            <option ${requestScope.country == 'Uganda' ? 'selected' : ''} value="Uganda">
                                                Uganda
                                            </option>

                                            <option ${requestScope.country == 'Ukraine' ? 'selected' : ''} value="Ukraine">
                                                Ukraine
                                            </option>

                                            <option ${requestScope.country == 'United Arab Emirates' ? 'selected' : ''} value="United Arab Emirates">
                                                United Arab Emirates
                                            </option>

                                            <option ${requestScope.country == 'United Kingdom' ? 'selected' : ''} value="United Kingdom">
                                                United Kingdom
                                            </option>

                                            <option ${requestScope.country == 'United States Minor Outlying Islands' ? 'selected' : ''} value="United States Minor Outlying Islands">
                                                United States Minor Outlying Islands
                                            </option>

                                            <option ${requestScope.country == 'Uruguay' ? 'selected' : ''} value="Uruguay">
                                                Uruguay
                                            </option>

                                            <option ${requestScope.country == 'Uzbekistan' ? 'selected' : ''} value="Uzbekistan">
                                                Uzbekistan
                                            </option>

                                            <option ${requestScope.country == 'Vanuatu' ? 'selected' : ''} value="Vanuatu">
                                                Vanuatu
                                            </option>

                                            <option ${requestScope.country == 'Venezuela' ? 'selected' : ''} value="Venezuela">
                                                Venezuela
                                            </option>

                                            <option ${requestScope.country == 'Vietnam' ? 'selected' : ''} value="Vietnam">
                                                Vietnam
                                            </option>

                                            <option ${requestScope.country == 'Virgin Islands, British' ? 'selected' : ''} value="Virgin Islands, British">
                                                Virgin Islands, British
                                            </option>

                                            <option ${requestScope.country == 'Virgin Islands, U.S.' ? 'selected' : ''} value="Virgin Islands, U.S.">
                                                Virgin Islands, U.S.
                                            </option>

                                            <option ${requestScope.country == 'Wallis and Futuna' ? 'selected' : ''} value="Wallis and Futuna">
                                                Wallis and Futuna
                                            </option>

                                            <option ${requestScope.country == 'Kosovo' ? 'selected' : ''} value="Kosovo">
                                                Kosovo
                                            </option>

                                            <option ${requestScope.country == 'Western Sahara' ? 'selected' : ''} value="Western Sahara">
                                                Western Sahara
                                            </option>

                                            <option ${requestScope.country == 'Yemen' ? 'selected' : ''} value="Yemen">
                                                Yemen
                                            </option>

                                            <option ${requestScope.country == 'Zambia' ? 'selected' : ''} value="Zambia">
                                                Zambia
                                            </option>

                                            <option ${requestScope.country == 'Zimbabwe' ? 'selected' : ''} value="Zimbabwe">
                                                Zimbabwe
                                            </option>
                                        </select>
                                    </div>
                                    <div class="col-lg-5">
                                        <label>Zip Code</label>
                                        <input type="text" name="zipcode" class="form-control" id="exampleInputUser" value="${requestScope.zipCode}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-5">
                                        <label>Phone Number</label>
                                        <input type="text" name="phonenumber" class="form-control" id="exampleInputUser" value="${requestScope.phoneNumber}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1" required="">
                            <label class="custom-control-label" for="customCheck1" checked="">Check here to indicates that I agree to <a href="#">Terms of Service</a> and <a href="#">Conditions</a>.</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </fieldset>
            </form>
            <br>
            <br>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
