/**
 * Created with IntelliJ IDEA.
 * User: larshueper
 * Date: 21.02.16
 * Time: 12:39
*/
component {
    public void function onRequestStart() {
        url.util = createObject("component", "util").init();
    }
}
