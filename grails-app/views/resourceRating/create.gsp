<!DOCTYPE html>
<html>
    <body>
    <div>
            <g:form resource="${this.resourceRating}" method="POST">
                <fieldset class="form">
                    <input type="range" name="score" id="score" min="1" max="5" value="1" step="1"
                           oninput="this.nextElementSibling.value = this.value" required>
                    <output>1</output>
                    <div class="hidden">
                    <f:field property="user">${session.user}</f:field>
                    </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
