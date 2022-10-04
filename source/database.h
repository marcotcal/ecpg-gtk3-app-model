#ifndef __DATABASE_H__
#define __DATABASE_H__
#include <libpq-fe.h>

// In case you want to use libpq directly 
// extern PGconn* conn;

void show_database_error ();

void connect_db();

#endif // __DATABASE_H__
