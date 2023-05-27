<%@ page import="linksharing.ResourceRating" %>
<div class="row">
    <div class="col-4">
        <g:img dir="images" id="profilePhoto"  file="${link.createdBy.photo}" width="120" height="120"/>
    </div>
    <div class="col">
        <div class="row">
            <div class="col">
            <h4>${link.createdBy.firstName} ${link.createdBy.lastName}</h4>
            </div>
            <div class="col">
                <h4>${link.topic.name}</h4>
            </div>
        </div>
        <div class="row">
            <div class="col">
            <h5>@${link.createdBy.userName}</h5>
            </div>
            <div class="col">
                <div>
                    <g:form controller="viewPost">
                        <fieldset class="form">
                            <label for="score">Rating:</label>
                            <input type="range" name="score" id="score" min="1" max="5" value="${ratingScore}" step="1"
                                   oninput="this.nextElementSibling.value = this.value" required>
                            <output>${ratingScore}</output>
                            <div class="hidden">
                                <label for="userId">User:</label>
                                <input name="userId" id="userId" type="text" value="${session.user.id}">
                                <label for="resourceId">Resource:</label>
                                <input name="resourceId" id="resourceId" type="text" value="${link.id}">
                            </div>
                        </fieldset>
                        <g:actionSubmit value="Rate" action="rate" class="btn btn-primary"/>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <p>${link.description}</p>
</div>