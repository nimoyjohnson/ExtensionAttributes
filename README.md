JSS Computer Extension Attribute.

Are input TypesYou can choose to populate the value of a computer extension attribute using any of the following input types: 
Text field—This displays a text field in Recon and in computer inventory information. 
You can enter a value in the field when enrolling a computer using Recon, or at any time using the JSS. 
Only extension attributes created manually can be populated using a text field.
Pop-up menu—This displays a pop-up menu in Recon and in computer inventory information. 
You can choose a value from the pop-up menu when enrolling a computer using Recon, or at any time using the JSS. 
Only extension attributes created manually can be populated using a pop-up menu.
Script—This allows you to run a script that populates the extension attribute each time a computer submits inventory to the JSS. 
Extension attributes created manually can be populated by a script. 
Extension attributes created from a template are always populated by a script.
LDAP Attribute Mapping—This populates the extension attribute with the value for an LDAP attribute. 
It also generates a variable that can be used to populate configuration profile settings with values for the LDAP attribute. 
The variable is $EXTENSIONATTRIBUTE_<#>, where <#> is the extension attribute ID. 
For more information on payload variables for configuration profiles, see OS X Configuration Profiles.
161
Computer Extension Attributes Populated by a Script When an extension attribute is populated by a script, 
the text between the <result></result> tag is stored in the JSS.
For OS X computers, scripts can be written in any language that has an interpreter installed. 
The most common interpreters are:/bin/bash/bin/sh/usr/bin/perl/usr/bin/python
All scripts must start with a shebang (#!) followed by the absolute path to the interpreter. 
For example, the script for an extension attribute that collects the host name from OS X computers looks like this:
#!/bin/shecho "<result>`hostname 2>&1`</result>"