#ifndef __FIELDS_H__
#define __FIELDS_H__
#include <gtk/gtk.h>

/** 
 	set functions 
 **/

void set_text_value(const gchar* field_name, char *value);

void set_entry_value(const gchar* field_name, char *value);

void set_spinner_value(const gchar* field_name, double value);

void set_combobox_value(const gchar* field_name, char* value);

/** 
 	get functions 
 **/

// need to free the pointer after use
gchar *get_text_value(const gchar* field_name);

const gchar* get_entry_value(const gchar* field_name);

double get_spinner_value(const gchar* field_name);

// need to free the pointer after use
gchar* get_combobox_str_value(const gchar* field_name, int column);

int get_combobox_int_value(const gchar* field_name, int column);

#endif // __FIELDS_H__
