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
        , password: "encrypted:373628f3978e1e475f2c7b43573d6849a92a08acb075e92a9173ca83aba29d6e0704e0472fb83c0b"
        , clob:true
    };

    public void function onRequestStart() {
        url.util = createObject("component", "util").init();
    }
}
