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
                            <a href="ViewCart" class="list-group-item list-group-item-action"><i class="fas fa-shopping-cart"></i> Shopping Cart</a>
                            <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-history"></i> Purchase History</a>
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
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
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
                                    <label>State</label>
                                    <input type="text" name="state" class="form-control" id="exampleInputUser" value="${sessionScope.user.userState}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Address</label>
                                    <input type="text" name="address" class="form-control" id="exampleInputUser" value="${sessionScope.user.address}">
                                </div>
                                <div class="col-lg-5">
                                    <label>Country</label>
                                    <select class="form-control" name="country" value="${sessionScope.user.country}">
                                        <option value="United States">
                                            United States
                                        </option>

                                        <option value="Afghanistan">
                                            Afghanistan
                                        </option>

                                        <option value="Aland Islands">
                                            Aland Islands
                                        </option>

                                        <option value="Albania">
                                            Albania
                                        </option>

                                        <option value="Algeria">
                                            Algeria
                                        </option>

                                        <option value="American Samoa">
                                            American Samoa
                                        </option>

                                        <option value="Andorra">
                                            Andorra
                                        </option>

                                        <option value="Angola">
                                            Angola
                                        </option>

                                        <option value="Anguilla">
                                            Anguilla
                                        </option>

                                        <option value="Antarctica">
                                            Antarctica
                                        </option>

                                        <option value="Antigua and Barbuda">
                                            Antigua and Barbuda
                                        </option>

                                        <option value="Argentina">
                                            Argentina
                                        </option>

                                        <option value="Armenia">
                                            Armenia
                                        </option>

                                        <option value="Aruba">
                                            Aruba
                                        </option>

                                        <option value="Australia">
                                            Australia
                                        </option>

                                        <option value="Austria">
                                            Austria
                                        </option>

                                        <option value="Azerbaijan">
                                            Azerbaijan
                                        </option>

                                        <option value="Bahamas">
                                            Bahamas
                                        </option>

                                        <option value="Bonaire, Sint Eustatius and Saba">
                                            Bonaire, Sint Eustatius and Saba
                                        </option>

                                        <option value="Bahrain">
                                            Bahrain
                                        </option>

                                        <option value="Bangladesh">
                                            Bangladesh
                                        </option>

                                        <option value="Barbados">
                                            Barbados
                                        </option>

                                        <option value="Belarus">
                                            Belarus
                                        </option>

                                        <option value="Belgium">
                                            Belgium
                                        </option>

                                        <option value="Belize">
                                            Belize
                                        </option>

                                        <option value="Benin">
                                            Benin
                                        </option>

                                        <option value="Bermuda">
                                            Bermuda
                                        </option>

                                        <option value="Bhutan">
                                            Bhutan
                                        </option>

                                        <option value="Bolivia">
                                            Bolivia
                                        </option>

                                        <option value="Bosnia and Herzegovina">
                                            Bosnia and Herzegovina
                                        </option>

                                        <option value="Botswana">
                                            Botswana
                                        </option>

                                        <option value="Bouvet Island">
                                            Bouvet Island
                                        </option>

                                        <option value="Brazil">
                                            Brazil
                                        </option>

                                        <option value="British Indian Ocean Territory">
                                            British Indian Ocean Territory
                                        </option>

                                        <option value="Brunei">
                                            Brunei
                                        </option>

                                        <option value="Bulgaria">
                                            Bulgaria
                                        </option>

                                        <option value="Burkina Faso">
                                            Burkina Faso
                                        </option>

                                        <option value="Burundi">
                                            Burundi
                                        </option>

                                        <option value="Cambodia">
                                            Cambodia
                                        </option>

                                        <option value="Cameroon">
                                            Cameroon
                                        </option>

                                        <option value="Canada">
                                            Canada
                                        </option>

                                        <option value="Cape Verde">
                                            Cape Verde
                                        </option>

                                        <option value="Cayman Islands">
                                            Cayman Islands
                                        </option>

                                        <option value="Central African Republic">
                                            Central African Republic
                                        </option>

                                        <option value="Chad">
                                            Chad
                                        </option>

                                        <option value="Chile">
                                            Chile
                                        </option>

                                        <option value="China">
                                            China
                                        </option>

                                        <option value="Christmas Island">
                                            Christmas Island
                                        </option>

                                        <option value="Cocos (Keeling) Islands">
                                            Cocos (Keeling) Islands
                                        </option>

                                        <option value="Colombia">
                                            Colombia
                                        </option>

                                        <option value="Comoros">
                                            Comoros
                                        </option>

                                        <option value="Congo">
                                            Congo
                                        </option>

                                        <option value="Congo, The Democratic Republic of the">
                                            Congo, The Democratic Republic of the
                                        </option>

                                        <option value="Cook Islands">
                                            Cook Islands
                                        </option>

                                        <option value="Costa Rica">
                                            Costa Rica
                                        </option>

                                        <option value="Cote d'Ivoire">
                                            Cote d'Ivoire
                                        </option>

                                        <option value="Croatia">
                                            Croatia
                                        </option>

                                        <option value="Cuba">
                                            Cuba
                                        </option>

                                        <option value="Cyprus">
                                            Cyprus
                                        </option>

                                        <option value="Czech Republic">
                                            Czech Republic
                                        </option>

                                        <option value="Denmark">
                                            Denmark
                                        </option>

                                        <option value="Djibouti">
                                            Djibouti
                                        </option>

                                        <option value="Dominica">
                                            Dominica
                                        </option>

                                        <option value="Dominican Republic">
                                            Dominican Republic
                                        </option>

                                        <option value="Ecuador">
                                            Ecuador
                                        </option>

                                        <option value="Egypt">
                                            Egypt
                                        </option>

                                        <option value="El Salvador">
                                            El Salvador
                                        </option>

                                        <option value="Equatorial Guinea">
                                            Equatorial Guinea
                                        </option>

                                        <option value="Eritrea">
                                            Eritrea
                                        </option>

                                        <option value="Estonia">
                                            Estonia
                                        </option>

                                        <option value="Ethiopia">
                                            Ethiopia
                                        </option>

                                        <option value="Falkland Islands (Malvinas)">
                                            Falkland Islands (Malvinas)
                                        </option>

                                        <option value="Faroe Islands">
                                            Faroe Islands
                                        </option>

                                        <option value="Fiji">
                                            Fiji
                                        </option>

                                        <option value="Finland">
                                            Finland
                                        </option>

                                        <option value="France">
                                            France
                                        </option>

                                        <option value="French Guiana">
                                            French Guiana
                                        </option>

                                        <option value="French Polynesia">
                                            French Polynesia
                                        </option>

                                        <option value="French Southern Territories">
                                            French Southern Territories
                                        </option>

                                        <option value="Gabon">
                                            Gabon
                                        </option>

                                        <option value="Gambia">
                                            Gambia
                                        </option>

                                        <option value="Georgia">
                                            Georgia
                                        </option>

                                        <option value="Germany">
                                            Germany
                                        </option>

                                        <option value="Ghana">
                                            Ghana
                                        </option>

                                        <option value="Gibraltar">
                                            Gibraltar
                                        </option>

                                        <option value="Greece">
                                            Greece
                                        </option>

                                        <option value="Greenland">
                                            Greenland
                                        </option>

                                        <option value="Grenada">
                                            Grenada
                                        </option>

                                        <option value="Guadeloupe">
                                            Guadeloupe
                                        </option>

                                        <option value="Guam">
                                            Guam
                                        </option>

                                        <option value="Guatemala">
                                            Guatemala
                                        </option>

                                        <option value="Guernsey">
                                            Guernsey
                                        </option>

                                        <option value="Guinea">
                                            Guinea
                                        </option>

                                        <option value="Guinea-Bissau">
                                            Guinea-Bissau
                                        </option>

                                        <option value="Guyana">
                                            Guyana
                                        </option>

                                        <option value="Haiti">
                                            Haiti
                                        </option>

                                        <option value="Heard Island and McDonald Islands">
                                            Heard Island and McDonald Islands
                                        </option>

                                        <option value="Vatican City">
                                            Vatican City
                                        </option>

                                        <option value="Honduras">
                                            Honduras
                                        </option>

                                        <option value="Hong Kong">
                                            Hong Kong
                                        </option>

                                        <option value="Hungary">
                                            Hungary
                                        </option>

                                        <option value="Iceland">
                                            Iceland
                                        </option>

                                        <option value="India">
                                            India
                                        </option>

                                        <option value="Indonesia">
                                            Indonesia
                                        </option>

                                        <option value="Iran">
                                            Iran
                                        </option>

                                        <option value="Iraq">
                                            Iraq
                                        </option>

                                        <option value="Ireland">
                                            Ireland
                                        </option>

                                        <option value="Isle of Man">
                                            Isle of Man
                                        </option>

                                        <option value="Israel">
                                            Israel
                                        </option>

                                        <option value="Italy">
                                            Italy
                                        </option>

                                        <option value="Jamaica">
                                            Jamaica
                                        </option>

                                        <option value="Japan">
                                            Japan
                                        </option>

                                        <option value="Jersey">
                                            Jersey
                                        </option>

                                        <option value="Jordan">
                                            Jordan
                                        </option>

                                        <option value="Kazakhstan">
                                            Kazakhstan
                                        </option>

                                        <option value="Kenya">
                                            Kenya
                                        </option>

                                        <option value="Kiribati">
                                            Kiribati
                                        </option>

                                        <option value="North Korea">
                                            North Korea
                                        </option>

                                        <option value="South Korea">
                                            South Korea
                                        </option>

                                        <option value="Kuwait">
                                            Kuwait
                                        </option>

                                        <option value="Kyrgyzstan">
                                            Kyrgyzstan
                                        </option>

                                        <option value="Laos">
                                            Laos
                                        </option>

                                        <option value="Latvia">
                                            Latvia
                                        </option>

                                        <option value="Lebanon">
                                            Lebanon
                                        </option>

                                        <option value="Lesotho">
                                            Lesotho
                                        </option>

                                        <option value="Liberia">
                                            Liberia
                                        </option>

                                        <option value="Libya">
                                            Libya
                                        </option>

                                        <option value="Liechtenstein">
                                            Liechtenstein
                                        </option>

                                        <option value="Lithuania">
                                            Lithuania
                                        </option>

                                        <option value="Luxembourg">
                                            Luxembourg
                                        </option>

                                        <option value="Macao">
                                            Macao
                                        </option>

                                        <option value="Macedonia, The Former Yugoslav Republic of">
                                            Macedonia, The Former Yugoslav Republic of
                                        </option>

                                        <option value="Madagascar">
                                            Madagascar
                                        </option>

                                        <option value="Malawi">
                                            Malawi
                                        </option>

                                        <option value="Malaysia">
                                            Malaysia
                                        </option>

                                        <option value="Maldives">
                                            Maldives
                                        </option>

                                        <option value="Mali">
                                            Mali
                                        </option>

                                        <option value="Malta">
                                            Malta
                                        </option>

                                        <option value="Marshall Islands">
                                            Marshall Islands
                                        </option>

                                        <option value="Martinique">
                                            Martinique
                                        </option>

                                        <option value="Mauritania">
                                            Mauritania
                                        </option>

                                        <option value="Mauritius">
                                            Mauritius
                                        </option>

                                        <option value="Mayotte">
                                            Mayotte
                                        </option>

                                        <option value="Mexico">
                                            Mexico
                                        </option>

                                        <option value="Micronesia, Federated States of">
                                            Micronesia, Federated States of
                                        </option>

                                        <option value="Moldova">
                                            Moldova
                                        </option>

                                        <option value="Monaco">
                                            Monaco
                                        </option>

                                        <option value="Mongolia">
                                            Mongolia
                                        </option>

                                        <option value="Montenegro">
                                            Montenegro
                                        </option>

                                        <option value="Montserrat">
                                            Montserrat
                                        </option>

                                        <option value="Morocco">
                                            Morocco
                                        </option>

                                        <option value="Mozambique">
                                            Mozambique
                                        </option>

                                        <option value="Myanmar">
                                            Myanmar
                                        </option>

                                        <option value="Namibia">
                                            Namibia
                                        </option>

                                        <option value="Nauru">
                                            Nauru
                                        </option>

                                        <option value="Nepal">
                                            Nepal
                                        </option>

                                        <option value="Netherlands">
                                            Netherlands
                                        </option>

                                        <option value="Netherlands Antilles">
                                            Netherlands Antilles
                                        </option>

                                        <option value="New Caledonia">
                                            New Caledonia
                                        </option>

                                        <option value="New Zealand">
                                            New Zealand
                                        </option>

                                        <option value="Nicaragua">
                                            Nicaragua
                                        </option>

                                        <option value="Niger">
                                            Niger
                                        </option>

                                        <option value="Nigeria">
                                            Nigeria
                                        </option>

                                        <option value="Niue">
                                            Niue
                                        </option>

                                        <option value="Norfolk Island">
                                            Norfolk Island
                                        </option>

                                        <option value="Northern Mariana Islands">
                                            Northern Mariana Islands
                                        </option>

                                        <option value="Norway">
                                            Norway
                                        </option>

                                        <option value="Oman">
                                            Oman
                                        </option>

                                        <option value="Pakistan">
                                            Pakistan
                                        </option>

                                        <option value="Palau">
                                            Palau
                                        </option>

                                        <option value="Palestine, State of">
                                            Palestine, State of
                                        </option>

                                        <option value="Panama">
                                            Panama
                                        </option>

                                        <option value="Papua New Guinea">
                                            Papua New Guinea
                                        </option>

                                        <option value="Paraguay">
                                            Paraguay
                                        </option>

                                        <option value="Peru">
                                            Peru
                                        </option>

                                        <option value="Philippines">
                                            Philippines
                                        </option>

                                        <option value="Pitcairn">
                                            Pitcairn
                                        </option>

                                        <option value="Poland">
                                            Poland
                                        </option>

                                        <option value="Portugal">
                                            Portugal
                                        </option>

                                        <option value="Puerto Rico">
                                            Puerto Rico
                                        </option>

                                        <option value="Qatar">
                                            Qatar
                                        </option>

                                        <option value="Reunion">
                                            Reunion
                                        </option>

                                        <option value="Romania">
                                            Romania
                                        </option>

                                        <option value="Russia">
                                            Russia
                                        </option>

                                        <option value="Rwanda">
                                            Rwanda
                                        </option>

                                        <option value="Saint Barthelemy">
                                            Saint Barthelemy
                                        </option>

                                        <option value="Saint Helena">
                                            Saint Helena
                                        </option>

                                        <option value="Saint Kitts and Nevis">
                                            Saint Kitts and Nevis
                                        </option>

                                        <option value="Saint Lucia">
                                            Saint Lucia
                                        </option>

                                        <option value="Saint Martin">
                                            Saint Martin
                                        </option>

                                        <option value="Saint Pierre and Miquelon">
                                            Saint Pierre and Miquelon
                                        </option>

                                        <option value="Saint Vincent and the Grenadines">
                                            Saint Vincent and the Grenadines
                                        </option>

                                        <option value="Samoa">
                                            Samoa
                                        </option>

                                        <option value="San Marino">
                                            San Marino
                                        </option>

                                        <option value="Sao Tome and Principe">
                                            Sao Tome and Principe
                                        </option>

                                        <option value="Saudi Arabia">
                                            Saudi Arabia
                                        </option>

                                        <option value="Senegal">
                                            Senegal
                                        </option>

                                        <option value="Serbia">
                                            Serbia
                                        </option>

                                        <option value="Seychelles">
                                            Seychelles
                                        </option>

                                        <option value="Sierra Leone">
                                            Sierra Leone
                                        </option>

                                        <option value="Singapore">
                                            Singapore
                                        </option>

                                        <option value="Slovakia">
                                            Slovakia
                                        </option>

                                        <option value="Slovenia">
                                            Slovenia
                                        </option>

                                        <option value="Solomon Islands">
                                            Solomon Islands
                                        </option>

                                        <option value="Somalia">
                                            Somalia
                                        </option>

                                        <option value="South Africa">
                                            South Africa
                                        </option>

                                        <option value="South Georgia and the South Sandwich Islands">
                                            South Georgia and the South Sandwich Islands
                                        </option>

                                        <option value="South Sudan">
                                            South Sudan
                                        </option>

                                        <option value="Spain">
                                            Spain
                                        </option>

                                        <option value="Sri Lanka">
                                            Sri Lanka
                                        </option>

                                        <option value="Sudan">
                                            Sudan
                                        </option>

                                        <option value="Suriname">
                                            Suriname
                                        </option>

                                        <option value="Svalbard and Jan Mayen">
                                            Svalbard and Jan Mayen
                                        </option>

                                        <option value="Swaziland">
                                            Swaziland
                                        </option>

                                        <option value="Sweden">
                                            Sweden
                                        </option>

                                        <option value="Switzerland">
                                            Switzerland
                                        </option>

                                        <option value="Syria">
                                            Syria
                                        </option>

                                        <option value="Taiwan">
                                            Taiwan
                                        </option>

                                        <option value="Tajikistan">
                                            Tajikistan
                                        </option>

                                        <option value="Tanzania">
                                            Tanzania
                                        </option>

                                        <option value="Thailand">
                                            Thailand
                                        </option>

                                        <option value="Timor-Leste">
                                            Timor-Leste
                                        </option>

                                        <option value="Togo">
                                            Togo
                                        </option>

                                        <option value="Tokelau">
                                            Tokelau
                                        </option>

                                        <option value="Tonga">
                                            Tonga
                                        </option>

                                        <option value="Trinidad and Tobago">
                                            Trinidad and Tobago
                                        </option>

                                        <option value="Tunisia">
                                            Tunisia
                                        </option>

                                        <option value="Turkey">
                                            Turkey
                                        </option>

                                        <option value="Turkmenistan">
                                            Turkmenistan
                                        </option>

                                        <option value="Turks and Caicos Islands">
                                            Turks and Caicos Islands
                                        </option>

                                        <option value="Tuvalu">
                                            Tuvalu
                                        </option>

                                        <option value="Uganda">
                                            Uganda
                                        </option>

                                        <option value="Ukraine">
                                            Ukraine
                                        </option>

                                        <option value="United Arab Emirates">
                                            United Arab Emirates
                                        </option>

                                        <option value="United Kingdom">
                                            United Kingdom
                                        </option>

                                        <option value="United States Minor Outlying Islands">
                                            United States Minor Outlying Islands
                                        </option>

                                        <option value="Uruguay">
                                            Uruguay
                                        </option>

                                        <option value="Uzbekistan">
                                            Uzbekistan
                                        </option>

                                        <option value="Vanuatu">
                                            Vanuatu
                                        </option>

                                        <option value="Venezuela">
                                            Venezuela
                                        </option>

                                        <option value="Vietnam">
                                            Vietnam
                                        </option>

                                        <option value="Virgin Islands, British">
                                            Virgin Islands, British
                                        </option>

                                        <option value="Virgin Islands, U.S.">
                                            Virgin Islands, U.S.
                                        </option>

                                        <option value="Wallis and Futuna">
                                            Wallis and Futuna
                                        </option>

                                        <option value="Kosovo">
                                            Kosovo
                                        </option>

                                        <option value="Western Sahara">
                                            Western Sahara
                                        </option>

                                        <option value="Yemen">
                                            Yemen
                                        </option>

                                        <option value="Zambia">
                                            Zambia
                                        </option>

                                        <option value="Zimbabwe">
                                            Zimbabwe
                                        </option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Zip Code</label>
                                    <input type="text" name="zipcode" class="form-control" id="exampleInputUser" value="${sessionScope.user.zipCode}">
                                </div>
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
        </div>
    </body>
</html>
