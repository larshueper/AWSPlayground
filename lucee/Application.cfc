/**
 * Created with IntelliJ IDEA.
 * User: larshueper
 * Date: 21.02.16
 * Time: 12:39
*/
component {
    this.datasources["luceedb"] = {
        class: 'org.gjt.mm.mysql.Driver'
        , connectionString: 'jdbc:mysql://lhplayground-mysql.caiv4l8emws2.eu-west-1.rds.amazonaws.com:3306/luceedb?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true'
        , username: 'lhadmin'
        , password: "encrypted:a6e1b2b39302afe5ec96af8384a4ba701cb473c12bb4cdcf8d167cc52cc8a6c2"
        , clob:true
    };

    public void function onRequestStart() {
        url.util = createObject("component", "util").init();
    }
}
