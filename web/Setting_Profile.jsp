<%-- 
    Document   : Setting_Profile
    Created on : Nov 5, 2018, 8:51:33 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">Personal Setting</h5>
                            <a href="Setting_Profile" class="list-group-item list-group-item-action active"><i class="fas fa-user"></i> Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action"><i class="material-icons" style="font-size:16px">settings</i> Account</a>
                            <a href="Setting_Security" class="list-group-item list-group-item-action"><i class="material-icons" style="font-size:16px">security</i> Security</a>
                            <a href="Setting_OrderHistory" class="list-group-item list-group-item-action"><i class="fas fa-history"></i> Order History</a>
                        </div>
                    </div>
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">More Setting</h5>
                            <a href="Setting_Theme" class="list-group-item list-group-item-action"><i class="fas fa-paint-roller"></i> Theme</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <form action="Setting_Profile" method="post">
                        <fieldset>
                            <c:if test="${isProfileUpdated == true}">
                                <div class="alert alert-dismissible alert-success">
                                    <button type="button" class="close" data-bs-dismiss="alert">&times;</button>
                                    Your profile has been saved!
                                </div>
                            </c:if>
                            <h1>Profile</h1>
                            <hr>
                            <label>Your profile and shipping address will be used when checking out an order.</label>
                            <br>
                            <input type="hidden" value="" name="submit" />
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Username</label>
                                    <input type="text" class="form-control" id="exampleInputUser" value="${sessionScope.user.username}" disabled="">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>First Name</label>
                                    <input type="text" name="fname" class="form-control" id="exampleInputUser" value="${sessionScope.user.fname}">
                                </div>
                                <div class="col-lg-5">
                                    <label>Last Name</label>
                                    <input type="text" name="lname" class="form-control" id="exampleInputUser" value="${sessionScope.user.lname}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>City</label>
                                    <input type="text" name="city" class="form-control" id="exampleInputUser" value="${sessionScope.user.city}">
                                </div>
                                <div class="col-lg-5">
                                    <label>Address</label>
                                    <input type="text" name="address" class="form-control" id="exampleInputUser" value="${sessionScope.user.address}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Country</label>
                                    <select class="form-control" name="country" value="${requestScope.country}">
                                        <option ${sessionScope.user.country == 'United States' ? 'selected' : ''} value="United States">
                                            United States
                                        </option>

                                        <option ${sessionScope.user.country == 'Afghanistan' ? 'selected' : ''} value="Afghanistan">
                                            Afghanistan
                                        </option>

                                        <option ${sessionScope.user.country == 'Aland Islands' ? 'selected' : ''} value="Aland Islands">
                                            Aland Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Albania' ? 'selected' : ''} value="Albania">
                                            Albania
                                        </option>

                                        <option ${sessionScope.user.country == 'Algeria' ? 'selected' : ''} value="Algeria">
                                            Algeria
                                        </option>

                                        <option ${sessionScope.user.country == 'American Samoa' ? 'selected' : ''} value="American Samoa">
                                            American Samoa
                                        </option>

                                        <option ${sessionScope.user.country == 'Andorra' ? 'selected' : ''} value="Andorra">
                                            Andorra
                                        </option>

                                        <option ${sessionScope.user.country == 'Angola' ? 'selected' : ''} value="Angola">
                                            Angola
                                        </option>

                                        <option ${sessionScope.user.country == 'Anguilla' ? 'selected' : ''} value="Anguilla">
                                            Anguilla
                                        </option>

                                        <option ${sessionScope.user.country == 'Antarctica' ? 'selected' : ''} value="Antarctica">
                                            Antarctica
                                        </option>

                                        <option ${sessionScope.user.country == 'Antigua and Barbuda' ? 'selected' : ''} value="Antigua and Barbuda">
                                            Antigua and Barbuda
                                        </option>

                                        <option ${sessionScope.user.country == 'Argentina' ? 'selected' : ''} value="Argentina">
                                            Argentina
                                        </option>

                                        <option ${sessionScope.user.country == 'Armenia' ? 'selected' : ''} value="Armenia">
                                            Armenia
                                        </option>

                                        <option ${sessionScope.user.country == 'Aruba' ? 'selected' : ''} value="Aruba">
                                            Aruba
                                        </option>

                                        <option ${sessionScope.user.country == 'Australia' ? 'selected' : ''} value="Australia">
                                            Australia
                                        </option>

                                        <option ${sessionScope.user.country == 'Austria' ? 'selected' : ''} value="Austria">
                                            Austria
                                        </option>

                                        <option ${sessionScope.user.country == 'Azerbaijan' ? 'selected' : ''} value="Azerbaijan">
                                            Azerbaijan
                                        </option>

                                        <option ${sessionScope.user.country == 'Bahamas' ? 'selected' : ''} value="Bahamas">
                                            Bahamas
                                        </option>

                                        <option ${sessionScope.user.country == 'Bonaire, Sint Eustatius and Saba' ? 'selected' : ''} value="Bonaire, Sint Eustatius and Saba">
                                            Bonaire, Sint Eustatius and Saba
                                        </option>

                                        <option ${sessionScope.user.country == 'Bahrain' ? 'selected' : ''} value="Bahrain">
                                            Bahrain
                                        </option>

                                        <option ${sessionScope.user.country == 'Bangladesh' ? 'selected' : ''} value="Bangladesh">
                                            Bangladesh
                                        </option>

                                        <option ${sessionScope.user.country == 'Barbados' ? 'selected' : ''} value="Barbados">
                                            Barbados
                                        </option>

                                        <option ${sessionScope.user.country == 'Belarus' ? 'selected' : ''} value="Belarus">
                                            Belarus
                                        </option>

                                        <option ${sessionScope.user.country == 'Belgium' ? 'selected' : ''} value="Belgium">
                                            Belgium
                                        </option>

                                        <option ${sessionScope.user.country == 'Belize' ? 'selected' : ''} value="Belize">
                                            Belize
                                        </option>

                                        <option ${sessionScope.user.country == 'Benin' ? 'selected' : ''} value="Benin">
                                            Benin
                                        </option>

                                        <option ${sessionScope.user.country == 'Bermuda' ? 'selected' : ''} value="Bermuda">
                                            Bermuda
                                        </option>

                                        <option ${sessionScope.user.country == 'Bhutan' ? 'selected' : ''} value="Bhutan">
                                            Bhutan
                                        </option>

                                        <option ${sessionScope.user.country == 'Bolivia' ? 'selected' : ''} value="Bolivia">
                                            Bolivia
                                        </option>

                                        <option ${sessionScope.user.country == 'Bosnia and Herzegovina' ? 'selected' : ''} value="Bosnia and Herzegovina">
                                            Bosnia and Herzegovina
                                        </option>

                                        <option ${sessionScope.user.country == 'Botswana' ? 'selected' : ''} value="Botswana">
                                            Botswana
                                        </option>

                                        <option ${sessionScope.user.country == 'Bouvet Island' ? 'selected' : ''} value="Bouvet Island">
                                            Bouvet Island
                                        </option>

                                        <option ${sessionScope.user.country == 'Brazil' ? 'selected' : ''} value="Brazil">
                                            Brazil
                                        </option>

                                        <option ${sessionScope.user.country == 'British Indian Ocean Territory' ? 'selected' : ''} value="British Indian Ocean Territory">
                                            British Indian Ocean Territory
                                        </option>

                                        <option ${sessionScope.user.country == 'Brunei' ? 'selected' : ''} value="Brunei">
                                            Brunei
                                        </option>

                                        <option ${sessionScope.user.country == 'Bulgaria' ? 'selected' : ''} value="Bulgaria">
                                            Bulgaria
                                        </option>

                                        <option ${sessionScope.user.country == 'Burkina Faso' ? 'selected' : ''} value="Burkina Faso">
                                            Burkina Faso
                                        </option>

                                        <option ${sessionScope.user.country == 'Burundi' ? 'selected' : ''} value="Burundi">
                                            Burundi
                                        </option>

                                        <option ${sessionScope.user.country == 'Cambodia' ? 'selected' : ''} value="Cambodia">
                                            Cambodia
                                        </option>

                                        <option ${sessionScope.user.country == 'Cameroon' ? 'selected' : ''} value="Cameroon">
                                            Cameroon
                                        </option>

                                        <option ${sessionScope.user.country == 'Canada' ? 'selected' : ''} value="Canada">
                                            Canada
                                        </option>

                                        <option ${sessionScope.user.country == 'Cape Verde' ? 'selected' : ''} value="Cape Verde">
                                            Cape Verde
                                        </option>

                                        <option ${sessionScope.user.country == 'Cayman Islands' ? 'selected' : ''} value="Cayman Islands">
                                            Cayman Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Central African Republic' ? 'selected' : ''} value="Central African Republic">
                                            Central African Republic
                                        </option>

                                        <option ${sessionScope.user.country == 'Chad' ? 'selected' : ''} value="Chad">
                                            Chad
                                        </option>

                                        <option ${sessionScope.user.country == 'Chile' ? 'selected' : ''} value="Chile">
                                            Chile
                                        </option>

                                        <option ${sessionScope.user.country == 'China' ? 'selected' : ''} value="China">
                                            China
                                        </option>

                                        <option ${sessionScope.user.country == 'Christmas Island' ? 'selected' : ''} value="Christmas Island">
                                            Christmas Island
                                        </option>

                                        <option ${sessionScope.user.country == 'Cocos (Keeling) Islands' ? 'selected' : ''} value="Cocos (Keeling) Islands">
                                            Cocos (Keeling) Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Colombia' ? 'selected' : ''} value="Colombia">
                                            Colombia
                                        </option>

                                        <option ${sessionScope.user.country == 'Comoros' ? 'selected' : ''} value="Comoros">
                                            Comoros
                                        </option>

                                        <option ${sessionScope.user.country == 'Congo' ? 'selected' : ''} value="Congo">
                                            Congo
                                        </option>

                                        <option ${sessionScope.user.country == 'Congo, The Democratic Republic of the' ? 'selected' : ''} value="Congo, The Democratic Republic of the">
                                            Congo, The Democratic Republic of the
                                        </option>

                                        <option ${sessionScope.user.country == 'Cook Islands' ? 'selected' : ''} value="Cook Islands">
                                            Cook Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Costa Rica' ? 'selected' : ''} value="Costa Rica">
                                            Costa Rica
                                        </option>

                                        <option ${sessionScope.user.country == 'Cote d\'Ivoire' ? 'selected' : ''} value="Cote d'Ivoire">
                                            Cote d'Ivoire
                                        </option>

                                        <option ${sessionScope.user.country == 'Croatia' ? 'selected' : ''} value="Croatia">
                                            Croatia
                                        </option>

                                        <option ${sessionScope.user.country == 'Cuba' ? 'selected' : ''} value="Cuba">
                                            Cuba
                                        </option>

                                        <option ${sessionScope.user.country == 'Cyprus' ? 'selected' : ''} value="Cyprus">
                                            Cyprus
                                        </option>

                                        <option ${sessionScope.user.country == 'Czech Republic' ? 'selected' : ''} value="Czech Republic">
                                            Czech Republic
                                        </option>

                                        <option ${sessionScope.user.country == 'Denmark' ? 'selected' : ''} value="Denmark">
                                            Denmark
                                        </option>

                                        <option ${sessionScope.user.country == 'Djibouti' ? 'selected' : ''} value="Djibouti">
                                            Djibouti
                                        </option>

                                        <option ${sessionScope.user.country == 'Dominica' ? 'selected' : ''} value="Dominica">
                                            Dominica
                                        </option>

                                        <option ${sessionScope.user.country == 'Dominican Republic' ? 'selected' : ''} value="Dominican Republic">
                                            Dominican Republic
                                        </option>

                                        <option ${sessionScope.user.country == 'Ecuador' ? 'selected' : ''} value="Ecuador">
                                            Ecuador
                                        </option>

                                        <option ${sessionScope.user.country == 'Egypt' ? 'selected' : ''} value="Egypt">
                                            Egypt
                                        </option>

                                        <option ${sessionScope.user.country == 'El Salvador' ? 'selected' : ''} value="El Salvador">
                                            El Salvador
                                        </option>

                                        <option ${sessionScope.user.country == 'Equatorial Guinea' ? 'selected' : ''} value="Equatorial Guinea">
                                            Equatorial Guinea
                                        </option>

                                        <option ${sessionScope.user.country == 'Eritrea' ? 'selected' : ''} value="Eritrea">
                                            Eritrea
                                        </option>

                                        <option ${sessionScope.user.country == 'Estonia' ? 'selected' : ''} value="Estonia">
                                            Estonia
                                        </option>

                                        <option ${sessionScope.user.country == 'Ethiopia' ? 'selected' : ''} value="Ethiopia">
                                            Ethiopia
                                        </option>

                                        <option ${sessionScope.user.country == 'Falkland Islands (Malvinas)' ? 'selected' : ''} value="Falkland Islands (Malvinas)">
                                            Falkland Islands (Malvinas)
                                        </option>

                                        <option ${sessionScope.user.country == 'Faroe Islands' ? 'selected' : ''} value="Faroe Islands">
                                            Faroe Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Fiji' ? 'selected' : ''} value="Fiji">
                                            Fiji
                                        </option>

                                        <option ${sessionScope.user.country == 'Finland' ? 'selected' : ''} value="Finland">
                                            Finland
                                        </option>

                                        <option ${sessionScope.user.country == 'France' ? 'selected' : ''} value="France">
                                            France
                                        </option>

                                        <option ${sessionScope.user.country == 'French Guiana' ? 'selected' : ''} value="French Guiana">
                                            French Guiana
                                        </option>

                                        <option ${sessionScope.user.country == 'French Polynesia' ? 'selected' : ''} value="French Polynesia">
                                            French Polynesia
                                        </option>

                                        <option ${sessionScope.user.country == 'French Southern Territories' ? 'selected' : ''} value="French Southern Territories">
                                            French Southern Territories
                                        </option>

                                        <option ${sessionScope.user.country == 'Gabon' ? 'selected' : ''} value="Gabon">
                                            Gabon
                                        </option>

                                        <option ${sessionScope.user.country == 'Gambia' ? 'selected' : ''} value="Gambia">
                                            Gambia
                                        </option>

                                        <option ${sessionScope.user.country == 'Georgia' ? 'selected' : ''} value="Georgia">
                                            Georgia
                                        </option>

                                        <option ${sessionScope.user.country == 'Germany' ? 'selected' : ''} value="Germany">
                                            Germany
                                        </option>

                                        <option ${sessionScope.user.country == 'Ghana' ? 'selected' : ''} value="Ghana">
                                            Ghana
                                        </option>

                                        <option ${sessionScope.user.country == 'Gibraltar' ? 'selected' : ''} value="Gibraltar">
                                            Gibraltar
                                        </option>

                                        <option ${sessionScope.user.country == 'Greece' ? 'selected' : ''} value="Greece">
                                            Greece
                                        </option>

                                        <option ${sessionScope.user.country == 'Greenland' ? 'selected' : ''} value="Greenland">
                                            Greenland
                                        </option>

                                        <option ${sessionScope.user.country == 'Grenada' ? 'selected' : ''} value="Grenada">
                                            Grenada
                                        </option>

                                        <option ${sessionScope.user.country == 'Guadeloupe' ? 'selected' : ''} value="Guadeloupe">
                                            Guadeloupe
                                        </option>

                                        <option ${sessionScope.user.country == 'Guam' ? 'selected' : ''} value="Guam">
                                            Guam
                                        </option>

                                        <option ${sessionScope.user.country == 'Guatemala' ? 'selected' : ''} value="Guatemala">
                                            Guatemala
                                        </option>

                                        <option ${sessionScope.user.country == 'Guernsey' ? 'selected' : ''} value="Guernsey">
                                            Guernsey
                                        </option>

                                        <option ${sessionScope.user.country == 'Guinea' ? 'selected' : ''} value="Guinea">
                                            Guinea
                                        </option>

                                        <option ${sessionScope.user.country == 'Guinea-Bissau' ? 'selected' : ''} value="Guinea-Bissau">
                                            Guinea-Bissau
                                        </option>

                                        <option ${sessionScope.user.country == 'Guyana' ? 'selected' : ''} value="Guyana">
                                            Guyana
                                        </option>

                                        <option ${sessionScope.user.country == 'Haiti' ? 'selected' : ''} value="Haiti">
                                            Haiti
                                        </option>

                                        <option ${sessionScope.user.country == 'Heard Island and McDonald Islands' ? 'selected' : ''} value="Heard Island and McDonald Islands">
                                            Heard Island and McDonald Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Vatican City' ? 'selected' : ''} value="Vatican City">
                                            Vatican City
                                        </option>

                                        <option ${sessionScope.user.country == 'Honduras' ? 'selected' : ''} value="Honduras">
                                            Honduras
                                        </option>

                                        <option ${sessionScope.user.country == 'Hong Kong' ? 'selected' : ''} value="Hong Kong">
                                            Hong Kong
                                        </option>

                                        <option ${sessionScope.user.country == 'Hungary' ? 'selected' : ''} value="Hungary">
                                            Hungary
                                        </option>

                                        <option ${sessionScope.user.country == 'Iceland' ? 'selected' : ''} value="Iceland">
                                            Iceland
                                        </option>

                                        <option ${sessionScope.user.country == 'India' ? 'selected' : ''} value="India">
                                            India
                                        </option>

                                        <option ${sessionScope.user.country == 'Indonesia' ? 'selected' : ''} value="Indonesia">
                                            Indonesia
                                        </option>

                                        <option ${sessionScope.user.country == 'Iran' ? 'selected' : ''} value="Iran">
                                            Iran
                                        </option>

                                        <option ${sessionScope.user.country == 'Iraq' ? 'selected' : ''} value="Iraq">
                                            Iraq
                                        </option>

                                        <option ${sessionScope.user.country == 'Ireland' ? 'selected' : ''} value="Ireland">
                                            Ireland
                                        </option>

                                        <option ${sessionScope.user.country == 'Isle of Man' ? 'selected' : ''} value="Isle of Man">
                                            Isle of Man
                                        </option>

                                        <option ${sessionScope.user.country == 'Israel' ? 'selected' : ''} value="Israel">
                                            Israel
                                        </option>

                                        <option ${sessionScope.user.country == 'Italy' ? 'selected' : ''} value="Italy">
                                            Italy
                                        </option>

                                        <option ${sessionScope.user.country == 'Jamaica' ? 'selected' : ''} value="Jamaica">
                                            Jamaica
                                        </option>

                                        <option ${sessionScope.user.country == 'Japan' ? 'selected' : ''} value="Japan">
                                            Japan
                                        </option>

                                        <option ${sessionScope.user.country == 'Jersey' ? 'selected' : ''} value="Jersey">
                                            Jersey
                                        </option>

                                        <option ${sessionScope.user.country == 'Jordan' ? 'selected' : ''} value="Jordan">
                                            Jordan
                                        </option>

                                        <option ${sessionScope.user.country == 'Kazakhstan' ? 'selected' : ''} value="Kazakhstan">
                                            Kazakhstan
                                        </option>

                                        <option ${sessionScope.user.country == 'Kenya' ? 'selected' : ''} value="Kenya">
                                            Kenya
                                        </option>

                                        <option ${sessionScope.user.country == 'Kiribati' ? 'selected' : ''} value="Kiribati">
                                            Kiribati
                                        </option>

                                        <option ${sessionScope.user.country == 'North Korea' ? 'selected' : ''} value="North Korea">
                                            North Korea
                                        </option>

                                        <option ${sessionScope.user.country == 'South Korea' ? 'selected' : ''} value="South Korea">
                                            South Korea
                                        </option>

                                        <option ${sessionScope.user.country == 'Kuwait' ? 'selected' : ''} value="Kuwait">
                                            Kuwait
                                        </option>

                                        <option ${sessionScope.user.country == 'Kyrgyzstan' ? 'selected' : ''} value="Kyrgyzstan">
                                            Kyrgyzstan
                                        </option>

                                        <option ${sessionScope.user.country == 'Laos' ? 'selected' : ''} value="Laos">
                                            Laos
                                        </option>

                                        <option ${sessionScope.user.country == 'Latvia' ? 'selected' : ''} value="Latvia">
                                            Latvia
                                        </option>

                                        <option ${sessionScope.user.country == 'Lebanon' ? 'selected' : ''} value="Lebanon">
                                            Lebanon
                                        </option>

                                        <option ${sessionScope.user.country == 'Lesotho' ? 'selected' : ''} value="Lesotho">
                                            Lesotho
                                        </option>

                                        <option ${sessionScope.user.country == 'Liberia' ? 'selected' : ''} value="Liberia">
                                            Liberia
                                        </option>

                                        <option ${sessionScope.user.country == 'Libya' ? 'selected' : ''} value="Libya">
                                            Libya
                                        </option>

                                        <option ${sessionScope.user.country == 'Liechtenstein' ? 'selected' : ''} value="Liechtenstein">
                                            Liechtenstein
                                        </option>

                                        <option ${sessionScope.user.country == 'Lithuania' ? 'selected' : ''} value="Lithuania">
                                            Lithuania
                                        </option>

                                        <option ${sessionScope.user.country == 'Luxembourg' ? 'selected' : ''} value="Luxembourg">
                                            Luxembourg
                                        </option>

                                        <option ${sessionScope.user.country == 'Macao' ? 'selected' : ''} value="Macao">
                                            Macao
                                        </option>

                                        <option ${sessionScope.user.country == 'Macedonia, The Former Yugoslav Republic of' ? 'selected' : ''} value="Macedonia, The Former Yugoslav Republic of">
                                            Macedonia, The Former Yugoslav Republic of
                                        </option>

                                        <option ${sessionScope.user.country == 'Madagascar' ? 'selected' : ''} value="Madagascar">
                                            Madagascar
                                        </option>

                                        <option ${sessionScope.user.country == 'Malawi' ? 'selected' : ''} value="Malawi">
                                            Malawi
                                        </option>

                                        <option ${sessionScope.user.country == 'Malaysia' ? 'selected' : ''} value="Malaysia">
                                            Malaysia
                                        </option>

                                        <option ${sessionScope.user.country == 'Maldives' ? 'selected' : ''} value="Maldives">
                                            Maldives
                                        </option>

                                        <option ${sessionScope.user.country == 'Mali' ? 'selected' : ''} value="Mali">
                                            Mali
                                        </option>

                                        <option ${sessionScope.user.country == 'Malta' ? 'selected' : ''} value="Malta">
                                            Malta
                                        </option>

                                        <option ${sessionScope.user.country == 'Marshall Islands' ? 'selected' : ''} value="Marshall Islands">
                                            Marshall Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Martinique' ? 'selected' : ''} value="Martinique">
                                            Martinique
                                        </option>

                                        <option ${sessionScope.user.country == 'Mauritania' ? 'selected' : ''} value="Mauritania">
                                            Mauritania
                                        </option>

                                        <option ${sessionScope.user.country == 'Mauritius' ? 'selected' : ''} value="Mauritius">
                                            Mauritius
                                        </option>

                                        <option ${sessionScope.user.country == 'Mayotte' ? 'selected' : ''} value="Mayotte">
                                            Mayotte
                                        </option>

                                        <option ${sessionScope.user.country == 'Mexico' ? 'selected' : ''} value="Mexico">
                                            Mexico
                                        </option>

                                        <option ${sessionScope.user.country == 'Micronesia, Federated States of' ? 'selected' : ''} value="Micronesia, Federated States of">
                                            Micronesia, Federated States of
                                        </option>

                                        <option ${sessionScope.user.country == 'Moldova' ? 'selected' : ''} value="Moldova">
                                            Moldova
                                        </option>

                                        <option ${sessionScope.user.country == 'Monaco' ? 'selected' : ''} value="Monaco">
                                            Monaco
                                        </option>

                                        <option ${sessionScope.user.country == 'Mongolia' ? 'selected' : ''} value="Mongolia">
                                            Mongolia
                                        </option>

                                        <option ${sessionScope.user.country == 'Montenegro' ? 'selected' : ''} value="Montenegro">
                                            Montenegro
                                        </option>

                                        <option ${sessionScope.user.country == 'Montserrat' ? 'selected' : ''} value="Montserrat">
                                            Montserrat
                                        </option>

                                        <option ${sessionScope.user.country == 'Morocco' ? 'selected' : ''} value="Morocco">
                                            Morocco
                                        </option>

                                        <option ${sessionScope.user.country == 'Mozambique' ? 'selected' : ''} value="Mozambique">
                                            Mozambique
                                        </option>

                                        <option ${sessionScope.user.country == 'Myanmar' ? 'selected' : ''} value="Myanmar">
                                            Myanmar
                                        </option>

                                        <option ${sessionScope.user.country == 'Namibia' ? 'selected' : ''} value="Namibia">
                                            Namibia
                                        </option>

                                        <option ${sessionScope.user.country == 'Nauru' ? 'selected' : ''} value="Nauru">
                                            Nauru
                                        </option>

                                        <option ${sessionScope.user.country == 'Nepal' ? 'selected' : ''} value="Nepal">
                                            Nepal
                                        </option>

                                        <option ${sessionScope.user.country == 'Netherlands' ? 'selected' : ''} value="Netherlands">
                                            Netherlands
                                        </option>

                                        <option ${sessionScope.user.country == 'Netherlands Antilles' ? 'selected' : ''} value="Netherlands Antilles">
                                            Netherlands Antilles
                                        </option>

                                        <option ${sessionScope.user.country == 'New Caledonia' ? 'selected' : ''} value="New Caledonia">
                                            New Caledonia
                                        </option>

                                        <option ${sessionScope.user.country == 'New Zealand' ? 'selected' : ''} value="New Zealand">
                                            New Zealand
                                        </option>

                                        <option ${sessionScope.user.country == 'Nicaragua' ? 'selected' : ''} value="Nicaragua">
                                            Nicaragua
                                        </option>

                                        <option ${sessionScope.user.country == 'Niger' ? 'selected' : ''} value="Niger">
                                            Niger
                                        </option>

                                        <option ${sessionScope.user.country == 'Nigeria' ? 'selected' : ''} value="Nigeria">
                                            Nigeria
                                        </option>

                                        <option ${sessionScope.user.country == 'Niue' ? 'selected' : ''} value="Niue">
                                            Niue
                                        </option>

                                        <option ${sessionScope.user.country == 'Norfolk Island' ? 'selected' : ''} value="Norfolk Island">
                                            Norfolk Island
                                        </option>

                                        <option ${sessionScope.user.country == 'Northern Mariana Islands' ? 'selected' : ''} value="Northern Mariana Islands">
                                            Northern Mariana Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Norway' ? 'selected' : ''} value="Norway">
                                            Norway
                                        </option>

                                        <option ${sessionScope.user.country == 'Oman' ? 'selected' : ''} value="Oman">
                                            Oman
                                        </option>

                                        <option ${sessionScope.user.country == 'Pakistan' ? 'selected' : ''} value="Pakistan">
                                            Pakistan
                                        </option>

                                        <option ${sessionScope.user.country == 'Palau' ? 'selected' : ''} value="Palau">
                                            Palau
                                        </option>

                                        <option ${sessionScope.user.country == 'Palestine, State of' ? 'selected' : ''} value="Palestine, State of">
                                            Palestine, State of
                                        </option>

                                        <option ${sessionScope.user.country == 'Panama' ? 'selected' : ''} value="Panama">
                                            Panama
                                        </option>

                                        <option ${sessionScope.user.country == 'Papua New Guinea' ? 'selected' : ''} value="Papua New Guinea">
                                            Papua New Guinea
                                        </option>

                                        <option ${sessionScope.user.country == 'Paraguay' ? 'selected' : ''} value="Paraguay">
                                            Paraguay
                                        </option>

                                        <option ${sessionScope.user.country == 'Peru' ? 'selected' : ''} value="Peru">
                                            Peru
                                        </option>

                                        <option ${sessionScope.user.country == 'Philippines' ? 'selected' : ''} value="Philippines">
                                            Philippines
                                        </option>

                                        <option ${sessionScope.user.country == 'Pitcairn' ? 'selected' : ''} value="Pitcairn">
                                            Pitcairn
                                        </option>

                                        <option ${sessionScope.user.country == 'Poland' ? 'selected' : ''} value="Poland">
                                            Poland
                                        </option>

                                        <option ${sessionScope.user.country == 'Portugal' ? 'selected' : ''} value="Portugal">
                                            Portugal
                                        </option>

                                        <option ${sessionScope.user.country == 'Puerto Rico' ? 'selected' : ''} value="Puerto Rico">
                                            Puerto Rico
                                        </option>

                                        <option ${sessionScope.user.country == 'Qatar' ? 'selected' : ''} value="Qatar">
                                            Qatar
                                        </option>

                                        <option ${sessionScope.user.country == 'Reunion' ? 'selected' : ''} value="Reunion">
                                            Reunion
                                        </option>

                                        <option ${sessionScope.user.country == 'Romania' ? 'selected' : ''} value="Romania">
                                            Romania
                                        </option>

                                        <option ${sessionScope.user.country == 'Russia' ? 'selected' : ''} value="Russia">
                                            Russia
                                        </option>

                                        <option ${sessionScope.user.country == 'Rwanda' ? 'selected' : ''} value="Rwanda">
                                            Rwanda
                                        </option>

                                        <option ${sessionScope.user.country == 'Saint Barthelemy' ? 'selected' : ''} value="Saint Barthelemy">
                                            Saint Barthelemy
                                        </option>

                                        <option ${sessionScope.user.country == 'Saint Helena' ? 'selected' : ''} value="Saint Helena">
                                            Saint Helena
                                        </option>

                                        <option ${sessionScope.user.country == 'Saint Kitts and Nevis' ? 'selected' : ''} value="Saint Kitts and Nevis">
                                            Saint Kitts and Nevis
                                        </option>

                                        <option ${sessionScope.user.country == 'Saint Lucia' ? 'selected' : ''} value="Saint Lucia">
                                            Saint Lucia
                                        </option>

                                        <option ${sessionScope.user.country == 'Saint Martin' ? 'selected' : ''} value="Saint Martin">
                                            Saint Martin
                                        </option>

                                        <option ${sessionScope.user.country == 'Saint Pierre and Miquelon' ? 'selected' : ''} value="Saint Pierre and Miquelon">
                                            Saint Pierre and Miquelon
                                        </option>

                                        <option ${sessionScope.user.country == 'Saint Vincent and the Grenadines' ? 'selected' : ''} value="Saint Vincent and the Grenadines">
                                            Saint Vincent and the Grenadines
                                        </option>

                                        <option ${sessionScope.user.country == 'Samoa' ? 'selected' : ''} value="Samoa">
                                            Samoa
                                        </option>

                                        <option ${sessionScope.user.country == 'San Marino' ? 'selected' : ''} value="San Marino">
                                            San Marino
                                        </option>

                                        <option ${sessionScope.user.country == 'Sao Tome and Principe' ? 'selected' : ''} value="Sao Tome and Principe">
                                            Sao Tome and Principe
                                        </option>

                                        <option ${sessionScope.user.country == 'Saudi Arabia' ? 'selected' : ''} value="Saudi Arabia">
                                            Saudi Arabia
                                        </option>

                                        <option ${sessionScope.user.country == 'Senegal' ? 'selected' : ''} value="Senegal">
                                            Senegal
                                        </option>

                                        <option ${sessionScope.user.country == 'Serbia' ? 'selected' : ''} value="Serbia">
                                            Serbia
                                        </option>

                                        <option ${sessionScope.user.country == 'Seychelles' ? 'selected' : ''} value="Seychelles">
                                            Seychelles
                                        </option>

                                        <option ${sessionScope.user.country == 'Sierra Leone' ? 'selected' : ''} value="Sierra Leone">
                                            Sierra Leone
                                        </option>

                                        <option ${sessionScope.user.country == 'Singapore' ? 'selected' : ''} value="Singapore">
                                            Singapore
                                        </option>

                                        <option ${sessionScope.user.country == 'Slovakia' ? 'selected' : ''} value="Slovakia">
                                            Slovakia
                                        </option>

                                        <option ${sessionScope.user.country == 'Slovenia' ? 'selected' : ''} value="Slovenia">
                                            Slovenia
                                        </option>

                                        <option ${sessionScope.user.country == 'Solomon Islands' ? 'selected' : ''} value="Solomon Islands">
                                            Solomon Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Somalia' ? 'selected' : ''} value="Somalia">
                                            Somalia
                                        </option>

                                        <option ${sessionScope.user.country == 'South Africa' ? 'selected' : ''} value="South Africa">
                                            South Africa
                                        </option>

                                        <option ${sessionScope.user.country == 'South Georgia and the South Sandwich Islands' ? 'selected' : ''} value="South Georgia and the South Sandwich Islands">
                                            South Georgia and the South Sandwich Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'South Sudan' ? 'selected' : ''} value="South Sudan">
                                            South Sudan
                                        </option>

                                        <option ${sessionScope.user.country == 'Spain' ? 'selected' : ''} value="Spain">
                                            Spain
                                        </option>

                                        <option ${sessionScope.user.country == 'Sri Lanka' ? 'selected' : ''} value="Sri Lanka">
                                            Sri Lanka
                                        </option>

                                        <option ${sessionScope.user.country == 'Sudan' ? 'selected' : ''} value="Sudan">
                                            Sudan
                                        </option>

                                        <option ${sessionScope.user.country == 'Suriname' ? 'selected' : ''} value="Suriname">
                                            Suriname
                                        </option>

                                        <option ${sessionScope.user.country == 'Svalbard and Jan Mayen' ? 'selected' : ''} value="Svalbard and Jan Mayen">
                                            Svalbard and Jan Mayen
                                        </option>

                                        <option ${sessionScope.user.country == 'Swaziland' ? 'selected' : ''} value="Swaziland">
                                            Swaziland
                                        </option>

                                        <option ${sessionScope.user.country == 'Sweden' ? 'selected' : ''} value="Sweden">
                                            Sweden
                                        </option>

                                        <option ${sessionScope.user.country == 'Switzerland' ? 'selected' : ''} value="Switzerland">
                                            Switzerland
                                        </option>

                                        <option ${sessionScope.user.country == 'Syria' ? 'selected' : ''} value="Syria">
                                            Syria
                                        </option>

                                        <option ${sessionScope.user.country == 'Taiwan' ? 'selected' : ''} value="Taiwan">
                                            Taiwan
                                        </option>

                                        <option ${sessionScope.user.country == 'Tajikistan' ? 'selected' : ''} value="Tajikistan">
                                            Tajikistan
                                        </option>

                                        <option ${sessionScope.user.country == 'Tanzania' ? 'selected' : ''} value="Tanzania">
                                            Tanzania
                                        </option>

                                        <option ${sessionScope.user.country == 'Thailand' ? 'selected' : ''} value="Thailand">
                                            Thailand
                                        </option>

                                        <option ${sessionScope.user.country == 'Timor-Leste' ? 'selected' : ''} value="Timor-Leste">
                                            Timor-Leste
                                        </option>

                                        <option ${sessionScope.user.country == 'Togo' ? 'selected' : ''} value="Togo">
                                            Togo
                                        </option>

                                        <option ${sessionScope.user.country == 'Tokelau' ? 'selected' : ''} value="Tokelau">
                                            Tokelau
                                        </option>

                                        <option ${sessionScope.user.country == 'Tonga' ? 'selected' : ''} value="Tonga">
                                            Tonga
                                        </option>

                                        <option ${sessionScope.user.country == 'Trinidad and Tobago' ? 'selected' : ''} value="Trinidad and Tobago">
                                            Trinidad and Tobago
                                        </option>

                                        <option ${sessionScope.user.country == 'Tunisia' ? 'selected' : ''} value="Tunisia">
                                            Tunisia
                                        </option>

                                        <option ${sessionScope.user.country == 'Turkey' ? 'selected' : ''} value="Turkey">
                                            Turkey
                                        </option>

                                        <option ${sessionScope.user.country == 'Turkmenistan' ? 'selected' : ''} value="Turkmenistan">
                                            Turkmenistan
                                        </option>

                                        <option ${sessionScope.user.country == 'Turks and Caicos Islands' ? 'selected' : ''} value="Turks and Caicos Islands">
                                            Turks and Caicos Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Tuvalu' ? 'selected' : ''} value="Tuvalu">
                                            Tuvalu
                                        </option>

                                        <option ${sessionScope.user.country == 'Uganda' ? 'selected' : ''} value="Uganda">
                                            Uganda
                                        </option>

                                        <option ${sessionScope.user.country == 'Ukraine' ? 'selected' : ''} value="Ukraine">
                                            Ukraine
                                        </option>

                                        <option ${sessionScope.user.country == 'United Arab Emirates' ? 'selected' : ''} value="United Arab Emirates">
                                            United Arab Emirates
                                        </option>

                                        <option ${sessionScope.user.country == 'United Kingdom' ? 'selected' : ''} value="United Kingdom">
                                            United Kingdom
                                        </option>

                                        <option ${sessionScope.user.country == 'United States Minor Outlying Islands' ? 'selected' : ''} value="United States Minor Outlying Islands">
                                            United States Minor Outlying Islands
                                        </option>

                                        <option ${sessionScope.user.country == 'Uruguay' ? 'selected' : ''} value="Uruguay">
                                            Uruguay
                                        </option>

                                        <option ${sessionScope.user.country == 'Uzbekistan' ? 'selected' : ''} value="Uzbekistan">
                                            Uzbekistan
                                        </option>

                                        <option ${sessionScope.user.country == 'Vanuatu' ? 'selected' : ''} value="Vanuatu">
                                            Vanuatu
                                        </option>

                                        <option ${sessionScope.user.country == 'Venezuela' ? 'selected' : ''} value="Venezuela">
                                            Venezuela
                                        </option>

                                        <option ${sessionScope.user.country == 'Vietnam' ? 'selected' : ''} value="Vietnam">
                                            Vietnam
                                        </option>

                                        <option ${sessionScope.user.country == 'Virgin Islands, British' ? 'selected' : ''} value="Virgin Islands, British">
                                            Virgin Islands, British
                                        </option>

                                        <option ${sessionScope.user.country == 'Virgin Islands, U.S.' ? 'selected' : ''} value="Virgin Islands, U.S.">
                                            Virgin Islands, U.S.
                                        </option>

                                        <option ${sessionScope.user.country == 'Wallis and Futuna' ? 'selected' : ''} value="Wallis and Futuna">
                                            Wallis and Futuna
                                        </option>

                                        <option ${sessionScope.user.country == 'Kosovo' ? 'selected' : ''} value="Kosovo">
                                            Kosovo
                                        </option>

                                        <option ${sessionScope.user.country == 'Western Sahara' ? 'selected' : ''} value="Western Sahara">
                                            Western Sahara
                                        </option>

                                        <option ${sessionScope.user.country == 'Yemen' ? 'selected' : ''} value="Yemen">
                                            Yemen
                                        </option>

                                        <option ${sessionScope.user.country == 'Zambia' ? 'selected' : ''} value="Zambia">
                                            Zambia
                                        </option>

                                        <option ${sessionScope.user.country == 'Zimbabwe' ? 'selected' : ''} value="Zimbabwe">
                                            Zimbabwe
                                        </option>
                                    </select>
                                </div>
                                <div class="col-lg-5">
                                    <label>Zip Code</label>
                                    <input type="text" name="zipcode" class="form-control" id="exampleInputUser" value="${sessionScope.user.zipCode}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Phone Number</label>
                                    <input type="text" name="phonenumber" class="form-control" id="exampleInputUser" value="${sessionScope.user.phoneNumber}">
                                </div>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-success">Update Profile</button>
                        </fieldset>
                    </form>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
