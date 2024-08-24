https://developer.apple.com/support/code-signing/

https://developer.apple.com/library/archive/documentation/Security/Conceptual/CodeSigningGuide/Procedures/Procedures.html#//apple_ref/doc/uid/TP40005929-CH4-SW2


Check your identity:

    security find-identity -v -p codesigning

Assumed you want to sign the `xdcx` binary:

    # Developer ID Application: XX YY (ID)
    codesign -s ID FILE
    codesign -s ID FILE

Check the result:

    codesign -dvvvv FILE
