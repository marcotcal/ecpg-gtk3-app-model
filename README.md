# ecpg-gtk3-app-model
This is an application template to create C applications using embedded SQL and GTK3 Library


This project is based on https://github.com/Trainraider/gtk3-glade-c-template (configuration, makefile and structure). 
The original project was modified to include PostgreSQL libraries and ecpg pre-compiler rules. 

Addapted to use ecpg pre-compiler

The goal of this project is to be a start template for applications accessing PostgreSQL using ecpg pre-compiler. 
GTK3 was used for the graphical user interface, Glade was used for design but of coarse it is not mandatory.
The .glade file is included on the target executable as a resource.

A list of databases was included only as an example. I didn't include the integer fields of indicators of NULL values but 
it is easy to include them.

I hope this project can help as an example of ecpg use.
