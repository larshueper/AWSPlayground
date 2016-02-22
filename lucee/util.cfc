/**
 * Created with IntelliJ IDEA.
 * User: larshueper
 * Date: 21.02.16
 * Time: 14:43
*/
component {
    public util function init() {
        return this;
    }

    public string function errorMessageAsHTML(required any exception)
    {
        var returnValue = '';
        returnValue &= '<p><strong>ERROR:</strong><table><tr><td><strong>Type</strong></td><td>';
        returnValue &= arguments.exception.type;
        returnValue &= '</td></tr><tr><td><strong>Message</strong></td><td>';
        returnValue &= arguments.exception.message;
        returnValue &= '</td></tr></table>';
        return returnValue;
    }
}
