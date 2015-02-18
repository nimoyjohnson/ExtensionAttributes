# JSS Computer Extension Attribute.

AttributesComputer extension attributes are custom fields that you can create to collect almost any type of data from a computer. For example, you can create an extension attribute to collect the host name of a computer or collect data about the activity of the company’s antivirus software.

There are several ways to create a computer extension attribute in the JAMF Software Server (JSS). You can manually create the extension attribute, use an extension attribute template available in the JSS, or upload an extension attribute template obtained from JAMF Nation.

When you create a computer extension attribute, you specify the following information:
-Type of data being collected, such as string, integer, or date 
-Inventory category in which to display the extension attribute in the JSS, such as Hardware or Operating System
-Input type, which determines how the extension attribute is populated with dataPane on which to display the extension attribute in Recon (text field and pop-up menu input types only)
-Script to use to collect data from computers (script input type only)

Extension attributes can add time and network traffic to the inventory process depending on the type of data you choose to collect and the input type used to collect it.

## Computer Extension Attribute Input Types

You can choose to populate the value of a computer extension attribute using any of the following input types:
- **Text field** This displays a text field in Recon and in computer inventory information. You can enter a value in the field when enrolling a computer using Recon, or at any time using the JSS. Only extension attributes created manually can be populated using a text field.

- **Pop-up menu** This displays a pop-up menu in Recon and in computer inventory information. You can choose a value from the pop-up menu when enrolling a computer using Recon, or at any time using the JSS. Only extension attributes created manually can be populated using a pop-up menu.

- **Script** This allows you to run a script that populates the extension attribute each time a computer submits inventory to the JSS. Extension attributes created manually can be populated by a script. Extension attributes created from a template are always populated by a script.

- **LDAP Attribute Mapping** This populates the extension attribute with the value for an LDAP attribute. It also generates a variable that can be used to populate configuration profile settings with values for the LDAP attribute. The variable is $EXTENSIONATTRIBUTE_<#>, where <#> is the extension attribute ID.

### Computer Extension Attributes Populated by a Script

When an extension attribute is populated by a script, the text between the `<result></result>` tag is stored in the JSS.
For OS X computers, scripts can be written in any language that has an interpreter installed. 
The most common interpreters are:/bin/bash/bin/sh/usr/bin/perl/usr/bin/python

All scripts must start with a shebang (#!) followed by the absolute path to the interpreter. 
For example, the script for an extension attribute that collects the host name from OS X computers looks like this:
`#!/bin/shecho "<result>`hostname 2>&1`</result>"`
