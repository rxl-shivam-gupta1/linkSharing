<!DOCTYPE html>
<html>
    <body>
    <div>
            <g:form controller="viewPost">
                <fieldset class="form">
                    <input type="range" name="score" id="score" min="1" max="5" value="1" step="1"
                           oninput="this.nextElementSibling.value = this.value" required>
                    <output>1</output>
                    <div class="hidden">
                        <input name="userId" id="userId" type="text" value="${session.user.id}">
                        <input name="topicId" id="topicId" type="text" value="${topicId}">
                    </div>
                </fieldset>
                <g:actionSubmit value="Rate" action="rate" class="btn btn-primary"/>
            </g:form>
        </div>
    </body>
</html>
