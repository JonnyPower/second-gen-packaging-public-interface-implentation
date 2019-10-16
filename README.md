# Issue with 2GP and Interfaces

Repository built for Chatter post as below:

> Struggling with the @NamespaceAccessible annotation and interface implementations.
> 
> In a downstream package I have a class that implements an interface from an upstream package, where the interface is as follows;
>
>     @NamespaceAccessible
>     public interface IXMLTranslatable {
>        void toXML(DOM.XmlNode parentNode);
>     }
> Packaging of the downstream package fails with:
> 
> "Method is not visible: void TPAY2.IXMLTranslatable.toXML(dom.XmlNode)"
> 
> However, you can not add the annotation to the interface method, doing so results in the following deployment error:
> 
> "IXMLTranslatable.cls  Expecting '}' but was: '@' (3:2)"
> 
>I tried adding the annotation to the implementing class (although I don't think that would make sense?) and even still, the packaging error persists. This blocks being able to package.

https://partners.salesforce.com/_ui/core/chatter/groups/GroupProfilePage?g=0F93A000000HXAq&fId=0D53A00004d1WbS

# Building package-01

```
λ sfdx force:package:version:create -p jpower-case-package-01 -k foobar -b second-gen-packaging-public-interface-implentation -
w 120 --json
{
  "status": 0,
  "result": {
    "Id": "08c0c000000k9jvAAA",
    "Status": "Success",
    "Package2Id": "0Ho0c000000Kyk9CAC",
    "Package2VersionId": "05i0c000000fxYJAAY",
    "SubscriberPackageVersionId": "04t0c000001ZeKoAAK",
    "Tag": null,
    "Branch": "second-gen-packaging-public-interface-implentation",
    "Error": [],
    "CreatedDate": "2019-10-16 09:14"
  }
}
```

# Error when building package-02

```
λ sfdx force:package:version:create -p jpower-case-package-managed-02 -k foobar -b second-gen-packaging-public-interface-implen
tation -w 120 --json
{
    "status": 1,
    "name": "Error",
    "message": "Foo: Method is not visible: void TPAY2_TEST.IBar.bar(),Foo: Method is not visible: void TPAY2_TEST.IFoo.foo()",
    "exitCode": 1,
    "commandName": "PackageVersionCreateCommand",
    "stack": "Error: Foo: Method is not visible: void TPAY2_TEST.IBar.bar(),Foo: Method is not visible: void TPAY2_TEST.IFoo.fo
o()\n    at packageVersionCreateRequestApi.byId.then (C:\\Users\\jpower\\AppData\\Local\\sfdx\\client\\7.26.0-9118501918\\node_
modules\\salesforce-alm\\dist\\lib\\package\\packageVersionCreateCommand.js:427:27)\n    at process._tickCallback (internal/pro
cess/next_tick.js:68:7)\nOuter stack:\n    at Function.wrap (C:\\Users\\jpower\\AppData\\Local\\sfdx\\client\\7.26.0-9118501918
\\node_modules\\@salesforce\\core\\lib\\sfdxError.js:151:27)\n    at PackageVersionCreateCommand.catch (C:\\Users\\jpower\\AppD
ata\\Local\\sfdx\\client\\7.26.0-9118501918\\node_modules\\salesforce-alm\\dist\\ToolbeltCommand.js:247:46)",
    "warnings": []
}
```