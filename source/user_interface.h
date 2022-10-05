#ifndef __USER_INTERFACE_H__
#define __USER_INTERFACE_H__
#include <gtk/gtk.h>

#define __END_OF_RECORD__ -1

extern GtkBuilder* builder;

void show_error(char *msg);

void show_info(char *msg);

void init_info();

#endif // __USER_INTERFACE_H__
