<%-- 
    Document   : Setting_Theme
    Created on : Nov 8, 2018, 4:58:53 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Theme | Cart-Commerce</title>
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
                            <a href="Setting_Profile" class="list-group-item list-group-item-action">Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action">Account</a>
                            <a href="Setting_Security" class="list-group-item list-group-item-action">Security</a>
                            <a href="#" class="list-group-item list-group-item-action">Wishlist</a>
                            <a href="#" class="list-group-item list-group-item-action">View Cart</a>
                            <a href="#" class="list-group-item list-group-item-action">Purchase History</a>
                        </div>
                    </div>
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">More Setting</h5>
                            <a href="Setting_Theme" class="list-group-item list-group-item-action active">Theme</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <h1>Theme</h1>
                    <hr>
                    <center>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'yeti' or empty cookie.theme.value ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Yeti</b></h5>
                                                <h6 class="card-subtitle">A friendly foundation</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/yeti/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=yeti">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'cerulean' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Cerulean</b></h5>
                                                <h6 class="card-subtitle">A calm blue sky</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/cerulean/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=cerulean">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'cosmo' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Cosmo</b></h5>
                                                <h6 class="card-subtitle">An ode to metro</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/cosmo/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=cosmo">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'cyborg' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Cyborg</b></h5>
                                                <h6 class="card-subtitle">Jet black and electric blue</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/cyborg/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=cyborg">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'darkly' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Darkly</b></h5>
                                                <h6 class="card-subtitle">Flatly in night mode</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/darkly/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=darkly">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'flatly' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Flatly</b></h5>
                                                <h6 class="card-subtitle">Flat and modern</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/flatly/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=flatly">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'journal' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Journal</b></h5>
                                                <h6 class="card-subtitle">Crisp like a new sheet of paper</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/journal/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=journal">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'litera' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Litera</b></h5>
                                                <h6 class="card-subtitle">The medium is the message</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/litera/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=litera">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'lumen' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Lumen</b></h5>
                                                <h6 class="card-subtitle">Light and shadow</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/lumen/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=lumen">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'lux' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Lux</b></h5>
                                                <h6 class="card-subtitle">A touch of class</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/lux/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=lux">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'materia' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Materia</b></h5>
                                                <h6 class="card-subtitle">Material is the metaphor</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/materia/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=materia">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'minty' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Minty</b></h5>
                                                <h6 class="card-subtitle">A fresh feel</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/minty/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=minty">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'pulse' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Pulse</b></h5>
                                                <h6 class="card-subtitle">A trace of purple</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/pulse/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=pulse">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'sandstone' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Sandstone</b></h5>
                                                <h6 class="card-subtitle">A touch of warmth</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/sandstone/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=sandstone">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'simplex' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Simplex</b></h5>
                                                <h6 class="card-subtitle">Mini and minimalist</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/simplex/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=simplex">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'sketchy' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Sketchy</b></h5>
                                                <h6 class="card-subtitle">A hand-drawn look for mockups and mirth</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/sketchy/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=sketchy">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'slate' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Slate</b></h5>
                                                <h6 class="card-subtitle">Shades of gunmetal gray</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/slate/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=slate">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'solar' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Solar</b></h5>
                                                <h6 class="card-subtitle">A spin on Solarized</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/solar/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=solar">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'spacelab' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Spacelab</b></h5>
                                                <h6 class="card-subtitle">Silvery and sleek</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/spacelab/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=spacelab">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'superhero' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Superhero</b></h5>
                                                <h6 class="card-subtitle">The brave and the blue</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/superhero/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=superhero">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'united' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>United</b></h5>
                                                <h6 class="card-subtitle">Ubuntu orange and unique font</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/united/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=united">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </center>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>